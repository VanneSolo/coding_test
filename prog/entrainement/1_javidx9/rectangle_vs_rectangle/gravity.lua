io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

require("vecteurs")

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

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
sun = Particule(largeur/2, hauteur/2, 0, 0, 0)
sun.masse = 20000

--terre = {}
terre = Particule(largeur/2+200, hauteur/2, 10, -math.pi/2, 0)

--##########################################################################
-- Callbacks de Löve
-- Load
function love.load()
  
end
-- Update
function love.update(dt)
  terre.Gravite_Autour(sun)
  terre.Update(dt)
end
-- Draw
function love.draw()
  --Soleil
  love.graphics.setColor(1, 0, 0)
  love.graphics.arc("fill", "pie", sun.position.Get_X(), sun.position.Get_Y(), 20, 0, math.pi*2)
  --Terre
  love.graphics.setColor(0, 0, 1)
  love.graphics.arc("fill", "pie", terre.position.Get_X(), terre.position.Get_Y(), 5, 0, math.pi*2)
  love.graphics.setColor(1, 1, 1)
end
-- Keypressed
function love.keypressed(key)
  
end