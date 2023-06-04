io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

require("vecteurs")

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

--##########################################################
-- Générateur de particules.
element = {}
particule = {}
particule.Init = function(x, y, speed, direction, gravity)
  local p = {}
  p.position = Vector(x, y)
  p.velocite = Vector(0, 0)
  p.velocite.Set_Norme(speed)
  p.velocite.Set_Angle(direction)
  p.gravity = Vector(0, gravity)
  table.insert(element, p)
end
particule.Accelerate = function(accel)
  for i=1,#element do
    local p = element[i]
    p.velocite = p.velocite + accel
  end
end
particule.Update = function(dt)
  for i=1,#element do
    local p = element[i]
    p.velocite = p.velocite + p.gravity
    p.position = p.position + p.velocite
  end
end
-- Fin du générateur de particules.
--#######################################################################

-- Création du vaisseau.
ship = {}
ship.Load = particule.Init(largeur/2, hauteur/2, 0, 0, 0)
ship.position = element[1].position
ship.img = love.graphics.newCanvas(30, 20)
function Load_Ship_Img()
  love.graphics.setCanvas(ship.img)
  love.graphics.polygon("fill", 0, 0, 0, 20, 30, 10)
  love.graphics.setCanvas()
end
ship.w = ship.img:getWidth()
ship.h = ship.img:getHeight()
thrust = Vector(0, 0)
angle = 0
turning_right = false
turning_left = false
thrusting = false

--##########################################################################
-- Callbacks de Löve
-- Load
function love.load()
  Load_Ship_Img()
end
-- Update
function love.update(dt)
  turning_right = false
  turning_left = false
  thrusting = false
  
  if love.keyboard.isDown("up") then
    thrusting = true
  end
  if love.keyboard.isDown("right") then
    turning_right = true
  end
  if love.keyboard.isDown("left") then
    turning_left = true
  end
  
  if turning_right then
    angle = angle + 0.05
  end
  if turning_left then
    angle = angle - 0.05
  end
  
  thrust.Set_Angle(angle)
  if thrusting then
    thrust.Set_Norme(0.1)
  else
    thrust.Set_Norme(0)
  end
  particule.Accelerate(thrust)
  particule.Update(dt)
  -- Pour récupérer la position du vaisseau, il faut
  -- aller directement la récupérer dans la liste qui
  -- contient les particules. Ce sera à améliorer.
  ship.position = element[1].position
  if ship.position.x >= largeur then
    ship.position.x = -ship.w
  elseif ship.position.x+ship.w <= 0 then
    ship.position.x = largeur
  end
  if ship.position.y >= hauteur then
    ship.position.y = -ship.h
  elseif ship.position.y+ship.h <= 0 then
    ship.position.y = hauteur
  end
end
-- Draw
function love.draw()
  love.graphics.draw(ship.img, ship.position.x, ship.position.y, angle, 1, 1, ship.w/2, ship.h/2)
  
  love.graphics.print("thrusting: "..tostring(thrusting), 5, 5)
  love.graphics.print("turning right: "..tostring(turning_right), 5, 5+16)
  love.graphics.print("turning left: "..tostring(turning_left), 5, 5+16*2)
  love.graphics.print("thrust: "..tostring(thrust.x)..", "..tostring(thrust.y), 5, 5+16*3)
end
-- Keypressed
function love.keypressed(key)
  
end