--Revoir la conception de la grille de briques avec un tableau et une boucle
--Créer et ajouter des sprites pour les briques, la raquette et la balle.
--Refaire les collisions.

--[[
Créer un objet "écran"
C'est un rectangle dont les côtés font la taille de la fenêtre.
La balle se déplace dedans. Quand elle arrive au niveau d'un bord ou qu'elle le dépasse, on la remet 
au niveau du bord et on inverse sa vitesse.

side
if balle.x >= largeur alors Side = largeur
if balle.x <= 0 alors side = 0

if balle.y <= 0 alors side = 0

Booleen edge = false.
si balle.x >= largeur ou  si balle.x <= 0 ou si balle.y <= 0 
alors edge deviens vrai
si edge == vrai alors balle.x = side
]]