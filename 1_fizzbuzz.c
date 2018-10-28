#include <stdio.h>
#include <stdlib.h>


// Alternative design suggested by the bf version

void fizzbuzz(u_int8_t n) { // 8 bit values for easier kinky binary divisibility check if I feel like it
	if(n >= 1) {
		fizzbuzz(n-1); // Descending towards n, printing FillBuzz on the way back
		if(n%3==0) printf("Fizz");
		if(n%5==0) printf("Buzz");
		if(n%3 != 0 && n%5 != 0) printf("%d", n); // Same number of comparisons yet slightly shorter and more elegant code
		printf(" ");
	}
}

// Original design
/*
void fizzbuzz(u_int8_t n) { // 8 bit values for easier kinky binary divisibility check if I feel like it
	if(n >= 1) {
		fizzbuzz(n-1); // Descending towards n, printing FillBuzz on the way back
		if(n%15==0) printf("FizzBuzz "); // <=> n%3 && n%5
		else if(n%5==0) printf("Buzz ");
		else if(n%3==0) printf("Fizz ");
		else printf("%d ", n); // Space is indeed more elegant : no need to add a condition so the lone comma at the end doens't look retarded
	}
}
*/

int main(void) {
	fizzbuzz(100); // Careful : between 0 and 255
	puts("");

	return EXIT_SUCCESS;
}
