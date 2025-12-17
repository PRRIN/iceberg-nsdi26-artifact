# SPICE language Design Doc

This is a document on the design of the SPecification language in ICEberg, SPICE.

### What's wrong with the old design?

Here is the grammar for the old SPEC, in ANTLR grammar:
```java
grammar spec;

ENUMSYMBOL: SCHAR+;
TSYMBOL: SCHAR CHAR+;
VSYMBOL: LCHAR CHAR*;
INTLITERAL: ('0'..'9')+;
BVLITERAL: ('-')? INTLITERAL 'w' INTLITERAL;
LOCATION: '"' (CHAR | ':' | '.' | '*')+ '"';
fragment SCHAR: 'A'..'Z';
fragment LCHAR: 'a'..'z' | '%' | '@';
fragment CHAR: SCHAR | LCHAR | '_' | INTLITERAL;

CM: '//' .*? [\n\r] -> skip;
WS: [ \t\n\r]+ -> skip;

prog
  : decl+ EOF
  ;

decl
  : ty_decl
  | func_decl
  | method_decl
  ;

ty_decl
  : enum_decl
  | struct_decl
  ;

enum_decl
  : 'enum' TSYMBOL '{' (ENUMSYMBOL ';')+ '}'
  ;

struct_decl
  : 'struct' TSYMBOL '{' (VSYMBOL ':' ty_annotation ';')+ '}'
  ;

ty_annotation
  : 'Void'                          #TyAnnotationVoid
  | TSYMBOL                         #TyAnnotationSymbol
  | 'List' '[' ty_annotation ']'    #TyAnnotationList
  | 'Union' '[' ty_annotation ('|' ty_annotation)+ ']'  #TyAnnotationUnion
  | 'i8'                            #TyAnnotationBV
  ;

func_modifier
  : 'inline'
  ;

func_decl
  : 'function' ty_annotation VSYMBOL '(' VSYMBOL ':' ty_annotation (',' VSYMBOL ':' ty_annotation)* ')' '{' exp '}'     #funcDeclBody
  | func_modifier+ func_decl                                                                                            #funcDeclModifier
  ;

exp
  : 'true'                                          #expTrue
  | 'false'                                         #expFalse
  | 'havoc'                                         #expHavoc
  | 'List' '[' (exp (',' exp)*)? ']'                #expList
  | '[]'                                            #expNil
  | 'null'                                          #expNull
  | 'zext' ty_annotation exp 'to' ty_annotation     #expZext
  | exp ('+' | '-' | '&' | '|' | '^') exp           #expArith
  | 'not' exp                                       #expNot
  | exp ('and' | 'or') exp                          #expBoolOp
  | LOCATION                                        #expLocation
  | VSYMBOL                                         #expVar
  | BVLITERAL                                       #expBVLiteral
  | INTLITERAL                                      #expIntLiteral
  | TSYMBOL '.' ENUMSYMBOL                          #expEnumLiteral
  | '(' exp ')'                                     #expParen
  | 'if' exp '{' exp '}' 'else' '{' exp '}'         #expBranch
  | VSYMBOL '(' ( | exp (',' exp)*) ')'             #expCall
  | exp '[' exp ':' exp ']'                         #expSubList
  | exp '[' exp ']'                                 #expSubscript
  | exp '.' VSYMBOL                                 #expField
  | ('let' VSYMBOL (':' ty_annotation)? ':=' exp 'in')+ exp         #expLet
  | TSYMBOL '(' VSYMBOL '=' exp (',' VSYMBOL '=' exp)* ')'    #expStructInstantiation
  | TSYMBOL '(' INTLITERAL '=' exp (',' INTLITERAL '=' exp)* ')'    #expGoStructInstantiation
  | exp ('>=' | '<=' | '==' | '<' | '>' | '!=' | '>=S' | '<=S' | '<S' | '>S' ) exp    #expCompare
  | 'lambda' exp '->' exp                           #expLambda
  ;

method_decl
  : 'method' ty_annotation VSYMBOL '(' ')' '{' stmt_block '}'                #methodDeclBody
  ;

stmt_block
  : stmt*                                           #stmtBlock
  ;

stmt
  : 'panic' ';'                                     #StmtPanic
  | exp ':=' exp ';'                                #stmtAssignment
  | 'call' exp ';'                                  #stmtCall
  | 'if' exp '{' stmt_block '}' 'else' '{' stmt_block '}'    #stmtBranch
  | 'select' '{' ('when' exp '{' stmt_block '}')+ '}'     #stmtSelect
  ;
```

Its major problems are:

* **Weak type system.** The types in `ty_annotation` fall short of the actual types of `Exp`s. Perhaps more importantly - they are not enforced at all! The old SPEC parser, at least to my knowledge, does not check types. This leaves the problem to the middleend, where you get random panics during SE - not great to debug.

* **Concept of "method"**. In the old SPEC, `function`s are pure functions (no side-effects), while `method`s describe side effects. 
IMO this is non-intuitive naming to start with. Moreover, the side effects in `method`s are not well thought out either. 
    * `if-else` is practically a weaker `select`, and I don't think this distinction is that much needed.
    * `panic` makes no sense if it is not the only `stmt` in a block - the branch panics anyway.
    * Assignment is a poor way to express the modification to external state. The idea of using special names and a shim layer of `Exp::Var`s is generally error-prone and hinders automation.
    * Lack of arguments and return values. 

Some lesser issues include:

* **Bad toolchain**. No compiler prompts at all, so it is very hard to write SPEC manually.

* **Ugly grammar**. The original grammar seems a mix of Python and Java, but is sketchy at some places.


### What are we doing instead?

There was a misalignment between the old SPEC's **two roles**: it was both a language written in a functional programming way, and a target of automatic summary with an imperative approach. 

The thing is: even if both roles require their own language, they need not be the same one as the purpose differs massively.

Instead, I think we are better off **restraining SPEC only for the former use case**: developers use it to write specifications for certain modules (those that can be summarized without the concept of states). The latter use, since it is read-write for the machine, and read-only for developers, can be covered with **serialization** (`serde` time!).

#### Gains

* SPEC design is now much lighter. Its expressiveness is not harmed (I believe it is still Turing-complete).

* Removing cheesy hacks. These include binding internal values with special names, calling special built-ins, and writing glue code everywhere. Anything that does not have a manual SPEC is summarized - in the format described below - using internal encodings that hopefully are more precise and robust. 

* Specialized encoding for summaries. By separating summary from SPEC, we can tailor it more easily. The reasonable thing seems to introduce a `Effect` concept into the middleend code, and let summaries be the deserialized version of that. Since the deserialized text is never modified by developers, we need not worry about checking for its validity, designing grammars, etc.

#### Losses

* Non-displayed summary hinders debugging. If we choose not to dump the summary for a certain module, it becomes hard to debug the SE engine if problem occurs.

* (*More importantly*) What if developers do want to write side-effect included SPEC for certain modules?
Without any side-effects, the scope of functions that SPEC can represent is massively reduced: many functions likely modify global states, and passing aggregates using pointers (thus involving memory R/W) is a pervasive pattern. What if a function is conceptually suitable for a manual SPEC (e.g. it compares two domain names; but the implementation uses pointers and memory R/W), but SPEC cannot be used?
**A potential solution**: allow for pseudo prologues and epilogues within a piece of SPEC. Prologues would be a series of load directives; epilogues a series of stores; and they express the inital dependency and the final effects of a SPEC function. The difference from allowing for load/stores everywhere is that these are not instructions - only directives for the SE engine.
> This sounds OK on paper. May have to experiment to see if it is another cheesy design.

