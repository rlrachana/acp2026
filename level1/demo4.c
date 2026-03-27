#include <stdio.h>
#include <string.h>

typedef struct
{
    int flightno,seats;
    char destination[50];
}Flight;

void input_flights(int n, Flight flights[n]);
int search_flights(int n, Flight flights[n], char destination[], int result[]);
void display(int count, int result[], Flight flights[]);

int main()
{
    int n,count;
    char dest[50];
    n=4;
    
    Flight flights[n];
    int result[n];
    
    input_flights(n,flights);

    printf("\nEnter destination to search: ");
    scanf("%s",dest);

    count=search_flights(n,flights,dest,result);
    display(count,result,flights);
    return 0;
}

void input_flights(int n, Flight flights[n])
{
    for(int i=0;i<n;i++)
    {
        printf("\nEnter details of flight %d\n",i+1 );
        printf("Enter flight number: ");
        scanf("%d",&flights[i].flightno);
        printf("Enter destination: ");
        scanf("%s",flights[i].destination);
        printf("Enter available seats: ");
        scanf("%d",&flights[i].seats);
    }
}

int search_flights(int n, Flight flights[n], char destination[], int result[])
{
    int count=0;
    for(int i=0;i<n;i++)
    {
        if(strcmp(flights[i].destination,destination)==0)
        {
        result[count] = i;
        count++;
        }
    }
    return count;
}

void display(int count, int result[], Flight flights[])
{
    if(count==0)
    {
        printf("No flight available to the given destination\n");
    }
    else
    {
        printf("Flights available:\n");
        for(int i=0;i<count;i++)
        {
            int index = result[i];
            printf("Flight Number: %d\n",flights[index].flightno);
        }
    }
}