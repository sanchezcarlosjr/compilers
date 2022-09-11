typedef int month;

/*@
   requires 1 <= month <= 12;
   assigns \nothing;
   ensures \result \in {28, 30, 31};
 */
month count_days_of(month month) {
	int days[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 } ;
	//@ assert 12 == sizeof(days)/sizeof(days[0]);
	return days[month-1];
}

/*@
   assigns \nothing;
   ensures \result == 0;
*/
int main() {
	int d1 = count_days_of(12);
	//@ assert d1 == 31;
	int d2 = count_days_of(1);
	//@ assert d1 == 28;
	int d3 = count_days_of(0);
	return 0;
}
