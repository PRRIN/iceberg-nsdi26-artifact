#include <stdio.h>

int __attribute__((noinline, optnone)) gcd(int a, int b) {
    if (a < b) return gcd(b, a);
    return b == 0 ? a : gcd(a-b, b);
}

int __attribute__((noinline)) rsum(int array[4], int index) {
    if (index == 0) return array[0];
    else return array[index] + rsum(array, index - 1);
}

int __attribute__((noinline)) sum() {
    int array[64];
    for (int i=0;i<64;i++) {
        array[i] = i-31;
    }
    return rsum(array, 63);
}

// ########################
// # Binary Search Tree
// ########################
struct TreeNode {
    struct TreeNode *left;
    int data;
    struct TreeNode *right;
};

struct TreeNode nodes[4];

void __attribute__((noinline)) node_init(int data, struct TreeNode *node) {
    node->data = data;
    node->left = NULL;
    node->right = NULL;
}

void __attribute__((noinline)) init() {
    node_init(0, &nodes[0]);
    node_init(1, &nodes[1]);
    node_init(2, &nodes[2]);
    node_init(3, &nodes[3]);
}

void __attribute__((noinline /*, disable_tail_calls */)) add(struct TreeNode **root, struct TreeNode *new) {
    if (*root == NULL) {
        *root = new;
    } else {
        if (new->data < (*root)->data) {
            add(&(*root)->left, new);
        } else if (new->data > (*root)->data) {
            add(&(*root)->right, new);
        }
    }
}

int __attribute__((noinline)) wsum(struct TreeNode *root, int w) {
    if (!root) return 0;
    else return root->data * w + wsum(root->left, w+1) + wsum(root->right, w+1);
}

int test_tree() {
    init();
    struct TreeNode *root = NULL;
    add(&root, &nodes[1]);
    add(&root, &nodes[0]);
    add(&root, &nodes[3]);
    add(&root, &nodes[2]);
    return wsum(root, 0);
}