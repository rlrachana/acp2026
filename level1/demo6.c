#include<stdio.h>
#include<stdlib.h>
int* create_array(int n)
{
    int *arr;
    if(n<=0)
    {
        printf("Invalid");
        return NULL;
    }
    arr = (int*) malloc(n*sizeof(int));
    if(arr==NULL)
    {
        printf("No memory allocated");
        return NULL;
    }
    return arr;
} 
void initialize_array(int *arr, int n)
{
    if(arr==NULL)
    {
        printf("Array does not exist");
        return;
    }
    for(int i=0;i<n;i++)
    {
        printf("Enter element at %d:",i);
        scanf("%d",&arr[i]);
    }
} 
void print_array(int *arr, int n)
{
    if(arr==NULL)
    {
        printf("Array does not exist");
        return;
    }
    for(int i=0;i<n;i++)
    {
        printf("Element %d:%d\n",i,arr[i]);
    }
}
void delete_array(int **arr)
{
    if(arr!=NULL && *arr!=NULL)
    {
        free(*arr);
        *arr=NULL;
    }
}
int main()
{
    int n,*arr;
    printf("Enter the size of array:");
    scanf("%d",&n);
    arr=create_array(n);
    initialize_array(arr,n);
    print_array(arr,n);
    delete_array(&arr);
    return 0;
}