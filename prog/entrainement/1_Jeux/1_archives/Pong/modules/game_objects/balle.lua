--[[

	Contient les paramètres de base de la balle
	(qui doit être ronde)	et les fonctions pour
	l'update, le draw et le déplacement.

]]

local balle = {
	img = nil
}
function balle:Load()
	
end

function balle:Update(dt)
	
end

function balle:Draw()
	
end

return balle

--[[
balle = {}
balle.w = 10
balle.h = 10
balle.x = largeur/2 - balle.w/2
balle.y = hauteur/2 - balle.h/2
balle.sx = 150
balle.sy = 150

duree_chrono = 0.2
chrono = duree_chrono

-- Inversion de la vitesse de la balle si elle atteint l'un des bords de l'écran. Si c'est le bord droit ou le bord gauche,
-- on replace la balle au centre de l'écran et on incrémente le score du joueur adverse. Si c'est le bord haut ou le bord bas,
-- on déclanche en plus le chrono qui simule le temps de réaction de la raquette IA.
if balle.x >= largeur then
balle.x = largeur/2 - balle.w/2
balle.y = hauteur/2 - balle.h/2
point_ia = point_ia + 1
chrono = duree_chrono
elseif balle.x+balle.w <= 0 then
balle.x = largeur/2 - balle.w/2
balle.y = hauteur/2 - balle.h/2
point_joueur = point_joueur + 1
chrono = duree_chrono
end
if balle.y+balle.h >= hauteur then
balle.y = hauteur-balle.h
balle.sy = -balle.sy
chrono = duree_chrono
elseif balle.y <= 0 then
balle.y = 0
balle.sy = -balle.sy
chrono = duree_chrono
end
-- Maj de la position de la balle.
balle.x = balle.x + balle.sx*dt
balle.y = balle.y + balle.sy*dt]]