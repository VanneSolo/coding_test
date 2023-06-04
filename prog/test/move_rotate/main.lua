  function love.load()
  require "physical_shape"
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  DEGTORAD = 0.0174532925199432957
  RADTODEG = 57.295779513082320876
  
  world = love.physics.newWorld(0, 0, true)
  love.physics.setMeter(25)
  metre = love.physics.getMeter()
  
  isPressed = false
  isPressed2 = false
  
  verts_hexagon = {}
  for i=1,6 do
    angle = -i/6 * 360 * DEGTORAD
    verts_hexagon[i] = {math.sin(angle)*metre, math.cos(angle)*metre}
  end
  verts_hexagon[6][1] = 0
  verts_hexagon[6][2] = 4*metre
  
  verts_tri = {}
  verts_tri[1] = {-10, 0}
  verts_tri[2] = {0, 10}
  verts_tri[3] = {10, 0}
  
  speed = 30
  
  bordures = {}
  bordures[1] = Create_Edge_Shape(world, largeur/2, metre, "static", -metre*15, 0, metre*15, 0)
  bordures[2] = Create_Edge_Shape(world, largeur-metre, hauteur/2, "static", 0, -metre*11, 0, metre*11)
  bordures[3] = Create_Edge_Shape(world, largeur/2, hauteur - metre, "static", -metre*15, 0, metre*15, 0)
  bordures[4] = Create_Edge_Shape(world, metre, hauteur/2, "static", 0, -metre*11, 0, metre*11)
  
  joueur = Create_Rect_Shape(world, largeur/2, hauteur/2, "dynamic", metre, metre)
  hexagone = Create_Polygon_Shape(world, largeur/2, metre*6, "dynamic", verts_hexagon)
  triangle = Create_Polygon_Shape(world, metre*4, metre*8, "dynamic", verts_tri)

  move_state = {}
  move_state[1] = "MS_STOP"
  move_state[2] = "MS_RIGHT"
  move_state[3] = "MS_LEFT"
  move_state[4] = "MS_R_LEFT"
  move_state[5] = "MS_R_RIGHT"
  move_state[6] = "MS_JUMP"
  
  current_ms = "MS_STOP"
end

function love.update(dt)
  world:update(dt)
  
  if isPressed then
    Rotate_Body(dt, triangle)
  elseif isPressed2 then
    Rotate_Body(dt, hexagone)
  end
    
  velocite_x, velocite_y = joueur.body:getLinearVelocity()
  target_vel = 0
  if love.keyboard.isDown("up") then
    current_ms = "MS_STOP"
  elseif love.keyboard.isDown("right") then
    current_ms = "MS_RIGHT"
  elseif love.keyboard.isDown("left") then
    current_ms = "MS_LEFT"
  elseif love.keyboard.isDown("a") then
    current_ms = "MS_R_RIGHT"
  elseif love.keyboard.isDown("q") then
    current_ms = "MS_R_LEFT"
  end
  
  if current_ms == "MS_STOP" then
    target_vel = velocite_x * 0.98
  elseif current_ms == "MS_RIGHT" then
    target_vel = math.min(velocite_x+0.5, speed)
  elseif current_ms == "MS_LEFT" then
    target_vel = math.max(velocite_x-0.5, -speed)
  elseif current_ms == "MS_R_RIGHT" then
    
  elseif current_ms == "MS_R_LEFT" then
    
  end
  change_vel = target_vel - velocite_x
  impulse = joueur.body:getMass() * change_vel
  joueur.body:applyLinearImpulse(impulse, 0, joueur.body:getWorldCenter() )
  
end

function love.draw()
  for i=1,4 do
    Draw_Edge(bordures[i])
  end
  
  Draw_Rect_Or_Poly("line", joueur)
  Draw_Rect_Or_Poly("line", hexagone)
  Draw_Rect_Or_Poly("line", triangle)
  
  if isPressed==true then
    love.graphics.setColor(1, 0, 0)
    love.graphics.points(mouse_x, mouse_y)
    love.graphics.setColor(1, 1, 1)
  elseif isPressed2==true then
    love.graphics.setColor(0, 1, 0)
    love.graphics.points(mouse_x, mouse_y)
    love.graphics.setColor(1, 1, 1)
  end
  
end

function love.keypressed(key)
  if key == "space" then
    current_ms = "MS_JUMP"
  end
  
  if current_ms == "MS_JUMP" then
    
  end
  
end

function love.mousepressed(x, y, button)
  if button==1 then
    isPressed = true
  elseif button==2 then
    isPressed2 = true
  end
end

function love.mousereleased(x, y, button)
  if button==1 then
    isPressed = false
  elseif button==2 then
    isPressed2 = false
  end
end

function Rotate_Body(dt, pEntite)
  mouse_x, mouse_y = love.mouse.getPosition()
  body_angle = pEntite.body:getAngle()
  
  body_target_x = mouse_x - pEntite.body:getX()
  body_target_y = mouse_y - pEntite.body:getY()
  
  target_angle = math.atan2(-body_target_x, body_target_y)
  next_angle = body_angle + pEntite.body:getAngularVelocity() / 3
  total_rotation = target_angle - next_angle
  while total_rotation < -180 * DEGTORAD do total_rotation = total_rotation + 360 * DEGTORAD end
  while total_rotation > 180 * DEGTORAD do total_rotation = total_rotation - 360 * DEGTORAD end
  target_angular_velocity = total_rotation*60
  change = 1 * DEGTORAD
  target_angular_velocity = math.min(change, math.max(-change, target_angular_velocity))
  impulse = pEntite.body:getInertia() * target_angular_velocity
  
  pEntite.body:applyAngularImpulse(impulse)
  --pEntite.body:applyForce(body_target_x, body_target_y)
end