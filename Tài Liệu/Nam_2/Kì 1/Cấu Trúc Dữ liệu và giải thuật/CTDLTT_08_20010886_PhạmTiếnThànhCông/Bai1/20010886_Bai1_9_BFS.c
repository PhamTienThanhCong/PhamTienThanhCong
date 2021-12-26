#include<stdio.h>
#include<stdlib.h>
#define MAX 10

typedef struct listnode{
	int num;
	struct listnode *next;
}ListNode;

typedef struct linkedlist{
	ListNode *head;
	int size;
}LinkedList;

typedef struct queue{
	LinkedList ll;
}Queue;

void printList(ListNode *head){
	ListNode *cur = head;
	if(cur==NULL)
		printf("\nDanh sach khong co phan tu nao");
	while(cur!=NULL){
		printf("%d ", cur->num);
		cur = cur->next;
		if(cur != NULL){
			printf("-> ");
		}
	}
}

ListNode *findNode(ListNode *head, int i){
	ListNode *cur = head;
	if((head==NULL)||(i<0)){
		printf("\nDanh sach lien ket rong hoac phan tu tim kiem khong ton tai");
		return NULL;
	}
	while(i>0){
		cur = cur->next;
		i--;
		if(cur==NULL){
			printf("\nPhan tu tim kiem khong ton tai");
			return NULL;
		}
	}
	return cur;
}

void insertNode(ListNode **pHead, int index, int value){
	ListNode *cur, *newNode;
	if(*pHead==NULL||index==0){
		newNode=malloc(sizeof(ListNode));
		newNode->num = value;
		newNode->next = *pHead;
		*pHead = newNode;
	}
	else if((cur=findNode(*pHead, index-1))!=NULL){
		newNode = malloc(sizeof(ListNode));
		newNode->num = value;
		newNode->next = cur->next;
		cur->next = newNode;
	}else printf("can not insert the new item at index %d!\n", index);
	
}

void removeNode(ListNode **ptrHead, int index){
	ListNode *cur, *pre;
	if(index==0){
		cur = *ptrHead;
		*ptrHead = cur->next;
		free(cur);
	}else{
		pre = findNode(*ptrHead, index-1);
		cur = pre->next;
		pre->next = cur->next;
		free(cur);
	}
}

void enqueue(Queue *q, int item){
	insertNode(&(q->ll.head), q->ll.size, item);
	q->ll.size = q->ll.size + 1;
	
}

int dequeue(Queue *q){
	int item;
	if(q->ll.head != NULL){
		item = ((q->ll).head)->num;
		removeNode(&(q->ll.head), 0);
		(q->ll).size--;
		return item;
   }
   else{
   	printf("Hang doi rong");
   	return 0;
	}
}

int isEmptyQueue(Queue *q){
	if((q->ll).size==0) return 1;
	return 0;
}

void readData(int G[MAX][MAX], int* pn, int* psource){
	FILE* file = fopen("20010886_Bai1_9_BFS.txt", "r");
	int i, j;
	if(file != NULL){
		fscanf(file, "%d %d", pn, psource);
		for(i=0; i<*pn; i++)
			for(j=0; j<*pn; j++)
				fscanf(file, "%d", &G[i][j]);
	}
	fclose(file);
}

void breadthFirstSearch(int G[MAX][MAX], int n, int source){
	int visited[MAX];
	int i, cur;
	
	Queue *q = malloc(sizeof(Queue));
	q->ll.size = 0;
	q->ll.head = NULL;
	
	for(i=0; i<n; i++)
		visited[i] = 0;
		
	//mark cur as visited;
	cur = source;
	visited[cur] = 1;
	enqueue(q,cur);
	
	while(!isEmptyQueue(q)){
		cur = dequeue(q);
		printf(" %d", cur);
		for(i=0; i<n; i++)
			if(G[cur][i]!= 0 && visited[i]==0){
				visited[i] = 1;
				enqueue(q,i); 
			}
	}
}

void BFS_Path(int G[MAX][MAX], int n, int startN, int endN){
	int visited[MAX];
	int p[MAX];
	int i, j, cur;
	
	Queue *q = malloc(sizeof(Queue));
	q->ll.size = 0;
	q->ll.head = NULL;
	
	for(i=0; i<n; i++)
		visited[i] = 0;
		
	cur = startN;
	visited[cur] = 1;
	enqueue(q,cur);
	
	while(!isEmptyQueue(q)){
		cur = dequeue(q);
		for(i=0; i<n; i++)
			if(G[cur][i] != 0 && visited[i] == 0){
				visited[i] = 1;
				p[i] = cur;
				enqueue(q,i);
				if(i == endN){
					printf("found the path");
					printf("\nPath = %d", i);
					j=i;
					do{
						j = p[j];
						printf("<-%d", j);
					}while(j != startN);
					return;
				}
			}
	}
}

// This is the code of Pham Tien Thanh Cong - 20010886
int main(){
	int G[MAX][MAX], n, source;
	readData(G, &n, &source); 
	
	printf("\nBFS: ");
	breadthFirstSearch(G, n, source);
	
	printf("\nBFS_Path: ");
	BFS_Path(G, n , source, 2);
}
// This is the code of Pham Tien Thanh Cong - 20010886