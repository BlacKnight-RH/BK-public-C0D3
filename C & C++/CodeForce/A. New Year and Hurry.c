#include<stdio.h>

/**
    - contest start at 20:00 & 'll last 4 h.
    - n   problem : [1 <= n <= 10 ]
    - time for each one is : [ 5 * i ] , i-th index
    - k   minute to get the party : [ 1 <= k <= 240]
*/

const int MID_NIGHT  = 1440;  // 24 h * 60 min.
const int START_TIME = 1200;  // 20 h * 60 min.


int check_validation(int n , int k);
int num_problem(int n , int k ) ;

int main ()
{
    int k , n , result ;

    scanf("%d %d" , &n , &k);

    if(check_validation(n , k))
    {
        result = num_problem(n , k);
        printf("%d" , result);
    }

}


int check_validation(int n , int k)
{
    if(n > 10 || n < 1 )
    {
        return 0 ;

    } else if (k > 240 || k < 1)
    {
        return 0 ;
    }

    return 1;
}


int num_problem(int n , int k )
{
    int i = 1 ,
        num_of_problems = 0  ,
        total_time = START_TIME + k ,
        next_total_time = total_time + (5 * 1);

    do{
        if(total_time > MID_NIGHT || next_total_time > MID_NIGHT)
        {
            break ;

        } else {

            total_time = next_total_time ;
            num_of_problems += 1 ;
            next_total_time = total_time + (5 * (i + 1));
            i++ ;
        }

    } while(i <= n);


    return num_of_problems;
}
