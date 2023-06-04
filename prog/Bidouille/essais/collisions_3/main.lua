io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

require "physics_shape"

function love.load()
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  DEGTORAD = 0.0174532925199432957
  RADTODEG = 57.295779513082320876
  
  world = love.physics.newWorld(0, 20, true)
  love.physics.setMeter(25)
  metre = love.physics.getMeter()
  centimetre = metre/100
  speed = 30
  remaining_steps = 0
  
  force_on = false
  torque_on = false
  
  entites.haut = Create_Edge_Shape(world, largeur/2, 25, "static", -metre*15, 0, metre*15, 0)
  entites.haut.fixture:setRestitution(1)
  entites.droite = Create_Edge_Shape(world, largeur-25, hauteur/2, "static", 0, -metre*11, 0, metre*11, 0)
  entites.droite.fixture:setRestitution(1)
  entites.bas = Create_Edge_Shape(world, largeur/2, hauteur-25, "static", -metre*15, 0, metre*15, 0)
  --entites.bas.fixture:setRestitution(1)
  entites.gauche = Create_Edge_Shape(world, 25, hauteur/2, "static", 0, -metre*11, 0, metre*11)
  entites.gauche.fixture:setRestitution(1)
  
  entites.joueur = Create_Rect_Shape(world, largeur/2, hauteur/2, "dynamic", metre, metre)
  --entites.joueur.fixture:setRestitution(1)
  entites.joueur1 = Create_Rect_Shape(world, largeur/2 - metre*2, hauteur/2, "dynamic", metre, metre)
  entites.joueur2 = Create_Rect_Shape(world, largeur/2 + metre*2, hauteur/2, "dynamic", metre, metre)
  
  entites.obstacle = Create_Rect_Shape(world, metre*12, hauteur/2, "kinematic", metre*2, metre*2)
  
  entites.carre = {}
  
  for i=1, 3 do
    entites.carre[i] = Create_Rect_Shape(world, metre*2+i*metre*2, metre*3, "dynamic", metre, metre)
  end
  
  move_state = {}
  move_state[1] = "MS_STOP"
  move_state[2] = "MS_UP"
  move_state[3] = "MS_RIGHT"
  move_state[4] = "MS_DOWN"
  move_state[5] = "MS_LEFT"
  move_state[6] = "MS_JUMP"
  
  current_ms = "MS_STOP"
  
end

function love.update(dt)
  world:update(dt)
  velocite_x, velocite_y = entites.joueur.body:getLinearVelocity()
  
  velocite_obs_x = 0
  velocite_obs_y = 0
  pos_obs_x, pos_obs_y = entites.obstacle.body:getPosition()
  
  if pos_obs_y >= hauteur - (metre*4) or pos_obs_y <= metre*4 then
    speed = speed * -1
  end
  velocite_obs_y = velocite_obs_y + speed
  entites.obstacle.body:setLinearVelocity(velocite_obs_x, velocite_obs_y)
  
  if love.keyboard.isDown("a") then
    force_on = not force_on
  elseif love.keyboard.isDown("z") then
    entites.carre[2].body:applyLinearImpulse(0, 50, entites.carre[2].body:getWorldPoint(metre, metre))
  elseif love.keyboard.isDown("e") then
    entites.carre[3].body:setTransform(metre*2, metre*2, 0)
  elseif love.keyboard.isDown("q") then
    torque_on = not torque_on
  elseif love.keyboard.isDown("s") then
    entites.carre[2].body:applyAngularImpulse(20)
  end

  if force_on == true then
    entites.carre[1].body:applyForce(0, 50, entites.carre[1].body:getWorldCenter())
  end
  if torque_on == true then
    entites.carre[1].body:applyTorque(20)
  end
  
  
  if love.keyboard.isDown("o") then
    current_ms = "MS_STOP"
  elseif love.keyboard.isDown("up") then
    current_ms = "MS_UP"
  elseif love.keyboard.isDown("right") then
    current_ms = "MS_RIGHT"
  elseif love.keyboard.isDown("down") then
    current_ms = "MS_DOWN"
  elseif love.keyboard.isDown("left") then
    current_ms = "MS_LEFT"
  elseif love.keyboard.isDown("space") then
    current_ms = "MS_JUMP"
  end
  
  if current_ms == "MS_STOP" then
    velocite_x = 0
  elseif current_ms == "MS_UP" then
    velocite_y = -100
  elseif current_ms == "MS_RIGHT" then
    velocite_x = 100
  elseif current_ms == "MS_DOWN" then
    velocite_y = 100
  elseif current_ms == "MS_LEFT" then
    velocite_x = -100
  --elseif current_ms == "MS_JUMP" then
    
  end
  
  entites.joueur.body:setLinearVelocity(velocite_x, velocite_y)
end

function love.draw()
  love.graphics.line(entites.haut.body:getWorldPoints(entites.haut.shape:getPoints()))
  love.graphics.line(entites.droite.body:getWorldPoints(entites.droite.shape:getPoints()))
  love.graphics.line(entites.bas.body:getWorldPoints(entites.bas.shape:getPoints()))
  love.graphics.line(entites.gauche.body:getWorldPoints(entites.gauche.shape:getPoints()))
  
  love.graphics.polygon("line", entites.joueur.body:getWorldPoints(entites.joueur.shape:getPoints()))
  love.graphics.polygon("line", entites.joueur1.body:getWorldPoints(entites.joueur1.shape:getPoints()))
  love.graphics.polygon("line", entites.joueur2.body:getWorldPoints(entites.joueur2.shape:getPoints()))
  love.graphics.polygon("line", entites.obstacle.body:getWorldPoints(entites.obstacle.shape:getPoints()))
  
  for i=1, 3 do
    love.graphics.polygon("line", entites.carre[i].body:getWorldPoints(entites.carre[i].shape:getPoints()))
  end
  
end

function love.keypressed(key)
  if key == "space" then
    current_ms = "MS_JUMP"
  end
  
  if current_ms == "MS_JUMP" then
    --jump_velocity_x, jump_velocity_y = entites.joueur.body:getLinearVelocity()
    --jump_velocity_y = -25
    --entites.joueur.body:setLinearVelocity(jump_velocity_x, jump_velocity_y)
    
    for i = 50, 0, -1 do
      entites.joueur.body:applyForce(0, -50, entites.joueur.body:getWorldCenter())
      i = i - 1
      print(i)
    end
  end
  
end