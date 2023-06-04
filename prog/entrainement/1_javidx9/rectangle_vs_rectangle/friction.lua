io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

require("vecteurs")

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

function Remove_Dead_Particule(pElement)
  for i=#pElement,1,-1 do
    local p = pElement[i]
    if p.cree.position.x - p.r >= largeur or
       p.cree.position.x + p.r <= 0 or
       p.cree.position.y - p.r >= hauteur or
       p.cree.position.y + p.r <= 0 then
         table.remove(pElement,i)
    end
  end
end

--##########################################################
-- Générateur de particules.
function Particule(x, y, speed, direction, gravity)
  local particule = {}
  particule.position = Vector(x, y)
  particule.velocite = Vector(0, 0)
  particule.velocite.Set_Norme(speed)
  particule.velocite.Set_Angle(direction)
  particule.gravity = Vector(0, gravity)
  particule.masse = 1
  
  particule.Accelerate = function(accel)
    particule.velocite.Add_To(accel)
  end
  
  particule.Update = function(dt)
    particule.velocite.Multiply_By(particule.friction)
    particule.velocite.Add_To(particule.gravity)
    particule.position.Add_To(particule.velocite)
  end
  
  particule.Angle_Vers = function(particule_2)
    return math.atan2(particule_2.position.Get_Y()-particule.position.Get_Y(), particule_2.position.Get_X()-particule.position.Get_X())
  end
  
  particule.Distance_Vers = function(particule_2)
    local dx = particule_2.position.Get_X() - particule.position.Get_X()
    local dy = particule_2.position.Get_Y() - particule.position.Get_Y()
    return math.sqrt(dx*dx + dy*dy)
  end
  
  particule.Gravite_Autour = function(particule_2)
    local gravite = Vector(0, 0)
    local dist = particule.Distance_Vers(particule_2)
    gravite.Set_Norme(particule_2.masse/(dist*dist))
    gravite.Set_Angle(particule.Angle_Vers(particule_2))
    particule.velocite.Add_To(gravite)
  end
  
  return particule
end

-- Fin du générateur de particules.
--#######################################################################

ship = Particule(largeur/2, hauteur/2, 0, 0, 0)
ship.friction = 0.99
ship.img = love.graphics.newCanvas(40, 20)
function Load_Ship()
  love.graphics.setCanvas(ship.img)
  love.graphics.polygon("fill", 0, 0, 0, 20, 40, 10)
  love.graphics.setCanvas()
end
ship.ox = ship.img:getWidth()/2
ship.oy = ship.img:getHeight()/2
thrust = Vector(0, 0)
angle = 0
thrusting = false
turning_right = false
turning_left = false


--##########################################################################
-- Callbacks de Löve
-- Load
function love.load()
  Load_Ship()
end
-- Update
function love.update(dt)
  thrusting = false
  turning_right = false
  turning_left = false
  if love.keyboard.isDown("up") then
    thrusting = true
  end
  if love.keyboard.isDown("right") then
    turning_right = true
  end
  if love.keyboard.isDown("left") then
    turning_left = true
  end
  
  if thrusting then
    thrust.Set_Norme(0.1)
  else
    thrust.Set_Norme(0)
  end
  if turning_right then
    angle = angle + 0.05
  end
  if turning_left then
    angle = angle - 0.05
  end
  
  thrust.Set_Angle(angle)
  ship.Accelerate(thrust)
  ship.Update(dt)
  
  if ship.position.Get_X()-ship.ox > largeur then
    ship.position.Set_X(-ship.ox)
  elseif ship.position.Get_X()+ship.ox < 0 then
    ship.position.Set_X(largeur+ship.ox)
  end
  
  if ship.position.Get_Y()-ship.oy > hauteur then
    ship.position.Set_Y(-ship.oy)
  elseif ship.position.Get_Y()+ship.oy < 0 then
    ship.position.Set_Y(hauteur+ship.oy)
  end
end
-- Draw
function love.draw()
  love.graphics.draw(ship.img, ship.position.x, ship.position.y, angle, 1, 1, ship.ox, ship.oy)
end
-- Keypressed
function love.keypressed(key)
  
end
-- Mousepressed
function love.mousepressed(x, y, button)
  
end