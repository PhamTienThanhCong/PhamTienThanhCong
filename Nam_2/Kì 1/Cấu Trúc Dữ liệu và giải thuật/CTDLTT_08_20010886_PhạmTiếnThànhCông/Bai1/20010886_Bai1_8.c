// This is the code of Pham Tien Thanh Cong - 20010886
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
void ADJUST(int K[],int i, int n) {
    int KEY = K[i]; 
    int j = 2 * i; 
    while (j <= n) { 
        if ( (j < n) && (K[j] < K[j+1]) ) j = j+1; 
        if (KEY > K[j]) { 
            K[ (j/2) ] = KEY; 
            return; 
        }       
        K[ (j/2) ] = K[j]; 
        j = 2 * j ; 
    } 
    K[ (j/2) ] = KEY; 
}

void HeapSort(int K[], int n) {
    int i;
    for (i = (n/2); i >=1; i--)
        ADJUST(K, i, n);
    for (i = n-1 ; i >= 1; i--) {
        int tmp = K[1];
        K[1] = K[i+1] ;
        K[i+1] = tmp;
    ADJUST(K, 1, i );
    }
}

void print_array(int K[], int n) {
	int i;
	for (i = 1; i <= n; i++) {
		printf("%d ", K[i]);
	}
}

// This is the code of Pham Tien Thanh Cong - 20010886
int main(){
	int K[1000],n;
    printf("--HeapSort--\n");
    printf("Nhap so luong phan tu: ");
    scanf("%d",&n);
    printf("Nhap %d phan tu: ",n);
    for (int i=1; i<=n; i++){
        scanf("%d",K+i);
    }
	printf("\nMang truoc khi sap xep: ");
	print_array(K, n);
	HeapSort(K,n);
	printf("\nMang sau khi sap xep:   ");
	print_array(K,n);
	return 0;
}
// This is the code of Pham Tien Thanh Cong - 20010886