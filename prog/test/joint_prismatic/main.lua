io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  love.graphics.setPointSize(3)

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
  
  chassis = Create_Rect_Shape(world, largeur/2, hauteur-metre*2.5, "dynamic", metre*5, metre*3)
  bras_levage = Create_Rect_Shape(world, chassis.body:getX()+metre*4, chassis.body:getY()-metre*0.75, "dynamic", metre, metre*4)
  joint_levage = love.physics.newPrismaticJoint(chassis.body, bras_levage.body, -metre, -metre*1.5, metre, metre, 0, -1, false, -5*DEGTORAD)
  joint_levage:setLimitsEnabled(true)
  joint_levage:setLimits(0, metre*4)
  joint_levage:setMotorEnabled(true)
  joint_levage:setMaxMotorForce(500)
  joint_levage:setMotorSpeed(5)
end

function love.update(dt)
  world:update(dt)
  
  if love.keyboard.isDown("right") then
    chassis.body:setLinearVelocity(15, 0)
  end
  if love.keyboard.isDown("left") then
    chassis.body:setLinearVelocity(-15, 0)
  end
  if love.keyboard.isDown("kp0") then
    chassis.body:setLinearVelocity(0, 0)
  end
end

function love.draw()
  for i=1,#bordures do
    Draw_Edge(bordures[i])
  end
  Draw_Rect_Or_Poly("line", chassis)
  Draw_Rect_Or_Poly("line", bras_levage)
  
  love.graphics.print("joint translation: "..tostring(joint_levage:getJointTranslation()), 30, 30)
  love.graphics.print("joint speed: "..tostring(joint_levage:getJointSpeed()), 30, 30+16)
end