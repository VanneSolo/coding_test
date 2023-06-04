#include <iostream>
#include <string>

/*

Programme qui  détermine quel type de tarif sera appliqué selon l'âge et l'expérience du conducteur.  On déclare les variables. 
age, dureeDePermis et nombreAccident serviront à stocker les valeurs entrées par l'utilisateur du programme. dureeFidelite servira 
à éventuellement faire changer de catégorie l'utilisateur s'il est client depuis plus de cinq ans. couleurTarif est une chaine de 
caractères qui prendra la valeur "rouge", "orange", "vert" ou"bleu" selon les réponses données par l'utilisateur. estAssure est un
booléen qui changera de valeur selon les réponses données par l'utilisateur.

*/

int main(){
	int age;
	int dureeDePermis;
	int nombreAccident;
	int dureeFidelite;
	std::__cxx11::string couleurTarif;
	bool estAssure;
	
	/*
	
	Dans ce bloc de code on demande à l'utilisateur son âge, depuis combien de temps il a son permis et s'il a déjà causé des accidents. On 
	stocke les réponses dans les variables correspondantes.
	
	*/
	
	std::cout << "Quel est votre age? " << std::endl;
	std::cin >> age;
	std::cout << "Depuis combien de temps avez-vous votre permis de conduire? " << std::endl;
	std::cin >> dureeDePermis;
	std::cout << "Combien d'accident avez-vous cause? " << std::endl;
	std::cin >> nombreAccident;
	
	/*
	
	On utilise une structure de contrôle pour vérifier l'âge de l'utilisateur. Ensuite avec un premier if imbriqué, on 
	vérifie depuis combien de temps il possède le permis de conduire puis, avec un second if imbriqué, on regarde 
	s'il a déjà causée des accidents. Selon les réponses de l'utilisateur, on l'informe s'il peut être assuré et si oui à
	quel tarif.
	Enfin on affecte à couleurTarif et estAssure les valeurs correspondant aux réponses de l'utilisateur.
	
	*/
	
	if(age < 25){
		if(dureeDePermis < 2){
			if(nombreAccident != 0){
				std::cout << "Vous ne pouvez pas etre assure ici." << std::endl;
				estAssure = false;
			}
			else{
				std::cout << "Vous serez assure au tarif rouge." << std::endl;
				couleurTarif = "rouge";
				estAssure = true;
			}
		}
		else{
			if(nombreAccident == 0){
				std::cout << "Vous serez assure au tarif orange." << std::endl;
				couleurTarif = "orange";
				estAssure = true;
			}
			else if(nombreAccident == 1){
				std::cout << "Vous serez assure au tarif rouge." << std::endl;
				couleurTarif = "rouge";
				estAssure = true;
			}
			else{
				std::cout << "Vous ne pouvez pas etre assure ici." << std::endl;
				estAssure = false;
			}
		}
	}
	else{
		if(dureeDePermis < 2){
			if(nombreAccident == 0){
				std::cout << "Vous serez assure au tarif orange." << std::endl;
				couleurTarif = "orange";
				estAssure = true;
			}
			else if(nombreAccident == 1){
				std::cout << "Vous serez assure au tarif rouge." << std::endl;
				couleurTarif = "rouge";
				estAssure = true;
			}
			else{
				std::cout << "Vous ne pouvez pas etre assure ici." << std::endl;
				estAssure = false;
			}
		}
		else{
			if(nombreAccident == 0){
				std::cout << "Vous serez assure au tarif vert." << std::endl;
				couleurTarif = "vert";
				estAssure = true;
			}
			else if(nombreAccident == 1){
				std::cout << "Vous serez assure au tarif orange." << std::endl;
				couleurTarif = "orange";
				estAssure = true;
			}
			else if(nombreAccident == 2){
				std::cout << "Vous serez assure au tarif rouge." << std::endl;
				couleurTarif = "rouge";
				estAssure = true;
			}
			else{
				std::cout << "Vous ne pouvez pas etre assure ici." << std::endl;
				estAssure = false;
			}
		}
	}
	
	/*
	
	Dans le cas où l'utilisateur peut être assuré, on lui demande depuis combien de temps il est client. Si la valeur donnée est  supérieure à 5, alors
	on informe l'utilisateur qu'il a droit à être assuré dans la catégorie au dessus.
	
	*/
	
	if(estAssure != false){
		std::cout << "Depuis combien de temps etes-vous client ici? " << std::endl;
		std::cin >> dureeFidelite;
		
		if(dureeFidelite > 5){
			if(couleurTarif == "rouge"){
				couleurTarif = "orange";
			}
			else if(couleurTarif == "orange"){
				couleurTarif = "vert";
			}
			else if(couleurTarif == "vert"){
				couleurTarif = "bleu";
			}
			std::cout << "Comme vous etes client depuis plus de cinq ans, vous avez droit au tarif " << couleurTarif << "." << std::endl;
		}
		else{
			std::cout << "Comme vous etes client depuis moins de cinq ans, vous n'avez pas le droit au tarif preferentiel." << std::endl;
		}	
	}
}