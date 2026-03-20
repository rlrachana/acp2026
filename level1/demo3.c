#include<stdio.h>
typedef struct {
    float length;
    float width;
    float area;
} Rectangle;
void input(int n, Rectangle rects[n])
{
    for(int i=0;i<n;i++)
    {
        printf("Enter the details of rectangle %d:\n",i+1);
        printf("Enter the length:");
        scanf("%f",&rects[i].length);
        printf("Enter the width:");
        scanf("%f",&rects[i].width);
    }
}
void calculate_area(int n, Rectangle rects[n])
{
    for(int i=0;i<n;i++)
    {
        rects[i].area = rects[i].length*rects[i].width;
    }
}
int findLargestArea(int n, Rectangle rects[n])
{
    int largestIndex = 0;
    for(int i=1;i<n;i++)
    {
        if(rects[i].area>rects[largestIndex].area)
        {
            largestIndex = i;
        }
    }
    return largestIndex;
}
void output(int largestIndex, Rectangle rects[])
{
    printf("Rectangle %d has the largest area = %f",largestIndex+1,rects[largestIndex].area);
}
int main()
{
    int n,index;
    printf("Enter the total number of rectangles:");
    scanf("%d",&n);
    Rectangle r[n];
    input(n,r);
    calculate_area(n,r);
    index = findLargestArea(n,r);
    output(index,r);
    return 0;
}