/*@
    ensures \result == 1 || \result == 0;
    ensures \result == 1 <==> ('a' <= c <= 'z' || 'A' <= c <= 'Z');
 */
int isAlphabetLetter(char c) {
	return 'a' <= c && c <= 'z' || 'A' <= c && c <= 'Z';
}


int main() {
	int r = isAlphabetLetter('x');
	//@ assert r;
	r = isAlphabetLetter('H');
	//@ assert r;
	r = isAlphabetLetter(' ');
	//@ assert !r;
	return 0;
}
