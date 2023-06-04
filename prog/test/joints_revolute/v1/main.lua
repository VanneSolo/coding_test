io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()

  require "physical_shape"
  require "add_fixture"
  require "debug_draw"
  
  DEGTORAD = 0.0174532925199432957
  RADTODEG = 57.295779513082320876

  world = love.physics.newWorld(0, 0, true)

  love.physics.setMeter(25)
  metre = love.physics.getMeter()
  
  bordures = {}
  bordures[1] = Create_Edge_Shape(world, largeur/2, metre, "static", -metre*15, 0, metre*15, 0)
  bordures[2] = Create_Edge_Shape(world, largeur-metre, hauteur/2, "static", 0, -metre*11, 0, metre*11)
  bordures[3] = Create_Edge_Shape(world, largeur/2, hauteur-metre, "static", -metre*15, 0, metre*15, 0)
  bordures[4] = Create_Edge_Shape(world, metre, hauteur/2, "static", 0, -metre*11, 0, metre*11)
  
  carre = Create_Rect_Shape(world, largeur/2, hauteur/2, "dynamic", metre*2, metre*2)
  carre.fixture:setDensity(1)
  cercle = Create_Circle_Shape(world, largeur/2+metre*3, hauteur/2, "dynamic", metre)
  cercle.fixture:setDensity(1)
  
  x1 = carre.body:getX() - metre
  y1 = carre.body:getY() + metre
  x2 = cercle.body:getX() + metre
  y2 = cercle.body:getY() - metre
  motor_torque = 100
  motor_speed = 360 * DEGTORAD
  rev_joint = love.physics.newRevoluteJoint(carre.body, cercle.body, x1, y1, x2, y2, false)
  rev_joint:setLimitsEnabled(true)
  rev_joint:setLimits(-90*DEGTORAD, 90*DEGTORAD)
  rev_joint_min = rev_joint:getLowerLimit()
  rev_joint_max = rev_joint:getUpperLimit()
  rev_joint:setMotorEnabled(true)
end

function love.update(dt)
  world:update(dt)
  rev_joint_x1, rev_joint_y1, rev_joint_x2, rev_joint_y2 = rev_joint:getAnchors()
  
  if rev_joint:getJointAngle() < rev_joint_min or rev_joint:getJointAngle() > rev_joint_max then
    motor_speed = motor_speed * -1
  end
  rev_joint:setMaxMotorTorque(motor_torque)
  rev_joint:setMotorSpeed(motor_speed)
end

function love.draw()
  for i=1,#bordures do
    Draw_Edge(bordures[i])
  end
  Draw_Rect_Or_Poly("line", carre)
  Draw_Circle("line", cercle)
  love.graphics.setColor(0, 1, 0)
  love.graphics.line(carre.body:getX(), carre.body:getY(), rev_joint_x1, rev_joint_y1)
  love.graphics.setColor(1, 0, 0)
  love.graphics.line(cercle.body:getX(), cercle.body:getY(), rev_joint_x2, rev_joint_y2)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("current joint angle: "..tostring(rev_joint:getJointAngle()*RADTODEG), 30, 30)
  love.graphics.print("current joint speed: "..tostring(rev_joint:getJointSpeed()), 30, 30+16)
  love.graphics.print("current motor torque: "..tostring(motor_torque), 30, 30+16*2)
  love.graphics.print("current motor speed: "..tostring(motor_speed), 30, 30+16*3)
end