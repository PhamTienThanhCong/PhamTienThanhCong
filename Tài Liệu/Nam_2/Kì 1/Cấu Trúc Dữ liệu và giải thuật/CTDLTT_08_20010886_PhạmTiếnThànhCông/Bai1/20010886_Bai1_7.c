// This is the code of Pham Tien Thanh Cong - 20010886
#include<stdio.h>
#include<stdlib.h>

int QuickSort(int K[], int LB, int UB)
{
	int i,m;
	i = LB ;
	int j = UB;
	int pivot =K[(LB+UB)/2];
	do{
		while (K[i] < pivot ) i = i+1;
		while (K[j] > pivot)  j = j-1;	
	
		if (i <= j) {
			m = K[i];
			K[i] = K[j];
			K[j] = m;
			i = i+1;
			j = j-1;
		}
	}
	while(i<=j);
		if(LB<j)
			QuickSort(K,LB,j);
		if(i<UB)
			QuickSort(K,i,UB);
}

void print_array(int k[], int n) {
	int i;
	for (i = 1; i <= n; i++) {
		printf("%d ", k[i]);
	}
}

// This is the code of Pham Tien Thanh Cong - 20010886
int main(void) {
	int K[1000],n;
    printf("--QuickSort--\n");
    printf("Nhap so luong phan tu: ");
    scanf("%d",&n);
    printf("Nhap %d phan tu: ",n);
    for (int i=1; i<=n; i++){
        scanf("%d",K+i);
    }
	printf("\nMang truoc khi sap xep: ");
	print_array(K, n);
	QuickSort(K,1,n);
	printf("\nMang sau khi sap xep:   ");
	print_array(K,n);
	return 0;
}
// This is the code of Pham Tien Thanh Cong - 20010886