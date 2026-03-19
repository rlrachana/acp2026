#include<stdio.h>
void input(int *n,float arr[])
{
    printf("Enter total number of values:");
    scanf("%d",n);
    if(*n<=0)
    {
        printf("Invalid value of n");
        return ;
    }
    printf("Enter %d values:",*n);
    for(int i=0;i<*n;i++)
    {
    scanf("%f",&arr[i]);
    }
}
int find_max_index(int n,float arr[])
{
    int max_index=0;
    for(int i=1;i<n;i++)
    {
        if(arr[i]>arr[max_index])
        {
            max_index=i;
        }
    }
    return max_index;
}
void output(float arr[],int max_index)
{
    printf("The maximum number is %f at %d",arr[max_index],max_index);
}
int main()
{
    int n,max_index;
    float arr[100];
    input(&n,arr);
    if(n<=0)
    {
        return 0;
    }
    max_index=find_max_index(n,arr);
    output(arr,max_index);
    return 0;
}