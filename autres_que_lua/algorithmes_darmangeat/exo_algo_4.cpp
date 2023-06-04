#include <iostream>
#include <string>

int main(){
	int nombre;
	int i = 1;
	int plusGrand = 0;
	int posPlusGrand;
	
	while(i <= 20){
		std::cout << "Entrez un nombre: " << std::endl;
		std::cin >> nombre;
		
		std::cout << "Avant la boucle: i = " << i << "  nombre = " << nombre << "  plusGrand = " << plusGrand << "  posPlusGrand: " << posPlusGrand << std::endl;
		
		if(i == 1 or nombre > plusGrand){
			plusGrand = nombre;
			posPlusGrand = i;
			std::cout << "Durant la boucle: i = " << i << "  nombre = " << nombre << "  plusGrand = " << plusGrand << "  posPlusGrand: " << posPlusGrand << std::endl;
		}
		
		std::cout << "Apres la boucle: i = " << i << "  nombre = " << nombre << "  plusGrand = " << plusGrand << "  posPlusGrand: " << posPlusGrand << std::endl;
		++i;
		std::cout << "Après l'iteration: i = " << i << "  nombre = " << nombre << "  plusGrand = " << plusGrand << "  posPlusGrand: " << posPlusGrand << std::endl;
	}
	std::cout << "Le plus grand nombre est: " << plusGrand << "." << std::endl;
	std::cout << "Sa position est: " << posPlusGrand << "." << std::endl;
}


---------------------------------------------------------------
----------------------------------------------------------------

#include <iostream>
#include <string>

int main(){
	int nombre;
	int i = 1;
	int plusGrand = 0;
	int posPlusGrand;
	
	while(nombre != 0){
		std::cout << "Entrez un nombre (tapez 0 pour arreter): " << std::endl;
		std::cin >> nombre;
		
		std::cout << "Avant la boucle: i = " << i << "  nombre = " << nombre << "  plusGrand = " << plusGrand << "  posPlusGrand: " << posPlusGrand << std::endl;
		
		if(i == 1 or nombre > plusGrand){
			plusGrand = nombre;
			posPlusGrand = i;
			std::cout << "Durant la boucle: i = " << i << "  nombre = " << nombre << "  plusGrand = " << plusGrand << "  posPlusGrand: " << posPlusGrand << std::endl;
		}
		
		std::cout << "Apres la boucle: i = " << i << "  nombre = " << nombre << "  plusGrand = " << plusGrand << "  posPlusGrand: " << posPlusGrand << std::endl;
		++i;
		std::cout << "Après l'iteration: i = " << i << "  nombre = " << nombre << "  plusGrand = " << plusGrand << "  posPlusGrand: " << posPlusGrand << std::endl;
	}
	std::cout << "Le plus grand nombre est: " << plusGrand << "." << std::endl;
	std::cout << "Sa position est: " << posPlusGrand << "." << std::endl;
}