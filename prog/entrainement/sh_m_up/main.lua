io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

largeur = 0
hauteur = 0

ennemi = {}
joueur = {}
munition = {}

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  ennemi = {}
  ennemi.w = 30
  ennemi.h = 10
  ennemi.x = largeur
  ennemi.y = love.math.random(0, hauteur-ennemi.h)
  ennemi.alive = true
  
  joueur = {}
  joueur.w = 25
  joueur.h = 25
  joueur.x = 50
  joueur.y = hauteur/2-joueur.h/2
  joueur.vy = 0
  
  munition = {}
  munition.w = 20
  munition.h = 10
  munition.x = joueur.x
  munition.y = joueur.y+munition.h/2
  munition.vx = 0
  munition.tir = false
end

function love.update(dt)
  ennemi.x = ennemi.x - 5
  if ennemi.x <= 0-ennemi.w then
    ennemi.x = largeur
    ennemi.y = love.math.random(0, hauteur-ennemi.h)
  end
  if love.keyboard.isDown("up") then
    joueur.y = joueur.y - 3
  end
  if love.keyboard.isDown("down") then
    joueur.y = joueur.y + 3
  end
  if munition.tir then
    munition.vx = 5
  end
  munition.x = munition.x + munition.vx
  if munition.x >= largeur then
    munition.tir = false
    munition.vx = 0
    munition.x = joueur.x
    munition.y = joueur.y+munition.h/2
  end
  
  boum = CheckCollision(munition.x, munition.y, munition.w, munition.h, ennemi.x, ennemi.y, ennemi.w, ennemi.h)
  if boum then
    ennemi.alive = false
  end
  
end

function love.draw()
  if ennemi.alive then
    love.graphics.setColor(0.12, 0.96, 0.28)
    love.graphics.rectangle("fill", ennemi.x, ennemi.y, ennemi.w, ennemi.h)
  end
  if munition.tir then
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", munition.x, munition.y, munition.w, munition.h)
  end
  love.graphics.setColor(0, 0.2, 0.94)
  love.graphics.rectangle("fill", joueur.x, joueur.y, joueur.w, joueur.h)
  love.graphics.setColor(1, 1, 1)
end

function love.keypressed(key)
  if key == "space" and munition.tir == false then
    munition.tir = true
    munition.y = joueur.y+munition.h/2
  end
end