io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")


function Pause_Update(dt)
  
end

function Pause_Draw()
  
end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  general_speed = 5
  
  haut = {}
  haut.x1 = 50
  haut.y1 = 50
  haut.x2 = largeur-50
  haut.y2 = 50
  
  droite = {}
  droite.x1 = largeur-50
  droite.y1 = 50
  droite.x2 = largeur-50
  droite.y2 = hauteur-50
  
  bas = {}
  bas.x1 = 50
  bas.y1 = hauteur-50
  bas.x2 = largeur-50
  bas.y2 = hauteur-50
  
  gauche = {}
  gauche.x1 = 50
  gauche.y1 = 50
  gauche.x2 = 50
  gauche.y2 = hauteur-50
  
  balle = {}
  balle.x = largeur/2
  balle.y = hauteur/2
  balle.r = 6
  balle.vx = general_speed
  balle.vy = general_speed
  
  current_state = "GAME"
end

function love.update(dt)
  
  
  if current_state == "PAUSE" then
  elseif current_state == "GAME" then
    if balle.x >= droite.x1-balle.r then
      balle.x = droite.x1-balle.r
      balle.vx = -balle.vx
    elseif balle.x <= gauche.x1+balle.r then
      balle.x = gauche.x1+balle.r
      balle.vx = -balle.vx
    end
    if balle.y >= bas.y1-balle.r then
      balle.y = bas.y1-balle.r
      balle.vy = -balle.vy
    elseif balle.y <= haut.x1+balle.r then
      balle.y = haut.x1+balle.r
      balle.vy = -balle.vy
    end
    balle.x = balle.x + balle.vx
    balle.y = balle.y + balle.vy
  end
  
end

function love.draw()
  love.graphics.line(haut.x1, haut.y1, haut.x2, haut.y2)
  love.graphics.line(droite.x1, droite.y1, droite.x2, droite.y2)
  love.graphics.line(bas.x1, bas.y1, bas.x2, bas.y2)
  love.graphics.line(gauche.x1, gauche.y1, gauche.x2, gauche.y2)
  
  love.graphics.circle("fill", balle.x, balle.y, balle.r)
  
  love.graphics.print("current state: "..tostring(current_state))
  if current_state == "PAUSE" then
    love.graphics.setColor(0.8, 0.42, 0.56, 0.25)
    love.graphics.rectangle("fill", 350, 200, 100, 200)
    love.graphics.setColor(1, 1, 1)
  end
end

function love.keypressed(key)
  if key == "space" and current_state == "GAME" then
    current_state = "PAUSE"
  elseif key == "space" and current_state == "PAUSE" then
    current_state = "GAME"
  end
end