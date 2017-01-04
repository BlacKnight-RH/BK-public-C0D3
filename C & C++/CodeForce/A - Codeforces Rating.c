#include <stdio.h>
#include <stdlib.h>
int main(void)
{
    int t , n , r ,i ;


    scanf("%d" , &t);

    i = 0;

    while (i < t)
    {
        scanf("%d %d " , &n ,&r);

        int  a[n] , j = 0 , sum = 0 ;

        while(j < n)
        {
            scanf("%d" , &a[j]);
            j++;
        }


        j = 0 ;

        while (j < n )
        {
            sum += a[j];
            j++;
        }

        if ((sum + 1500) == r ) printf("Correct");
        else printf("Bug");

        printf("\n");
        i++;
    }


    return 0;
}