### How to generate .ll files

#### simple.ll

```bash
clang -O0 -fno-vectorize -S -emit-llvm -o simple.ll simple.c
clang -O0 -fno-vectorize -S -emit-llvm -o data.ll data.c
clang -O1 -fno-vectorize -S -emit-llvm -o store.ll store.c
clang -O2 -fno-vectorize -S -emit-llvm -o loop.ll loop.c
clang -O1 -fno-vectorize -S -emit-llvm -o funcp.ll funcp.c
clang -O0 -fno-vectorize -S -emit-llvm -o panic.ll panic.c
clang -O1 -fno-vectorize -S -emit-llvm -o recurse.ll recurse.c
clang -O0 -fno-vectorize -S -emit-llvm -o intrinsic.ll intrinsic.c
clang -O0 -fno-vectorize -S -emit-llvm -o agg.ll agg.c
clang -O0 -fno-vectorize -S -emit-llvm -o leak.ll leak.c
clang -O0 -fno-vectorize -S -emit-llvm -o question.ll question.c
clang -O0 -fno-vectorize -S -emit-llvm -o pointers.ll pointers.c
clang -O0 -fno-vectorize -S -emit-llvm -o heap.ll heap.c
clang -O1 -fno-vectorize -S -emit-llvm -o boolean.ll boolean.c
clang -O1 -fno-vectorize -fno-jump-tables -S -emit-llvm -o switch.ll switch.c
```

Then manually delete unsupported parts of the generated IR.

#### Other IR files

These are real IR generated from target codebases. See the documentation there. Note that they also require manual trimming.

> 