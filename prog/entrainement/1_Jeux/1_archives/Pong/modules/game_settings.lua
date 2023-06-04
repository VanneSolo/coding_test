--[[

	On stocke ici la table qui contient tous les game objects.
	C'est aussi ici que sont gérés les paramètres par défaut
	du jeu et certaines fonctions administratives du programme,
	comme la création et l'affichage des boutons pour les menus,
	la gestion du	score ou de la victoire/défaite.

]]

game_objects = {}

Game = {
  current_state = "menu",
  score_j1 = 0,
  score_j2 = 0
}

function Game:Add_Point()
  
end

function Game:Draw_Score()

end

function Game:Victoire()

end

function Game:Defaite()

end

--[[-- Victoire ou défaite.
if point_ia >= 5 then
	current_scene = "DEFAITE"
	point_ia = 0
	point_joueur = 0
	joueur.y = hauteur/2 - joueur.h/2
	ennemi.y = hauteur/2 - ennemi.h/2
elseif point_joueur >= 5 then
	current_scene = "VICTOIRE"
	point_ia = 0
	point_joueur = 0
	joueur.y = hauteur/2 - joueur.h/2
	ennemi.y = hauteur/2 - ennemi.h/2
end]]