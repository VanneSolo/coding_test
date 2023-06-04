--[[

	Tout ce qu'il faut pour charger et afficher le terrain. Il
	faudra que je m'en occupe en premier après le gestionnaire
	de scènes car tout le jeu s'affiche en fonction de lui.

]]
Load_Terrain()

local terrain = {}
terrain.img = sprite_terrain.img
terrain.x = largeur/2
terrain.y = hauteur/2
terrain.w = terrain.img:getWidth()
terrain.h = terrain.img:getHeight()
-- point haut gauche (jaune)
terrain.haut_gauche_x = terrain.x-sprite_terrain.demi_longueur
terrain.haut_gauche_y = terrain.y-sprite_terrain.demi_largeur
-- point bas gauche (bleu)
terrain.bas_gauche_x = terrain.x-sprite_terrain.demi_longueur
terrain.bas_gauche_y = terrain.y+sprite_terrain.demi_largeur
-- point haut droite (vert)
terrain.haut_droite_x = terrain.x+sprite_terrain.demi_longueur
terrain.haut_droite_y = terrain.y-sprite_terrain.demi_largeur
-- point bas droite (violet)
terrain.bas_droite_x = terrain.x+sprite_terrain.demi_longueur
terrain.bas_droite_y = terrain.y+sprite_terrain.demi_largeur
--print("x", terrain.x, "y", terrain.y, "demi long", sprite_terrain.demi_longueur, "demi large", sprite_terrain.demi_largeur)
--print(terrain.haut_gauche_x, terrain.haut_gauche_y, "jaune")
--print(terrain.bas_gauche_x, terrain.bas_gauche_y, "bleu")
--print(terrain.haut_droite_x, terrain.haut_droite_y, "vert")
--print(terrain.bas_droite_x, terrain.bas_droite_y, "violet")
terrain.rotation = 0

function terrain:Load()
	
end

function terrain:Update(dt)
	if options_assets.orientation == "vertical" then
		terrain.rotation = math.pi/2
    -- point haut gauche
    terrain.haut_gauche_x = terrain.x-sprite_terrain.demi_largeur
    terrain.haut_gauche_y = terrain.y-sprite_terrain.demi_longueur
    -- point bas gauche
    terrain.bas_gauche_x = terrain.x-sprite_terrain.demi_largeur
    terrain.bas_gauche_y = terrain.y+sprite_terrain.demi_longueur
    -- point haut droite
    terrain.haut_droite_x = terrain.x+sprite_terrain.demi_largeur
    terrain.haut_droite_y = terrain.y-sprite_terrain.demi_longueur
    -- point bas droite
    terrain.bas_droite_x = terrain.x+sprite_terrain.demi_largeur
    terrain.bas_droite_y = terrain.y+sprite_terrain.demi_longueur
	elseif options_assets.orientation == "horizontal" then
		terrain.rotation = 0
		-- point haut gauche
    terrain.haut_gauche_x = terrain.x-sprite_terrain.demi_longueur
    terrain.haut_gauche_y = terrain.y-sprite_terrain.demi_largeur
    -- point bas gauche
    terrain.bas_gauche_x = terrain.x-sprite_terrain.demi_longueur
    terrain.bas_gauche_y = terrain.y+sprite_terrain.demi_largeur
    -- point haut droite
    terrain.haut_droite_x = terrain.x+sprite_terrain.demi_longueur
    terrain.haut_droite_y = terrain.y-sprite_terrain.demi_largeur
    -- point bas droite
    terrain.bas_droite_x = terrain.x+sprite_terrain.demi_longueur
    terrain.bas_droite_y = terrain.y+sprite_terrain.demi_largeur
	end
end

function terrain:Draw()
	love.graphics.draw(terrain.img, terrain.x, terrain.y, terrain.rotation, 1, 1, sprite_terrain.ox, sprite_terrain.oy)
	
	love.graphics.setColor(jaune)
	love.graphics.circle("fill", terrain.haut_gauche_x, terrain.haut_gauche_y, 5)
	love.graphics.setColor(bleu)
	love.graphics.circle("fill", terrain.bas_gauche_x, terrain.bas_gauche_y, 5)
  love.graphics.setColor(vert)
	love.graphics.circle("fill", terrain.haut_droite_x, terrain.haut_droite_y, 5)
	love.graphics.setColor(violet)
	love.graphics.circle("fill", terrain.bas_droite_x, terrain.bas_droite_y, 5)
	love.graphics.setColor(blanc)
end

return terrain