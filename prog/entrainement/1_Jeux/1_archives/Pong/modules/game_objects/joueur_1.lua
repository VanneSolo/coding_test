--[[

	Contient les paramètres de base du joueur et
	les fonctions pour l'update, le draw et le
	déplacement

]]
Load_Raquette()

local spawn_gauche = Mid(terrain.haut_gauche_x, terrain.haut_gauche_y, terrain.bas_gauche_x, terrain.bas_gauche_y)
local spawn_droite = Mid(terrain.haut_droite_x, terrain.haut_droite_y, terrain.bas_droite_x, terrain.bas_droite_y)
local spawn_haut = Mid(terrain.haut_gauche_x, terrain.haut_gauche_y, terrain.haut_droite_x, terrain.haut_droite_y)
local spawn_bas = Mid(terrain.bas_gauche_x, terrain.bas_gauche_y, terrain.bas_droite_x, terrain.bas_droite_y)
--print(spawn_gauche.x, spawn_gauche.y, spawn_haut.x, spawn_haut.y, spawn_droite.x, spawn_droite.y, spawn_bas.x, spawn_bas.y)
position = spawn_gauche

local joueur_1 = {}
joueur_1.img = sprite_raquette.img
joueur_1.w = joueur_1.img:getWidth()
joueur_1.h = joueur_1.img:getHeight()
joueur_1.x = position.x
joueur_1.y = position.y
joueur_1.rotation = 0
joueur_1.velocite = 25
joueur_1.speed = 0
--joueur_1.ox = jo

if options_assets.side == "gauche" then
  joueur_1.x = position.x+10
  joueur_1.y = position.y
elseif options_assets.side == "droite" then
  joueur_1.x = position.x+terrain.w
  joueur_1.y = position.y
elseif options_assets.side == "haut" then
  joueur_1.x = position.x
  joueur_1.y = position.y+10
elseif options_assets.side == "bas" then
  joueur_1.x = position.x
  joueur_1.y = position.y+terrain.w
end
  
function joueur_1:Load()
	
end

function joueur_1:Update(dt)
  spawn_gauche = Mid(terrain.haut_gauche_x, terrain.haut_gauche_y, terrain.bas_gauche_x, terrain.bas_gauche_y)
  spawn_droite = Mid(terrain.haut_droite_x, terrain.haut_droite_y, terrain.bas_droite_x, terrain.bas_droite_y)
  spawn_haut = Mid(terrain.haut_gauche_x, terrain.haut_gauche_y, terrain.haut_droite_x, terrain.haut_droite_y)
  spawn_bas = Mid(terrain.bas_gauche_x, terrain.bas_gauche_y, terrain.bas_droite_x, terrain.bas_droite_y)
  
  if terrain.rotation == 0 then
    joueur_1.rotation = 0
    position = spawn_gauche
  elseif terrain.rotation == math.pi/2 then
    position = spawn_haut
    joueur_1.rotation = math.pi/2
  end
  --print(position.x, position.y)
  
	--[[if options_assets.side == "gauche" then
    joueur_1.x = position.x+10
    joueur_1.y = position.y
  elseif options_assets.side == "droite" then
    joueur_1.x = position.x+terrain.w
    joueur_1.y = position.y
  elseif options_assets.side == "haut" then
    joueur_1.x = position.x
    joueur_1.y = position.y+10
  elseif options_assets.side == "bas" then
    joueur_1.x = position.x
    joueur_1.y = position.y+terrain.w
  end]]
  --print(options_assets.side)
  
  if love.keyboard.isDown("up") then
    joueur_1.y = joueur_1.y - 10
  end
  if love.keyboard.isDown("down") then
    joueur_1.y = joueur_1.y + 10
  end
end

function joueur_1:Draw()
	love.graphics.draw(joueur_1.img, joueur_1.x, joueur_1.y, joueur_1.rotation, 1, 1, sprite_raquette.ox, sprite_raquette.oy)
  love.graphics.setColor(rouge)
  love.graphics.circle("fill", position.x, position.y, 5)
  love.graphics.setColor(blanc)
  --print(joueur_1.x, joueur_1.y)
  love.graphics.print(spawn_gauche.x..", "..spawn_gauche.y..", "..spawn_haut.x..", "..spawn_haut.y..", "..spawn_droite.x..", "..spawn_droite.y..", "..spawn_bas.x..", "..spawn_bas.y)
end

return joueur_1


--[[
joueur = {}
joueur.w = 20
joueur.h = 50
joueur.x = largeur - 30
joueur.y = hauteur/2 - joueur.h/2
joueur.s = 0
joueur.vy = 25

point_joueur = 0

-- Cape la vitesse du joueur à 0 si elle atteint une valeur trop basse.
if joueur.s < 0.1 and joueur.s > -0.1 then
joueur.s = 0
end
-- Maj de la vitesse du joueur selon les inputs clavier.
if joueur.s <= 5 and joueur.s >= -5 then
if love.keyboard.isDown("up") then
  joueur.s = joueur.s - joueur.vy*dt
elseif love.keyboard.isDown("down") then
  joueur.s = joueur.s + joueur.vy*dt
end
end
-- Maj de la position du joueur.
joueur.s = joueur.s * 0.98
joueur.y = joueur.y + joueur.s
-- Arrêt du joueur si sa raquette sort des limites de l'écran.
if joueur.y <= 0 then
joueur.y = 0
joueur.s = 0
elseif joueur.y+joueur.h >= hauteur then
joueur.y = hauteur - joueur.h
joueur.s = 0
end]]