-- couleurs

blanc = {1, 1, 1, 1}
noir = {0, 0, 0, 1}
gris = {0.5, 0.5, 0.5, 1}
gris_clair = {0.75, 0.75, 0.75, 1}
gris_fonce = {0.25, 0.25, 0.25, 1}
rouge = {1, 0, 0, 1}
vert = {0, 1, 0, 1}
bleu = {0, 0, 1, 1}
jaune = {1, 1, 0, 1}
violet = {1, 0, 1, 1}
cyan = {0, 1, 1, 1}
orange = {1, 0.5, 0, 1}
--alpha = 1

--polices d'écriture
font_2 = love.graphics.newFont("assets/graphismes/Montserrat-Regular.ttf")
love.graphics.setFont(font_2)
font_1 = love.graphics.newFont("assets/graphismes/Elite Math New.ttf")
love.graphics.setFont(font_1)

-- boutons
-- boutons du menu
sprite_bouton_menu_idle = {}
sprite_bouton_menu_idle.img = love.graphics.newCanvas(200, 50)
function Load_Bouton_Menu_Idle()
  love.graphics.setCanvas(sprite_bouton_menu_idle.img)
  love.graphics.setColor(vert)
  love.graphics.rectangle("fill", 0, 0, 200, 50)
  love.graphics.setColor(blanc)
  love.graphics.setCanvas()
end

sprite_bouton_menu_survole = {}
sprite_bouton_menu_survole.img = love.graphics.newCanvas(200, 50)
function Load_Bouton_Menu_Survole()
  love.graphics.setCanvas(sprite_bouton_menu_survole.img)
  love.graphics.setColor(rouge)
  love.graphics.rectangle("fill", 0, 0, 200, 50)
  love.graphics.setColor(blanc)
  love.graphics.setCanvas()
end

sprite_bouton_menu_clique = {}
sprite_bouton_menu_clique.img = love.graphics.newCanvas(200, 50)
function Load_Bouton_Menu_Clique()
  love.graphics.setCanvas(sprite_bouton_menu_clique.img)
  love.graphics.setColor(bleu)
  love.graphics.rectangle("fill", 0, 0, 200, 50)
  love.graphics.setColor(blanc)
  love.graphics.setCanvas()
end

-- boutons de catégorie des options
sprite_bouton_option_idle = {}
sprite_bouton_option_idle.img = love.graphics.newCanvas(200, 35)
function Load_Bouton_Option_Idle()
  love.graphics.setCanvas(sprite_bouton_option_idle.img)
  love.graphics.setColor(vert)
  love.graphics.rectangle("fill", 0, 0, 200, 35)
  love.graphics.setColor(blanc)
  love.graphics.setCanvas()
end

sprite_bouton_option_survole = {}
sprite_bouton_option_survole.img = love.graphics.newCanvas(200, 35)
function Load_Bouton_Option_Survole()
  love.graphics.setCanvas(sprite_bouton_option_survole.img)
  love.graphics.setColor(rouge)
  love.graphics.rectangle("fill", 0, 0, 200, 35)
  love.graphics.setColor(blanc)
  love.graphics.setCanvas()
end

sprite_bouton_option_clique = {}
sprite_bouton_option_clique.img = love.graphics.newCanvas(200, 35)
function Load_Bouton_Option_Clique()
  love.graphics.setCanvas(sprite_bouton_option_clique.img)
  love.graphics.setColor(bleu)
  love.graphics.rectangle("fill", 0, 0, 200, 35)
  love.graphics.setColor(blanc)
  love.graphics.setCanvas()
end

-- boutons de choix des options
sprite_bouton_option_child_idle = {}
sprite_bouton_option_child_idle.img = love.graphics.newCanvas(35, 35)
function Load_Bouton_Option_Child_Idle()
  love.graphics.setCanvas(sprite_bouton_option_child_idle.img)
  love.graphics.setColor(vert)
  love.graphics.rectangle("fill", 0, 0, 35, 35)
  love.graphics.setColor(blanc)
  love.graphics.setCanvas()
end

sprite_bouton_option_child_survole = {}
sprite_bouton_option_child_survole.img = love.graphics.newCanvas(35, 35)
function Load_Bouton_Option_Child_Survole()
  love.graphics.setCanvas(sprite_bouton_option_child_survole.img)
  love.graphics.setColor(rouge)
  love.graphics.rectangle("fill", 0, 0, 35, 35)
  love.graphics.setColor(blanc)
  love.graphics.setCanvas()
end

sprite_bouton_option_child_clique = {}
sprite_bouton_option_child_clique.img = love.graphics.newCanvas(35, 35)
function Load_Bouton_Option_Child_Clique()
  love.graphics.setCanvas(sprite_bouton_option_child_clique.img)
  love.graphics.setColor(bleu)
  love.graphics.rectangle("fill", 0, 0, 35, 35)
  love.graphics.setColor(blanc)
  love.graphics.setCanvas()
end

-- sprites du jeu
-- terrain
sprite_terrain = {}
sprite_terrain.img = love.graphics.newCanvas(400, 200)
function Load_Terrain()
	love.graphics.setCanvas(sprite_terrain.img)
	love.graphics.setColor(0, 1, 0)
	love.graphics.rectangle("fill", 0, 0, 400, 200)
	love.graphics.setColor(1, 1, 1)
	love.graphics.setCanvas()
end
sprite_terrain.demi_longueur = sprite_terrain.img:getWidth()/2
sprite_terrain.demi_largeur = sprite_terrain.img:getHeight()/2
sprite_terrain.ox = sprite_terrain.img:getWidth()/2
sprite_terrain.oy = sprite_terrain.img:getHeight()/2

-- raquette
sprite_raquette = {}
sprite_raquette.img = love.graphics.newCanvas(20, 50)
function Load_Raquette()
  love.graphics.setCanvas(sprite_raquette.img)
  love.graphics.rectangle("fill", 0, 0, 10, 50)
  love.graphics.setCanvas()
end
sprite_raquette.ox = sprite_raquette.img:getWidth()/2
sprite_raquette.oy = sprite_raquette.img:getHeight()/2