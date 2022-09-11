#include <limits.h>
/*@ requires INT_MIN < x+y < INT_MAX;
    assigns \nothing;
    ensures \result == x+y;
*/
int add(int x, int y) {
	return x+y;
}
