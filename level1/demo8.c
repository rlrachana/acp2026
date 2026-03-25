#include<stdio.h>
#include<string.h>
void input(char *str)
{
    scanf("%s",str);
}
void concatenate_strings(char *str1, char *str2)
{
    strcat(str1,str2);
}
void display(char *str)
{
    printf("String after concatenation:%s",str);
}
int main()
{
    char str1[100],str2[100];
    printf("Enter string1:");
    input(str1);
    printf("Enter string2:");
    input(str2);
    concatenate_strings(str1,str2);
    display(str1);
    return 0;
}