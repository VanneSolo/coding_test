#include <iostream>
#include <string>

/*

Programme qui demande à l'utilisateur d'entrer  une date et qui l'informe si cette date est valide ou non. On commence 
par définir les variables dont on aura besoin. jour, moid et annee serviront à stocker les données entrées par l'utilisateur.
jourBon et moisBon sont des booléens qui serviront à vérifier que le jour et le mois entrés par l'utilisateur sont valides.

*/

int main(){
	int jour;
	int mois;
	int annee;
	bool jourBon = true;
	bool moisBon = true;
	
	/*
	
	On demande à l'utilisateur d'entrer un nombre pour le jour, un autre pour le mois et un dernier pour l'année. On
	stocke ces valeurs dans les variables correspondantes.
	
	*/
	
	std::cout << "Entrez le jour: " << std::endl;
	std::cin >> jour;
	std::cout << "Entrez le mois: " << std::endl;
	std::cin >> mois;
	std::cout << "Entrez l'annee: " << std::endl;
	std::cin >> annee;
	
	/*
	
	On vérifie si le jour entré est valide. D'abord pour les mois de 31 jours, ensuite pour les mois de 30 jours et enfin pour le cas 
	particulier du mois de février.  Ensuite on revient au if principal et si le numero du mois n'est pas compris entre 1 et 12 alors
	le mois entré n'est pas valide.
	
	*/
	
	if(mois == 1 or mois == 3 or mois == 5 or mois == 7 or mois == 8 or mois == 10 or mois == 12){
		if(jour < 1 or jour > 31){
			jourBon = false;
		}
	}
	else if(mois == 4 or mois == 6 or mois == 9 or mois == 11){
		if(jour < 1 or jour > 30){
			jourBon = false;
		}
	}
	else if(mois == 2){
		if(annee % 100 == 0){
			if(jour < 1 or jour > 28){
				jourBon = false;
			}
		}
		else if((annee % 4 == 0) or (annee % 400 == 0)){
			if(jour < 1 or jour > 29){
				jourBon = false;
			}
		}
		else{
			jourBon = false;
		}
	}
	else{
		moisBon = false;
	}
	
	/*
	
	Pour finir on informe l'utilisateur si la date qu'il a entré est valide ou non.
	
	*/
	
	if(jourBon == true and moisBon == true){
		std::cout << "L'annee " << jour << " | " << mois << " | " << annee << " est valide.";
	}
	else{
		std::cout << "L'annee " << jour << " | " << mois << " | " << annee << " n'est pas valide.";
	}
}