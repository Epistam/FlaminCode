#include <stdio.h>
#include <stdlib.h>

void fizzbuzz(u_int8_t n) {
	if(n >= 1) {
		fizzbuzz(n-1); // On descend vers 1, et on affichera le FizzBuzz sur le chemin du retour
		if(n%15==0) printf("FizzBuzz "); // <=> n%3 && n%5
		else if(n%5==0) printf("Buzz ");
		else if(n%3==0) printf("Fizz ");
		else printf("%d ", n);
	}
}

int main(void) {
	fizzbuzz(100);
	puts("");

	return EXIT_SUCCESS;
}
