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
test = Particule(largeur/2, hauteur/2, 3, love.math.random()*math.pi*2, 0)
test.r = 5

bounce = Particule(largeur/2, hauteur/2, 5, love.math.random()*math.pi*2, 0.1)
bounce.r = 10
bounce.doing = -0.9

regen = {}
nb_bulles = 100
for i=1, nb_bulles do
  local p = {}
  p.cree = Particule(largeur/2, hauteur, love.math.random()*8+5, -math.pi/2 + (love.math.random()*0.2-0.1), 0.1)
  p.r = love.math.random()*10+2
  p.g = love.math.random(0.2, 1)
  table.insert(regen, p)
end

regen_2 = {}
boum = {}
nb_etincelles = 100
is_boum = false

--##########################################################################
-- Callbacks de Löve
-- Load
function love.load()
  
end
-- Update
function love.update(dt)
  test.Update(dt)
  if test.position.x + test.r >= largeur then
    test.position.x = 0 - test.r
  elseif test.position.x + test.r <= 0 then
    test.position.x = largeur - test.r
  end
  if test.position.y + test.r >= hauteur then
    test.position.y = 0 - test.r
  elseif test.position.y + test.r <= 0 then
    test.position.y = hauteur - test.r
  end
  
  bounce.Update(dt)
  if bounce.position.x + bounce.r >= largeur then
    bounce.position.Set_X(largeur-bounce.r)
    bounce.velocite.Set_X(bounce.velocite.Get_X()*bounce.doing)
  elseif bounce.position.x - bounce.r <= 0 then
    bounce.position.Set_X(bounce.r)
    bounce.velocite.Set_X(bounce.velocite.Get_X()*bounce.doing)
  end
  if bounce.position.y + bounce.r >= hauteur then
    bounce.position.Set_Y(hauteur-bounce.r)
    bounce.velocite.Set_Y(bounce.velocite.Get_Y()*bounce.doing)
  elseif bounce.position.y - bounce.r <= 0 then
    bounce.position.Set_Y(bounce.r)
    bounce.velocite.Set_Y(bounce.velocite.Get_Y()*bounce.doing)
  end
  
  for i=1, #regen do
    local re = regen[i]
    re.cree.Update(dt)
    if re.cree.position.Get_Y()-re.r >= hauteur then
      re.cree.position.Set_X(largeur/2)
      re.cree.position.Set_Y(hauteur)
      re.cree.velocite.Set_Norme(love.math.random()*8+5)
      re.cree.velocite.Set_Angle(-math.pi/2 + (love.math.random()*0.2-0.1))
    end
  end
  
  if #regen_2 < 100 then
    local p = {}
    p.cree = Particule(largeur/2, hauteur, love.math.random()*8+5, -math.pi/2 + (love.math.random()*0.2-0.1), 0.1)
    p.r = love.math.random()*10+2
    p.b = love.math.random(0.2, 1)
    table.insert(regen_2, p)
  end
  for i=1, #regen_2 do
    local re = regen_2[i]
    re.cree.Update(dt)
    if re.cree.position.Get_Y()-re.r >= hauteur then
      re.cree.position.Set_X(largeur/2)
      re.cree.position.Set_Y(hauteur)
      re.cree.velocite.Set_Norme(love.math.random()*8+5)
      re.cree.velocite.Set_Angle(-math.pi/2 + (love.math.random()*0.2-0.1))
    end
  end
  
  mouse_x, mouse_y = love.mouse.getPosition()
  --if boum ~= nil then
    for i=1, #boum do
      boum[i].cree.Update(dt)
    end
  --end
  if is_boum then
    for i=1,nb_etincelles do
      local p = {}
      p.cree = Particule(mouse_x, mouse_y, love.math.random()*5+2, love.math.random()*math.pi*2, 0)
      p.rayon = love.math.random()*3+1
      p.r = love.math.random()
      p.g = love.math.random()
      table.insert(boum, p)
    end
    is_boum = false
  end
  
  
  Remove_Dead_Particule(boum)
  
  print(#boum, is_boum)
end
-- Draw
function love.draw()
  love.graphics.arc("fill", "pie", test.position.x, test.position.y, test.r, 0, math.pi*2)
  
  love.graphics.setColor(1, 0, 0)
  love.graphics.arc("fill", "pie", bounce.position.x, bounce.position.y, bounce.r, 0, math.pi*2)
  
  for i=1, #regen do
    local re = regen[i]
    love.graphics.setColor(0, re.g, 0)
    love.graphics.arc("fill", "pie", re.cree.position.x, re.cree.position.y, re.r, 0, math.pi*2)
  end
  
  for i=1, #regen_2 do
    local re = regen_2[i]
    love.graphics.setColor(0, 0, re.b)
    love.graphics.arc("fill", "pie", re.cree.position.x, re.cree.position.y, re.r, 0, math.pi*2)
  end
  
  for i=1, #boum do
    local re = boum[i]
    love.graphics.setColor(re.r, re.g, 0)
    love.graphics.arc("fill", "pie", re.cree.position.x, re.cree.position.y, re.r, 0, math.pi*2)
  end
  
  love.graphics.setColor(1, 1, 1)
end
-- Keypressed
function love.keypressed(key)
  
end
-- Mousepressed
function love.mousepressed(x, y, button)
  if button == 1 and is_boum == false then
    is_boum = true
  end
end