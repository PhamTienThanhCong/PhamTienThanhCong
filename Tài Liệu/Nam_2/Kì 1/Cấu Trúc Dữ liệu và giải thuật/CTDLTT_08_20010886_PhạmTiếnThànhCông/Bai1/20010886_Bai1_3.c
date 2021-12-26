// This is the code of Pham Tien Thanh Cong - 20010886
#include <stdio.h>
#include <stdlib.h>

typedef struct _listNode
{
    int mun;
    struct _listNode *next;
} listNode;

typedef struct _stack{
    listNode *head;
}stack;

void printLish(listNode *head)
{
    listNode *cur = head;
    if (cur == NULL)
    {
        printf("day trong !!!");
    }
    else
    {
        while (cur != NULL)
        {
            printf("%d ", cur->mun);
            cur = cur->next;
        }
    }
    printf(" \n");
}

listNode *findNode(listNode *head, int index)
{
    listNode *cur = head;
    if ((head == NULL) || (index < 0))
    {
        printf("Phan tu tim kiem kkhong ton tai");
        return NULL;
    }
    else
    {
        while (index > 0)
        {
            cur = cur->next;
            index --;
            if (cur == NULL)
            {
                printf("Phan tu tim kiem khong ton tai");
                return NULL;
            }
        }
        return cur;
    }
}

void insertNode(listNode **pHead, int index, int number)
{
    listNode *cur, *newNode;
    if (*pHead == NULL || index == 0)
    {
        newNode = malloc(sizeof(listNode));
        newNode->mun = number;
        newNode->next = *pHead;
        *pHead = newNode;
    }
    else
    {
        cur = findNode(*pHead, index - 1);
        if (cur != NULL){
            newNode = malloc(sizeof(listNode));
            newNode->mun = number;
            newNode->next = cur->next;
            cur->next = newNode;
        }else
        {
            printf("khong the chen");
        }
    }
}

void deleteNode(listNode **ptrHead, int index){
    listNode *cur;
    if(index == 0){
        cur = *ptrHead;
        *ptrHead = cur->next;
    }
    else
    {
        cur = findNode(*ptrHead, index - 1);
        if (cur != NULL && findNode(*ptrHead, index) != NULL){
            cur->next = (cur->next)->next;
        }else
        {
            printf("khong the xoa");
        }
    }
}

void push(stack *s, int value){
    insertNode(&(s->head),0,value);
}

int isEmtyStack(stack *s){
    if (s->head == NULL){
        return 0;
    }
    else{
        return 1;
    }
}

int pop(stack *s){
    if (isEmtyStack(s) != 0){
        int value;
        value = findNode((s->head),0)->mun;
        deleteNode(&(s->head),0);
        return value;
    }
    printf("defined !!!");
}

int peek(stack *s){
    if (isEmtyStack(s) != 0){
        int value;
        value = findNode((s->head),0)->mun;
        return value;
    }
    printf("defined !!!");
}

// This is the code of Pham Tien Thanh Cong - 20010886
int main(){
    stack *s;
    s = malloc(sizeof(stack));
    s->head = NULL;
    int n,i;
    printf("khoi tao ngan xep: ");
    scanf("%d",&n);
    push(s,n);
    n=1;
    while (n == 1){
        system("cls");
        printf("NGAN XEP Stack \n");
        printf("1 push\n");
        printf("2 pop\n");
        printf("3 peek\n");
        printf("4 isEmtyStack\n");
        printf("5 Show all Stacks\n");
        printf("0 thoat\n");
        printf("Lua chon thao tac: ");
        scanf("%d",&n);
        if (n == 0){
            break;
        }else if (n == 1){
            printf("-- push: \n");
            printf("Nhap phan tu muon them vao ngan xep: ");
            scanf("%d",&n);
            push(s,n);
            printf("done !");
        }else if (n == 2){
            printf("-- pop: \n");
            printf("%d\n",pop(s));
        }else if (n == 3){
            printf("-- Peek: \n");
            printf("%d\n",peek(s));
        }else if (n == 4){
            printf("-- isEmtyStack: \n");
            printf("%d\n",isEmtyStack(s));         
        }else if (n == 5){
            printf("-- Show all Stack: \n");
            printLish(s->head);
        }else{
            printf("tu choi yeu cau\n");
        }
        printf("\nNhap 1 de tiep tuc: ");
        scanf("%d",&n);
    }    
}
// This is the code of Pham Tien Thanh Cong - 20010886