#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

/*typedef int bool;
#define TRUE 1
#define FALSE 0*/

/*enum bool {
	FALSE,
	TRUE
};
typedef enum bool bool;*/

int main(void)
{
	/*
	Types entier en C:
	sizeof (char) == 1; TOUOJURS
	sizeof (short int) == 2;
	sizeof (int) == 4;
	sizeof (long int) == 4;
	sizeof (long long int) == 8;
	
	char <= short <= int <= long <= long long 
	*/
	
	char a = 120;
	printf("%d\n", a);
	printf("%d\n", (int) sizeof(a));
	printf("%d\n%d\n%d\n", (int) sizeof(short), (int) sizeof(int), (int) sizeof(long));
	
	char b = 65;
	printf("%d\n", b);
	printf("%c\n", b);
	
	/* 
	
	type pointeur de caractère == chaine de caractères
	
	*/
	
	char* c = "Ceci est une chaine de caracteres";
	printf("%s\n", c);
	
	bool d = TRUE;
	printf("%d\n", d);
	
	return EXIT_SUCCESS;
}