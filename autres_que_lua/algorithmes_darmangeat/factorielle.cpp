#include <iostream>
#include <string>

/*

Programme qui permet de calculer la factorielle d'un nombre.

*/

int main(){
	
	/*
	
	On crée une variable nombre qui servira à stocker le nombre entré par l'utilisateur
	et dont il faudra calculer la factorielle.
	
	*/
	
	int nombre;
	
	std::cout << "Entrez un nombre: " << std::endl;
	std::cin >> nombre;
	
	/*
	
	On crée une variable quelconque (ici j). On lance une boucle for. A chaque tour
	de boucle on affecte à j sa propre valeur multipliée par i, la variable locale qui sert 
	à incrémenter la boucle. C'est à dire qu'à chaque tour de boucle, j prend la précédente 
	valeur de i. Ce qui permet de simuler le calcul   1 * 2 * 3 * 4 * 5 * n = factorielle de n.
	
	*/
	
	int j = 1;
	
	for(int i = 1; i <= nombre;){
		j = j * i;
		std::cout << j << std::endl;
		++i;
	}
}

---------------------------------------------------------------
---------------------------------------------------------------
-----------------------------------------------------------------

#include <iostream>
#include <string>

/*

Programme qui permet de calculer ses chances de gagner aux courses, cas concret d'utilisation
des factorielles.

*/

int main(){
	int nombreChevauxPartant;
	int nombreChevauxJoues;
	int i;
	int A = 1;
	int B = 1;
	
	std::cout << "Entrez le nombre de chevaux partant: " << std::endl;
	std::cin >> nombreChevauxPartant;
	std::cout << "Entrez le nombre de chevaux joues: " << std::endl;
	std::cin >> nombreChevauxJoues;
	
	for(i = 1; i <= nombreChevauxJoues;){
		A = A * (i + nombreChevauxPartant - nombreChevauxJoues);
		B = B * i;
		++i;
	}
	
	std::cout << "Dans l'ordre, vous avez 1 chance sur " << A << " de gagner." << std::endl;
	std::cout << "Dans le desordre, vous avez 1 chance sur " << B << " de gagner." << std::endl;
}