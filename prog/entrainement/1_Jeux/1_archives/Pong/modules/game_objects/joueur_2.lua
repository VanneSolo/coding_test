--[[

	Contient les paramètres de base du joueur2
	(ou de l'IA)et les fonctions pour l'update,
	le draw et le déplacement.

]]

local joueur_2 = {
	img = nil
}
function joueur_2:Load()
	
end

function joueur_2:Update(dt)
	
end

function joueur_2:Draw()
	
end

return joueur_2

--[[
ennemi = {}
ennemi.w = 20
ennemi.h = 50
ennemi.x = 10
ennemi.y = hauteur/2 - ennemi.h/2
ennemi.s = 0
ennemi.vy = 250

point_ia = 0

-- Ecoulement du chronomètre "temps de réaction" de l'IA.
  chrono = chrono - dt
  if chrono <= 0 then
    chrono = 0
  end
  -- Quand le chronomètre atteint 0, on maj la vitesse de la raquette IA en fonction de
  -- sa position par rapport à la balle.
  if chrono == 0 then
    if balle.y+balle.h < ennemi.y+ennemi.h/2 then
      ennemi.s = ennemi.s - 5 - ennemi.vy*dt
    elseif balle.y > ennemi.y+ennemi.h/2 then
      ennemi.s = ennemi.s + 5 + ennemi.vy*dt
    end
  else
    ennemi.s = 0
  end
  -- Maj de la position de la raquette IA.
  ennemi.y = ennemi.y + ennemi.s*dt
  
  
  -- Arrêt de l'IA si elle sort de l'écran
  if ennemi.y < 0 then
    ennemi.y = 0
    ennemi.s = 0
  elseif ennemi.y+ennemi.h > hauteur then
    ennemi.y = hauteur-ennemi.h
    ennemi.s = 0
  end]]