#include <limits.h>
/*@
   requires \abs(a-b) <= INT_MAX;
   ensures \result >= 0;
   ensures \abs(a-b) == \result;
*/
int distance(int a, int b) {
	return (b>a) ? b-a : a-b;
}
