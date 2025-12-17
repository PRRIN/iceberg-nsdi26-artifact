//! The `panicky` procedural macro; used internally by Iceberg.

extern crate proc_macro;

use proc_macro::{Delimiter, Group, Ident, Punct, Spacing, Span, TokenStream, TokenTree};

#[proc_macro_attribute]
pub fn panicky(info: TokenStream, item: TokenStream) -> TokenStream {
    let mut output: Vec<TokenTree> = Vec::new();

    let mut items = item.into_iter().peekable();
    assert!(items.peek().is_some(), "`panicky` requires a function body");
    let mut body = None;
    while let Some(tk) = items.next() {
        if items.peek().is_some() {
            output.push(tk);
        } else {
            _ = body.insert(tk);
        }
    }

    let TokenTree::Group(g) = body.unwrap() else {
        panic!("`panicky` requires a function body")
    };
    output.push(TokenTree::Group(Group::new(
        Delimiter::Brace,
        replace_with_panic(g.stream(), &info),
    )));
    TokenStream::from_iter(output.into_iter())
}

/// Replace all `??` with `.unwrap_or_else(|p| p.panic(INFO))`
fn replace_with_panic(input: TokenStream, info: &TokenStream) -> TokenStream {
    let mut output: Vec<TokenTree> = Vec::new();
    let mut is_question_mark = false;
    for token in input {
        match token {
            TokenTree::Group(g) => {
                let stream = replace_with_panic(g.stream(), info);
                output.push(TokenTree::Group(Group::new(g.delimiter(), stream)));
                is_question_mark = false;
            }

            TokenTree::Punct(ref p) if p.as_char() == '?' => {
                if is_question_mark {
                    // Two question marks in a row
                    _ = output.pop(); // ..pop the previous `?`
                    output.push(TokenTree::Punct(Punct::new('.', Spacing::Alone)));
                    output.push(TokenTree::Ident(Ident::new(
                        "unwrap_or_else",
                        Span::call_site(),
                    )));
                    output.push(TokenTree::Group(Group::new(Delimiter::Parenthesis, {
                        let stream = vec![
                            TokenTree::Punct(Punct::new('|', Spacing::Alone)),
                            TokenTree::Ident(Ident::new("p", Span::call_site())),
                            TokenTree::Punct(Punct::new('|', Spacing::Alone)),
                            TokenTree::Ident(Ident::new("p", Span::call_site())),
                            TokenTree::Punct(Punct::new('.', Spacing::Alone)),
                            TokenTree::Ident(Ident::new("panic", Span::call_site())),
                            TokenTree::Group(Group::new(Delimiter::Parenthesis, info.clone())),
                        ];
                        TokenStream::from_iter(stream.into_iter())
                    })));
                    is_question_mark = false;
                } else {
                    output.push(token);
                    is_question_mark = true;
                }
            }
            TokenTree::Ident(_) | TokenTree::Literal(_) | TokenTree::Punct(_) => {
                output.push(token);
                is_question_mark = false;
            }
        }
    }
    TokenStream::from_iter(output.into_iter())
}
