#include <limits.h>

struct State {
	long long min;
	long long max;
	unsigned char response;
};

/*@
   requires LLONG_MIN < environment < LLONG_MAX;
   assigns \nothing;
   ensures \result \in {1,2,4,5,6,7};
   ensures environment == -20 ==> \result == 1;
   ensures environment == 40 ==> \result == 6;
   ensures environment == 2 ==> \result == 1;
   ensures environment == 35 ==> \result == 6;
   ensures environment == 14 ==> \result == 4;
   ensures environment == 45 ==> \result == 7;
   ensures environment == 6 ==> \result == 2;
   ensures environment == 22 ==> \result == 5;
   ensures environment == 9 ==> \result == 2;
*/
int choose_best_decision(int environment) {
	struct State states[6] = {
		{.min=LLONG_MIN,.max=2,.response=1},
		{.min=3,.max=9,.response=2},
		{.min=10,.max=14,.response=4},
		{.min=15,.max=22,.response=5},
		{.min=23,.max=40,.response=6},
		{.min=41,.max=LLONG_MAX,.response=7},
	};
	int n = sizeof(states)/sizeof(states[0]);
	//@ assert \exists int j; 0 <= j < n ==> states[j].min <= environment <= states[j].max;
	int j = 0;
	/*@ loop invariant 0 <= j < n;
	    loop invariant \forall int i; 0 <= i < j ==> !(states[i].min <= environment <= states[i].max);
	    loop assigns j;
	    loop variant n-j;
	 */
	while((states[j].min > environment || environment > states[j].max) && j++<n-1);
	return states[j].response;
}

/*@ 
 assigns \nothing; 
*/
int main() {
	return 0;
}
