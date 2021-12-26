// This is the code of Pham Tien Thanh Cong - 20010886
#include <stdio.h>
#include <stdlib.h>

typedef struct _btnode {
	int item;
	struct _btnode *left;
	struct _btnode *right;
} BTNode; 

BTNode *insertTree(BTNode *root, int value)
{
    if (root == NULL)
    {
        BTNode *r;
        r = malloc(sizeof(BTNode));
        r->item = value;
        r->left = NULL;
        r->right = NULL;
        return r;
    }
    if ( root->item > value ){
        root->left = insertTree( root->left, value );
    }
    else if ( root->item < value ) {
        root->right = insertTree( root->right, value );
    }
    return root;
}

// Duyet cay theo thu tu truoc
void TreeTraversal_PreOrder(BTNode *cur) {
	if (cur==NULL) return;
    printf("%d ",cur->item);
	TreeTraversal_PreOrder(cur->left);
	TreeTraversal_PreOrder(cur->right);
}

// Duyet cay theo thu tu giua
void TreeTraversal_InOrder(BTNode *cur) {
	if (cur==NULL) return;
	TreeTraversal_PreOrder(cur->left);
    printf("%d ",cur->item);
	TreeTraversal_PreOrder(cur->right);
}

// Duyet cay theo thu tu sau
void TreeTraversal_PostOrder(BTNode *cur) {
	if(cur == NULL) return;
	TreeTraversal_PreOrder(cur->left);
    TreeTraversal_PreOrder(cur->right);
    printf("%d ",cur->item);
} 

// So nut trong cay la
int countNode (BTNode *cur){
	if(cur == NULL){
		return 0;
	}
	int l = countNode(cur->left);
	int r = countNode(cur->right);
	return l+r+1;
}

// This is the code of Pham Tien Thanh Cong - 20010886
int main(){
    BTNode *root;
    root = malloc(sizeof(BTNode));
    root = NULL;
    int n,x;
    printf("Khoi tao nut goc: ");
    scanf("%d",&n);
    root = insertTree(root, n);
    printf("So luong phan tu cay nhi phan: ");
    scanf("%d",&n);
    printf("nhap cac gia tri de chen vao cay nhi phan: \n");
    for(int i=0;i<n;i++){
        scanf("%d",&x);
        root = insertTree(root, x);
    }
    printf("%d",root->item);
    printf("\nDuyet cay theo thu tu truoc: ");
	TreeTraversal_PreOrder( root );
	printf("\nDuyet cay theo thu tu giua: ");
	TreeTraversal_InOrder( root );
	printf("\nDuyet cay theo thu tu sau: ");
	TreeTraversal_PostOrder( root );
	printf("\nSo nut trong cay la: %d",countNode(root));
}
// This is the code of Pham Tien Thanh Cong - 20010886