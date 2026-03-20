#include<stdio.h>
typedef struct {
    	char name[50];
    	float length;
    	float width;
    	float area;
} Rectangle;
Rectangle input()
{
	Rectangle r;
    printf("Enter length:");
	scanf("%f",&r.length);
	printf("Enter width:");
	scanf("%f",&r.width);
	return r;
}
float calculate_area(Rectangle rect)
{
	rect.area=rect.length*rect.width;
	return rect.area;
}
void compare_areas(Rectangle r1, Rectangle r2, Rectangle r3)
{
	if(r1.area>r2.area && r1.area>r3.area)
	{
		printf("Rectangle 1 has the largest area = %f",r1.area);
	}
	else if(r2.area>r1.area && r2.area>r3.area)
	{
		printf("Rectangle 2 has the largest area = %f",r2.area);
	}
	else if(r3.area>r2.area && r3.area>r1.area)
	{
		printf("Rectangle 3 has the largest area = %f",r3.area);
	}
	else if(r1.area==r2.area && r1.area>r3.area)
	{
		printf("Rectangle 1 and Rectangle 2 have equal and largest area = %f",r1.area);
	}
	else if(r1.area==r3.area && r1.area>r2.area)
	{
		printf("Rectangle 1 and Rectangle 3 have equal and largest area = %f",r1.area);
	}
	else if(r3.area==r2.area && r2.area>r1.area)
	{
		printf("Rectangle 2 and Rectangle 3 have equal and largest area = %f",r2.area);
	}
	else
	{
		printf("All rectangles have equal area = %f",r1.area);
	}
}
int main()
{
	Rectangle r1,r2,r3;
	float area;
	printf("Enter the details of Rectangle 1:\n");
	r1=input();
	printf("Enter the details of Rectangle 2:\n");
	r2=input();
	printf("Enter the details of Rectangle 3:\n");
	r3=input();
	r1.area=calculate_area(r1);
	r2.area=calculate_area(r2);
	r3.area=calculate_area(r3);
	compare_areas(r1,r2,r3);
	return 0;
}