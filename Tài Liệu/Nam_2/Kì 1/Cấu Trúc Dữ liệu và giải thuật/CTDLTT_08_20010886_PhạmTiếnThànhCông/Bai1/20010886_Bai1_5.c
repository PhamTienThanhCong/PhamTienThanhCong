// This is the code of Pham Tien Thanh Cong - 20010886
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
typedef struct _btnode2 {
	char item;
	struct _btnode2 *left;
	struct _btnode2 *right;
}BTNode2;

void TreeTraversal_InOrder2(BTNode2 *cur) { 
 	if (cur == NULL)
 		return;
	TreeTraversal_InOrder2(cur->left);
	printf("%c ", cur->item);
	TreeTraversal_InOrder2(cur->right);
} 

BTNode2* BSTT(BTNode2 *cur, char c) { 
	if (cur == NULL) 
	 	return NULL; 
	if (c==cur->item) 
		return cur; 
	if (c < cur->item) 
	 	return BSTT(cur->left,c);
	else 
	 	return BSTT(cur->right,c);
} 

BTNode2* BSTT2(BTNode2 *cur, char c) { 
	if (c==cur->item) 
	 	return NULL; 
	if (c < cur->item) { 
	 	if (cur->left == NULL) 
	 		return cur; 
	 	return BSTT2(cur->left,c); 
	} 
	else { 
	 	if (cur->right == NULL) 
	 		return cur; 
	 	return BSTT2(cur->right,c); 
 	} 
}

// This is the code of Pham Tien Thanh Cong - 20010886
int main(void) { 
	 BTNode2 *btnodeA, *btnodeB, *btnodeC, *btnodeD, *btnodeE, *btnodeF, 
			 *btnodeG, *btnodeH, 
	 		 *btnodeI, *btnodeJ, *btnodeK, *btnodeL, *btnodeM; 
	 btnodeA = malloc(sizeof(BTNode2)); 
	 btnodeB = malloc(sizeof(BTNode2)); 
	 btnodeC = malloc(sizeof(BTNode2)); 
	 btnodeD = malloc(sizeof(BTNode2)); 
	 btnodeE = malloc(sizeof(BTNode2)); 
	 btnodeF = malloc(sizeof(BTNode2)); 
	 btnodeG = malloc(sizeof(BTNode2)); 
	 btnodeH = malloc(sizeof(BTNode2)); 
	 btnodeI = malloc(sizeof(BTNode2)); 
	 btnodeJ = malloc(sizeof(BTNode2)); 
	 btnodeK = malloc(sizeof(BTNode2)); 
	 btnodeL = malloc(sizeof(BTNode2)); 
	 btnodeM = malloc(sizeof(BTNode2)); 
	 btnodeA->item='A'; 
	 btnodeB->item='B'; 
	 btnodeC->item='C'; 
	 btnodeD->item='D'; 
	 btnodeE->item='E'; 
	 btnodeF->item='F'; 
	 btnodeG->item='G'; 
	 btnodeH->item='H'; 
	 btnodeI->item='I'; 
	 btnodeJ->item='J'; 
	 btnodeK->item='K'; 
	 btnodeL->item='L'; 
	 btnodeM->item='M'; 
	 btnodeA->left=NULL; 
	 btnodeA->right=NULL; 
	 btnodeB->left=btnodeA; 
	 btnodeB->right=btnodeC; 
	 btnodeC->left=NULL; 
	 btnodeC->right=btnodeD; 
	 btnodeD->left=NULL; 
	 btnodeD->right=NULL; 
	 btnodeE->left=btnodeB; 
	 btnodeE->right=btnodeF; 
	
	 btnodeF->left=NULL; 
	 btnodeF->right=btnodeG; 
	 btnodeG->left=NULL; 
	 btnodeG->right=NULL; 
	 btnodeH->left=btnodeE; 
	 btnodeH->right=btnodeL; 
	 btnodeI->left=NULL; 
	 btnodeI->right=NULL; 
	 btnodeJ->left=btnodeI; 
	 btnodeJ->right=btnodeK; 
	 btnodeK->left=NULL; 
	 btnodeK->right=NULL; 
	 btnodeL->left=btnodeJ; 
	 btnodeL->right=btnodeM; 
	 btnodeM->left=NULL; 
	 btnodeM->right=NULL; 
	 printf("\n\nCay nhi phan tim kiem truoc khi chen:\n "); 
	 TreeTraversal_InOrder2(btnodeH); 
	 // Insert 
	 char q;
     printf("\nNhap phan tu can chen: ");
     scanf("%c",&q); 
	 BTNode2* posNode = BSTT2( 	btnodeH,q ); 
	 BTNode2 *btNewNode = malloc( sizeof(BTNode2) ); 
	 btNewNode->item = q; 
	 btNewNode->left = NULL; 
	 btNewNode->right = NULL; 
	 if (posNode == NULL) { 
	 	printf("Phan tu da ton tai"); 
	 		return 0; 
	 } 
	 if (q < posNode->item) 
	 	posNode->left = btNewNode;
	 else 
	 	posNode->right = btNewNode;
	 printf("\n\nCay nhi phan tim kiem sau khi chen:\n "); 
	 TreeTraversal_InOrder2(btnodeH); 
}
// This is the code of Pham Tien Thanh Cong - 20010886