#include <stddef.h>
#include <stdint.h>

/*@ axiomatic Sum {
      logic int sum(int *values, integer begin, integer end)
          reads values[begin .. (end - 1)];

      axiom empty:
        \forall int *p, integer begin, end; begin >= end
            ==> sum(p, begin, end) == 0;

      axiom range:
        \forall int *p, integer begin, end; begin < end
            ==> sum(p, begin, end) == sum(p, begin, end - 1) + p[end - 1];
}
*/



/*@ requires 0 < n < SIZE_MAX && \valid(numbers+(0..n-1));
    requires numbers[0] == 1 && \forall int j; 1 <= j <= n-1 ==> numbers[j] == numbers[j-1]+1;
    assigns \nothing;
    ensures \result == sum(numbers, 0, n);
*/
int sumOfNumbers(int numbers[], size_t n) {
	int acc = 0;
	/*@ loop invariant 0 <= index <= n;
	  loop invariant numbers[0]+numbers[n-1] == numbers[index]+numbers[n-index-1];
	  loop invariant acc == sum(numbers, 0, index);
	  loop assigns acc, index;
	  loop variant n - index;
	  */
	for (size_t index = 0; index < n; index++)
		acc += numbers[index];
	return acc;
}


int main() {
	int numbers[] = {1,2,3,4,5};
	sumOfNumbers(numbers, sizeof(numbers)/sizeof(numbers[0]));
	return 0;
}
