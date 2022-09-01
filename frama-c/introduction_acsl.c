#include <stddef.h>
#include <stdio.h>
/*@
  requires \valid(a+(0..n-1));

  assigns  a[0..n-1];

  ensures
  \forall integer i;
    0 <= i < n ==> a[i] == 0;
*/
void set_to_0(int* a, size_t n){
  size_t i;
  /*@
    loop invariant 0 <= i <= n;
    loop invariant
    \forall integer j;
      0 <= j < i ==> a[j] == 0;
    loop assigns i, a[0..n-1];
    loop variant n-i;
  */
  for(i = 0; i < n; ++i)
    a[i] = 0;
}

int main() {
	int x[5] = {1, 1, 1, 1, 1};
	int n = 0;
	scanf("%d", &n);
	set_to_0(x, n);
	return 0;
}
