#include<stdio.h>
#include<string.h>
#include<ctype.h>


int check_char(char x , char y );
int check_spec_char(char x , char y);

int main ()
{
    int i , j , size , test_case_count , tracer;
    char test_case1[100] , test_case2[100] ;

    scanf("%i" , &test_case_count);

    for(i = 0 ; i < test_case_count ; i++)
    {
        scanf(" %s %s" , &test_case1 , &test_case2);
        tracer = 0 ;
        if(strlen(test_case1) == strlen(test_case2))
        {
            for(j = 0 , size = strlen(test_case1); j < size ; j++ )
            {
                if(!check_char(test_case1[j] , test_case2[j]))
                {
                    printf("No\n");
                    tracer++;
                    break;
                }
            }

            if(tracer == 0)
                printf("Yes\n");

        } else {
            printf("No\n");
        }
    }
    return 0;
}


int check_spec_char(char x , char y)
{
    if(((x == 'e' || x == 'i' ) && (y == 'e' || y == 'i' )) ||
       (( x == 'p' || x == 'b') && ( y == 'p' || y =='b')))
    {
        return 1;

    } else
    {
        return 0 ;
    }
}



int check_char(char x , char y )
{
    x = tolower(x);
    y = tolower(y);

    if(x == y)
    {
        return 1 ;
    }
    else if (check_spec_char(x , y) == 1)
    {
        return 1 ;

    } else {

        return 0 ;
    }
}
