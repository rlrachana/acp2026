#include<stdio.h>
#include<string.h>
void inputStrings(char str1[], char str2[])
{
    printf("Enter string 1:");
    fgets(str1,1000,stdin);
    str1[strcspn(str1, "\n")]='\0';
    printf("Enter string 2:");
    fgets(str2,1000,stdin);
    str2[strcspn(str2, "\n")]='\0';
}
int compareStrings(char str1[], char str2[])
{
    return strcmp(str1,str2);
}
void output(int result)
{
    if(result==0)
    {
        printf("Both strings are equal");
    }
    else if(result>0)
    {
        printf("String 1 is lexicographically greater");
    }
    else
    {
        printf("String 2 is lexicographically greater");
    }
}
int main()
{
    char str1[1000], str2[1000];
    inputStrings(str1,str2);
    int result=compareStrings(str1,str2);
    output(result);
    return 0;
}

