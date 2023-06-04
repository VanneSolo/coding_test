io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

require("vecteurs")
require("math_plus")
require("util")

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



--##########################################################################
-- Callbacks de Löve
-- Load
function love.load()
  
end
-- Update
function love.update(dt)
  
end
-- Draw
function love.draw()
  
end
-- Keypressed
function love.keypressed(key)
  
end
-- Mousepressed
function love.mousepressed(x, y, button)
  
end