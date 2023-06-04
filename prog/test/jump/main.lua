function love.load()
  require "physical_shape"
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  world = love.physics.newWorld(0, 20, true)
  love.physics.setMeter(25)
  metre = love.physics.getMeter()
  
  remaining_steps = 0
  
  bordures = {}
  bordures[1] = Create_Edge_Shape(world, largeur/2, metre, "static", -metre*15, 0, metre*15, 0)
  bordures[2] = Create_Edge_Shape(world, largeur-metre, hauteur/2, "static", 0, -metre*11, 0, metre*11)
  bordures[3] = Create_Edge_Shape(world, largeur/2, hauteur - metre, "static", -metre*15, 0, metre*15, 0)
  bordures[4] = Create_Edge_Shape(world, metre, hauteur/2, "static", 0, -metre*11, 0, metre*11)
  
  joueur = Create_Rect_Shape(world, largeur/2, hauteur-(metre*1.5), "dynamic", metre, metre)
  
end

function love.update(dt)
  world:update(dt)
  
  velocite_x, velocite_y = joueur.body:getLinearVelocity()
  force=0
  impulse = 0
  impulse_y=0
  target_velocity = 0
  
  if love.keyboard.isDown("up") then
    target_velocity = (velocite_x) * 0.98
  end
  if love.keyboard.isDown("right") then
    target_velocity = math.min(velocite_x+0.5, 25)
  end
  if love.keyboard.isDown("left") then
    target_velocity = math.max(velocite_x-0.5, -25)
  end
  if love.keyboard.isDown("space") then
    if remaining_steps > 0 then
      impulse_y = joueur.body:getMass() * -4
      joueur.body:applyLinearImpulse(0, impulse_y, joueur.body:getWorldCenter())
      remaining_steps = remaining_steps - 1
    else
      impulse_y = 0
    end
  end
  
  change_velocity = target_velocity - velocite_x
  impulse = joueur.body:getMass() * change_velocity
  joueur.body:applyLinearImpulse(impulse, 0, joueur.body:getWorldCenter())
  
end

function love.draw()
  for i=1,4 do
    Draw_Edge(bordures[i])
  end
  
  Draw_Rect_Or_Poly("line", joueur)
   
end

function love.keypressed(key)
  if key == "space" then
    remaining_steps = 15
  end
  
end