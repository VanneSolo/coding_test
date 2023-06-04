io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

require "vector"
require "dist"
require "display"

function Move(pEntity, pVelocity, dt)
    pEntity.speed = NewVector(0, 0)
    
    if love.keyboard.isDown("up") then
      pEntity.speed = pEntity.speed + NewVector(0, -pVelocity)
    end
    if love.keyboard.isDown("right") then
      pEntity.speed = pEntity.speed + NewVector(pVelocity, 0)
    end
    if love.keyboard.isDown("down") then
      pEntity.speed = pEntity.speed + NewVector(0, pVelocity)
    end
    if love.keyboard.isDown("left") then
      pEntity.speed = pEntity.speed + NewVector(-pVelocity, 0)
    end
    
    if pEntity.speed.norm() ~= 0 then
      pEntity.speed.normalize()
      pEntity.speed = pVelocity * pEntity.speed
      pEntity.pos = pEntity.pos + (dt*pEntity.speed)
    end
end

function MoveAlongVector(pEntity, v1, v2, dt, pVelocity)
  start = NewVector(v1.x, v1.y)
  finish = NewVector(v2.x, v2.y)
  pEntity.pos.x = start.x
  pEntity.pos.y = start.y
  pEntity.speed = pEntity.speed + NewVector(pVelocity, pVelocity)
  
  pEntity.pos.x = pEntity.pos.x + pEntity.speed.x
  pEntity.pos.y = pEntity.pos.y + pEntity.speed.y
  print("pEntity.pos.y: "..pEntity.pos.y)
  if pEntity.pos.x >= finish.x then
    pEntity.pos.x = finish.x
  end
  --[[if pEntity.pos.y >= finish.y then
    pEntity.pos.y = finish.y
  end]]
end

function love.load()
  love.window.setMode(1000, 800)
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  balle = {}
  balle.pos = NewVector(400, 300)
  balle.speed = NewVector(0, 0)
  
  depart = NewVector(80, 150)
  arrivee = NewVector(500, 150)
  arrivee_2 = NewVector(750, 50)
  
  balle_test = {}
  balle_test.pos = NewVector(0, 0)
  balle_test.speed = NewVector(0, 0)
  
  balle_test_2 = {}
  balle_test_2.pos = NewVector(0, 0)
  balle_test_2.speed = NewVector(0, 0)
end

function love.update(dt)
  Move(balle, 100, dt)
  --MoveAlongVector(balle_test, depart, arrivee, dt, 5)
  MoveAlongVector(balle_test_2, arrivee, arrivee_2, dt, 5)
end

function love.draw()
  Grid(1, largeur, 10, 1, hauteur, 10, 0.5, 0.5, 0.5)
  Balle(balle.pos.x, balle.pos.y, 20, balle.pos.x/1000, 0, balle.pos.x/1000)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 10, 10, 150, 40)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print(balle.pos.x, 15, 10)
  love.graphics.print(balle.pos.y, 15, 30)
  
  love.graphics.setColor(1, 0, 0)
  love.graphics.line(depart.x, depart.y, arrivee.x, arrivee.y)
  love.graphics.line(arrivee.x, arrivee.y, arrivee_2.x, arrivee_2.y)
  
  --love.graphics.setColor(0, 1, 0)
  Balle(balle_test.pos.x, balle_test.pos.y, 20, 0, 1, 0)
  Balle(balle_test_2.pos.x, balle_test_2.pos.y, 20, 0, 1, 0)
end