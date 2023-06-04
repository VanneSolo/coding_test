io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  joueur = {}
  joueur.r = 20
  joueur.x = largeur/2
  joueur.y = hauteur-joueur.r
  joueur.vitesse = 5
  
  barre_de_vie = {}
  barre_de_vie.w = 50
  barre_de_vie.h = 5
  barre_de_vie.x = joueur.x - (barre_de_vie.w/2)
  barre_de_vie.y = joueur.y - joueur.r - 10
  
  points_vie = {}
  points_vie.max = 150
  points_vie.actuel = 150
end

function love.update(dt)
  ratio = points_vie.actuel/points_vie.max
  
  if points_vie.actuel <= points_vie.max then
    points_vie.actuel = points_vie.actuel + 0.05
  end
  
  if love.keyboard.isDown("up") then
    joueur.y = joueur.y - joueur.vitesse
  end
  if love.keyboard.isDown("right") then
    joueur.x = joueur.x + joueur.vitesse
  end
  if love.keyboard.isDown("down") then
    joueur.y = joueur.y + joueur.vitesse
  end
  if love.keyboard.isDown("left") then
    joueur.x = joueur.x - joueur.vitesse
  end
  barre_de_vie.x = joueur.x - (barre_de_vie.w/2)
  barre_de_vie.y = joueur.y - joueur.r - 10
end

function love.draw()
  love.graphics.circle("fill", joueur.x, joueur.y, joueur.r)
  
  love.graphics.rectangle("fill", barre_de_vie.x, barre_de_vie.y, barre_de_vie.w, barre_de_vie.h)
  if ratio > 0.6 then
    love.graphics.setColor(0, 1, 0)
  elseif ratio > 0.3 then
    love.graphics.setColor(0.8, 0.3, 0)
  else
    love.graphics.setColor(1, 0, 0)
  end
  love.graphics.rectangle("fill", barre_de_vie.x+1, barre_de_vie.y+1, (barre_de_vie.w-2)*ratio, barre_de_vie.h-2)
  love.graphics.setColor(1, 1, 1)
end

function love.keypressed(key)
  if key == "space" then
    if points_vie.actuel >= 5 then
      points_vie.actuel = points_vie.actuel - 5
    elseif points_vie.actuel < 5 and points_vie.actuel >= 1 then
      points_vie.actuel = points_vie.actuel - 1
    end
  end
end