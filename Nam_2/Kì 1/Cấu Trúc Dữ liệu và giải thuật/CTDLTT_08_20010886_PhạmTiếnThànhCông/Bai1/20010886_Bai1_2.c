// This is the code of Pham Tien Thanh Cong - 20010886
#include <stdio.h>
#include <stdlib.h>

typedef struct _listNode
{
    int mun;
    struct _listNode *next;
} listNode;

typedef struct _linklist
{
    int size;
    listNode *head;
}linklist;

typedef struct _queue
{
    linklist ll;
}queue;

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

void enqueue(queue *q, int value){
    insertNode(&(q->ll.head),(q->ll.size),value);
    q->ll.size++;
}

int dequeue(queue *q){
    int value;
    if (!isEmptyQueue(q)){
        value = findNode(q->ll.head,0)->mun;
        deleteNode(&(q->ll.head),0);
        q->ll.size = q->ll.size - 1;
        return value;
    }
    printf("undefine !");
}

int peek(queue *q){
    int value;
    if (!isEmptyQueue(q)){
        value = findNode(q->ll.head,0)->mun;
        return value;
    }
    printf("undefine !");
}

int isEmptyQueue(queue *q){
    if (q->ll.size == 0){
        return 1;
    }else{
        return 0;
    }
}
// This is the code of Pham Tien Thanh Cong - 20010886
int main(){
    queue *q;
    q = malloc(sizeof(queue));
    q->ll.size=0;
    q->ll.head = NULL;
    int n,i;
    printf("khoi tao hang doi: ");
    scanf("%d",&n);
    enqueue(q,n);
    n=1;
    while (n == 1){
        system("cls");
        printf("HANG DOI queue\n");
        printf("1 enqueue\n");
        printf("2 dequeue\n");
        printf("3 peek\n");
        printf("4 isEmptyQueue\n");
        printf("5 Show all queues\n");
        printf("0 thoat\n");
        printf("Lua chon thao tac: ");
        scanf("%d",&n);
        if (n == 0){
            break;
        }else if (n == 1){
            printf("-- Enqueue: \n");
            printf("Nhap phan tu muon them vao hang doi: ");
            scanf("%d",&n);
            enqueue(q,n);
            printf("done !");
        }else if (n == 2){
            printf("-- Dequeue: \n");
            printf("%d\n",dequeue(q));
        }else if (n == 3){
            printf("-- Peek: \n");
            printf("%d\n",peek(q));
        }else if (n == 4){
            printf("-- IsEmptyQueue: \n");
            printf("%d\n",isEmptyQueue(q));         
        }else if (n == 5){
            printf("-- Show all queues: \n");
            printLish(q->ll.head);
        }else{
            printf("tu choi yeu cau\n");
        }
        printf("\nNhap 1 de tiep tuc: ");
        scanf("%d",&n);
    }
}
// This is the code of Pham Tien Thanh Cong - 20010886