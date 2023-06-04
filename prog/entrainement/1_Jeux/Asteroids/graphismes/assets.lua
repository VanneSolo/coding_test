canvas_ship = love.graphics.newCanvas(16, 24)
Load_Ship = function()
  love.graphics.setCanvas(canvas_ship)
  love.graphics.setColor(1, 0, 0)
  love.graphics.polygon("fill", 8, 0, 16, 16, 0, 16)
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", 5, 5, 6, 4)
  love.graphics.setCanvas()
 end
 
canvas_reacteur = love.graphics.newCanvas(16, 24)
Load_Reacteur = function()
  love.graphics.setCanvas(canvas_reacteur)
  love.graphics.setColor(1, 1, 0)
  love.graphics.polygon("fill", 8, 24, 0, 16, 16, 16)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

canvas_alien = love.graphics.newCanvas(40, 20)
Load_Alien = function()
  love.graphics.setCanvas(canvas_alien)
  love.graphics.setColor(0, 1, 0)
  love.graphics.ellipse("fill", 20, 15, 20, 5)
  love.graphics.setColor(0, 0, 1)
  love.graphics.arc("fill", 20, 15, 10, 0, -math.pi)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

canvas_bullet = love.graphics.newCanvas(4, 4)
Load_Bullet = function()
  love.graphics.setCanvas(canvas_bullet)
  love.graphics.setColor(0, 0, 1)
  love.graphics.circle("fill", 2, 2, 2)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

canvas_bullet_ovni = love.graphics.newCanvas(4, 4)
Load_Bullet_Ovni = function()
  love.graphics.setCanvas(canvas_bullet_ovni)
  love.graphics.setColor(1, 1, 0)
  love.graphics.circle("fill", 2, 2, 2)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

canvas_asteroid = love.graphics.newCanvas(24, 24)
Load_Asteroid = function()
  love.graphics.setCanvas(canvas_asteroid)
  love.graphics.setColor(0.5, 0.5, 0.5)
  love.graphics.circle("fill", 12, 12, 10)
  love.graphics.setColor(0.3, 0.3, 0.3)
  love.graphics.circle("fill", 5, 19, 3)
  love.graphics.circle("fill", 8, 18, 2)
  --love.graphics.circle("fill", 12, 12, 10)
  love.graphics.setColor(0.8, 0.8, 0.8)
  love.graphics.circle("fill", 5, 5, 3)
  love.graphics.circle("fill", 8, 6, 2)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

canvas_explode = love.graphics.newCanvas(72, 24)
Load_Explode = function()
  love.graphics.setCanvas(canvas_explode)
  -- frame 1
  love.graphics.circle("fill", 14, 13, 3)
  love.graphics.circle("fill", 10, 11, 2)
  love.graphics.circle("fill", 11, 10, 4)
  love.graphics.circle("fill", 13, 14, 3)
  -- frame 2
  love.graphics.circle("fill", 14, 13, 3)
  love.graphics.circle("fill", 10, 11, 2)
  love.graphics.circle("fill", 11, 10, 4)
  love.graphics.circle("fill", 13, 14, 3)
  
  love.graphics.circle("fill", 18, 13, 4)
  love.graphics.circle("fill", 7, 11, 3)
  love.graphics.circle("fill", 11, 5, 5)
  love.graphics.circle("fill", 13, 17, 4)
  -- frame 3
  love.graphics.circle("fill", 18, 13, 5)
  love.graphics.circle("fill", 7, 11, 4)
  love.graphics.circle("fill", 11, 5, 6)
  love.graphics.circle("fill", 13, 17, 5)
  love.graphics.setCanvas()
end

canvas_background = love.graphics.newCanvas(largeur, hauteur)
Load_Background = function()
  love.graphics.setCanvas(canvas_background)
  nb_etoiles = 100
  for i=1,nb_etoiles do
    x = love.math.random(0, largeur)
	y = love.math.random(0, hauteur)
    rayon_etoile = love.math.random(2, 4)
    love.graphics.circle("fill", x, y, rayon_etoile)
  end
  love.graphics.setCanvas()
end

function Load_Assets()
  Load_Background()
  Load_Ship()
  Load_Reacteur()
  Load_Alien()
  Load_Bullet()
  Load_Bullet_Ovni()
  Load_Asteroid()
  Load_Explode()
end