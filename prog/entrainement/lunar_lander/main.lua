io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

largeur = 0
hauteur = 0

ship = {}
sol = {}

explosion = {}

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  ship = {}
  ship.w = 50
  ship.h = 50
  ship.x = largeur/2 - ship.w/2
  ship.y = 100
  ship.vy = 3
  ship.img = love.graphics.newCanvas(ship.w, ship.h)
  ship.boom = false
  ship.prop = false
  
  love.graphics.setCanvas(ship.img)
  love.graphics.setColor(0.5, 0.5, 0.5)
  love.graphics.rectangle("fill", 0, 0, ship.w, ship.h)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
  
  sol = {}
  sol.x1 = 0
  sol.x2 = largeur
  sol.y = hauteur-50
  
  nb_particules = 25
  explosion = {}
  for i=1,nb_particules do
    local braise = {}
    braise.x = ship.x + love.math.random(-2, 2)
    braise.y = sol.y + love.math.random(-2, 2)
    braise.r = 5
    braise.vx = love.math.random(-2, 2)
    braise.vy = love.math.random(-2, 2)
    table.insert(explosion, braise)
  end
  
end

function love.update(dt)
  ship.prop = false
  if love.keyboard.isDown("up") then
    ship.prop = true
  end
  if ship.prop then
    ship.vy = -3
  else
    ship.vy = 3
  end
  
  ship.y = ship.y + ship.vy
  if ship.y >= sol.y-ship.h then
    ship.boom = true
  end
  
  if ship.boom then
    for i=1,#explosion do
      local feu = explosion[i]
      feu.x = feu.x + feu.vx
      feu.y = feu.y + feu.vy
    end
  end
  
end

function love.draw()
  if ship.boom == false then
    love.graphics.draw(ship.img, ship.x, ship.y)
  end
  
  if ship.boom then
    for i=1,#explosion do
      local feu = explosion[i]
      love.graphics.setColor(1, 0, 0)
      love.graphics.circle("fill", feu.x, feu.y, feu.r)
      love.graphics.setColor(1, 1, 1)
    end
  end
  
  love.graphics.line(sol.x1, sol.y, sol.x2, sol.y)
  love.graphics.print("ship.prop: "..tostring(ship.prop), 10, 10)
  love.graphics.print("ship.boom: "..tostring(ship.boom), 10, 10+16)
end

function love.keypressed(key)
  
end