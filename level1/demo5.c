#include<stdio.h>
void read_array(int n, int arr[])
{
    for(int i=0;i<n;i++)
    {
        scanf("%d",&arr[i]);
    }
}
void print_array(int n, int arr[])
{
    for(int i=0;i<n;i++)
    {
        printf("%d ",arr[i]);
    }
}
void swap_array(int n, int a[n], int b[n])
{
    int temp[n];
    for(int i=0;i<n;i++)
    {
    temp[i]=a[i];
    a[i]=b[i];
    b[i]=temp[i];
    }
    printf("\nArrays after swapping:\n");
    printf("Array1:");
    print_array(n,a);
    printf("\nArray2:");
    print_array(n,b);
}
int main()
{
    int n;
    printf("Enter the total number of values in the array:");
    scanf("%d",&n);
    int a[n],b[n];
    printf("Enter %d values for array1:\n",n);
    read_array(n,a);
    printf("Enter %d values for array2:\n",n);
    read_array(n,b);
    printf("Arrays before swapping:\n");
    printf("Array1:");
    print_array(n,a);
    printf("\nArray2:");
    print_array(n,b);
    swap_array(n,a,b);
    
    return 0;
}