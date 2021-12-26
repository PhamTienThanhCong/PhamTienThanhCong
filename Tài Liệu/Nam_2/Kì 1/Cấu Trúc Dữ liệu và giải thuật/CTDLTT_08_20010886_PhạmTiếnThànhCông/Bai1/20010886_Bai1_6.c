// This is the code of Pham Tien Thanh Cong - 20010886
#include <stdio.h>
#include <stdlib.h>

void selection_sort(int k[], int n)
{
    int i, j, m, x;
    for (i = 0; i < n; i++)
    {
        m = i;
        for (j = i + 1; j < n; j++)
            if (k[m] > k[j])
                m = j;
        if (m != i)
        {
            x = k[i];
            k[i] = k[m];
            k[m] = x;
        }
    }
}

void insert_sort(int k[], int n)
{
    int i, j, x;
    for (i = 1; i < n; i++)
    {
        x = k[i];
        j = i - 1;
        while (x < k[j])
        {
            k[j + 1] = k[j];
            j = j - 1;
        }
        k[j + 1] = x;
    }
}

void bubble_sort(int k[], int n)
{
    int i, j, x;
    for (i = 0; i < n; i++)
        for (j = n-1; j > i; j--)
            if (k[j-1]>k[j])
            {
                int teamp = k[j];
                k[j] = k[j-1];
                k[j-1] = teamp;
            }
}

// This is the code of Pham Tien Thanh Cong - 20010886
int main()
{
    int a[1000],n,type=0;
    printf("Nhap so luong phan tu: ");
    scanf("%d",&n);
    printf("Nhap %d phan tu: ",n);
    for (int i=0; i<n; i++){
        scanf("%d",a+i);
    }
    printf("-- Lua Chon thuat Toan Xap Xep:\n");
    printf("1 selection sort\n");
    printf("2 insert sort\n");
    printf("3 bubble sort\n");
    printf("Lua chon(1-3): ");
    scanf("%d",&type);
    if(type == 1){
        printf("--selection sort--\n");
        selection_sort(a,n);
    }else if(type == 2){
        printf("--insert sort--\n");
        insert_sort(a,n);
    }else if(type == 3){
        printf("--bubble sort--\n");
        bubble_sort(a,n);
    }else{
        printf("Nhap Sai!\n");
    }
    printf("Mang sau sap xep: ");
    for (int i = 0; i < n; i++){
        printf("%d ", a[i]);
    }
}
// This is the code of Pham Tien Thanh Cong - 20010886