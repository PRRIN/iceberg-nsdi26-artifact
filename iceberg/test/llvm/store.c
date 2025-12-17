#include <stdio.h>

// ##################################
// # Specilize stores
// ##################################

int main(int argc, char **argv)
{
    unsigned sum = 0;
    unsigned prod = 1;
    for (int i = 0; i < argc; i++) {
        unsigned len = 0;
        while(argv[i][len] != '\0') {
            len++;
        }
        sum += len;
        prod *= len;
    }
    return prod * 100 + sum;
}

// ##################################
// # Build and apply stores
// ##################################
struct ListNode {
    int data;
    struct ListNode* next;
    struct ListNode* prev;
};

struct List {
    unsigned len;
    struct ListNode* head;
    struct ListNode* tail;
    struct ListNode dummy_head;
    struct ListNode dummy_tail;
};

void __attribute__((noinline)) list_init(struct List *list) {
    list->dummy_head.next = &list->dummy_tail;
    list->dummy_head.prev = NULL;
    list->dummy_tail.next = NULL;
    list->dummy_tail.prev = &list->dummy_head;

    list->head = &list->dummy_head;
    list->tail = &list->dummy_tail;
    list->len = 0;
}

unsigned __attribute__((noinline)) list_len(struct List *list) {
    return list->len;
}

void __attribute__((noinline)) list_push_back(struct List *list, struct ListNode *node) {
    list->len++;
    node->prev = list->tail->prev;
    list->tail->prev->next = node;
    node->next = list->tail;
    list->tail->prev = node;
}

struct ListNode * __attribute__((noinline)) list_pop_back(struct List *list) {
    if (list->tail->prev == list->head) {
        return NULL;
    }

    list->len--;
    struct ListNode *node = list->tail->prev;
    node->prev->next = list->tail;
    list->tail->prev = node->prev;
    return node;
}

int __attribute__((noinline)) list_sum(struct List *list) {
    int sum = 0;
    struct ListNode *cur = list->head->next;
    while (cur != list->tail) {
        sum += cur->data;
        cur = cur->next;
    }
    return sum;
}

// #[Test]
int test_list_local() {
    struct List list;
    struct ListNode nodes[3];
    
    list_init(&list);
    for (int i=0; i<3; i++) {
        nodes[i].data = i+1;
        list_push_back(&list, &nodes[i]);
    }

    return list_sum(&list);
}

struct List list;
struct ListNode nodes[3];

void __attribute__((noinline)) init(int a, int b, int c) {
    list_init(&list);
    nodes[0].data = a;
    nodes[1].data = b;
    nodes[2].data = c;
    for (int i=0; i<3; i++) {
        list_push_back(&list, &nodes[i]);
    }
}

// #[Test]
int test_list_global(int a, int b, int c) {
    init(a, b, c);

    struct ListNode scrap;
    list_push_back(&list, &scrap);
    list_pop_back(&list);

    struct ListNode *last = list_pop_back(&list);
    return list_sum(&list) + last->data;
}