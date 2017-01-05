#include<stdio.h>
#include<string.h>

int check(char a[] , char b[] , int size) ;

int main ()
{
    int  i , count , size ;
    char a[100] , b[100] ;

    scanf("%i" ,&count);

    for(i = 0 ; i < count ; i++ )
    {
        scanf("%i" ,&size);

        if(size > 100 || size < 1)
        {
            printf("IMPOSSIBLE\n");

        } else {
            scanf(" %s %s" , &a , &b);
            check(a , b , size);
        }

    }
}



int check(char a[] , char b[] , int size)
{
    int i , counter = 1;


    if(strlen(a)!= size || strlen(b) != size)
    {
        printf("IMPOSSIBLE\n");
        return 0 ;
    }

    for(i = 0 ; i < size ; i++ )
    {
        if(a[i] == '1' && b[i] == '1')
        {
            counter *= 2 ;

        } else if(a[i] == '0' && b[i] == '0')
        {
            counter *= 1 ;
        } else if(a[i] == '0' && b[i] == '1')
        {
            counter *= 1 ;

        } else {
            printf("IMPOSSIBLE\n");
            return 0;
        }
    }

    printf("%i\n",counter % 1000000007 );

    return 1 ;
}
