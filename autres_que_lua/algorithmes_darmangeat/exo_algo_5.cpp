#include <iostream>
#include <string>

int main(){
	int prix = 0;
	int nouveauPrix;
	int payer;
	int difference;
	int dixEuros;
	int cinqEuros;
	
	while(nouveauPrix != 0){
		std::cout << "Entrez un prix (tapez 0 pour arreter.): " << std::endl;
		std::cin >> nouveauPrix;
		prix = prix + nouveauPrix;
	}
	std::cout << "La somme due est: " << prix << std::endl;
	
	std::cout << "Combien payez-vous?: " << std::endl;
	std::cin >> payer;
	
	difference = payer - prix;
	dixEuros = 0;
	
	while(difference >= 10){
		dixEuros = dixEuros + 1;
		difference = difference - 10;
	}
	
	cinqEuros = 0;
	if(difference >= 5){
		cinqEuros = 1;
		difference = difference - 5;
	}
	
	std::cout << "Voici votre monnaie: " << dixEuros << " billet(s) de 10 euros, " << cinqEuros << " billet(s) de 5 euros et " << difference << " pieces de 1 euro." << std::endl;
}


/*

Demander au client d'entrer des prix. 
A chaque tour de boucles ajouter le nouveau prix au montant precedent.
Informer le client de la somme qu'il doit.
Lui demander combien il paye.
Rendre la monnaie par tranche de 10, 5 et 1 euro.









*/