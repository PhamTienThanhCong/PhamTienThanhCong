// This is the code of Pham Tien Thanh Cong - 20010886
#include <stdio.h>
#include <stdlib.h>

typedef struct _listNode
{
    int mun;
    struct _listNode *next;
} listNode;

void printList(listNode *head)
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
// This is the code of Pham Tien Thanh Cong - 20010886
int main()
{
    int n,i;
    listNode *head;
    head = malloc(sizeof(listNode));
    printf("Khoi tao chuong trinh voi gia tri: ");
    scanf("%d",&n);
    head->mun = n;
    head->next = NULL;
    n=1;
    while (n==1){
        system("cls");
        printf("DANH SACH LIEN KET: \n");
        printf("1 print list\n");
        printf("2 find node\n");
        printf("3 insert node\n");
        printf("4 deleteNode\n");
        printf("0 thoat\n");
        printf("Lua chon thao tac: ");
        scanf("%d",&n);
        if (n == 0){
            break;
        }else if (n == 1){
            printf("-- print list: \n");
            printList(head);
        }else if (n == 2){
            printf("-- find node: \n");
            printf("Nhap vi tri can tim kiem: ");
            scanf("%d",&n);
            printf("%d",findNode(head,n)->mun);
        }else if (n == 3){
            printf("-- insert node: \n");
            printf("nhap vi tri can chen: ");
            scanf("%d",&i);
            printf("nhap gia tri can chen: ");
            scanf("%d",&n);
            insertNode(&head,i,n);
        }else if (n == 4){
            printf("-- delete node: \n");
            printf("nhap vi tri can xoa: ");
            scanf("%d",&i);
            deleteNode(&head,i);
        }else{
            printf("tu choi yeu cau\n");
        }
        printf("\nNhap 1 de tiep tuc: ");
        scanf("%d",&n);
    }
}
// This is the code of Pham Tien Thanh Cong - 20010886