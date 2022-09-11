typedef float DEGREE;

/*@ requires a > 0 && b > 0 && 0 < a+b < 180;
    assigns \nothing;
    ensures 0 < \result < 180;
    ensures a + b + \result == 180;
*/
DEGREE calculateLastTriangleAngle(DEGREE a, DEGREE b) {
	return 180-a-b;
}

/*@ 
   assigns \nothing;
   ensures \result == 0;
*/
int main() {
	calculateLastTriangleAngle(150, 29);
	calculateLastTriangleAngle(120, 40);
	return 0;
}
