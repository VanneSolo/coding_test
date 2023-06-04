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

  world = love.physics.newWorld(0, 50, true)

  love.physics.setMeter(25)
  metre = love.physics.getMeter()
  
  bordures = {}
  bordures[1] = Create_Edge_Shape(world, largeur/2, metre, "static", -metre*15, 0, metre*15, 0)
  bordures[2] = Create_Edge_Shape(world, largeur-metre, hauteur/2, "static", 0, -metre*11, 0, metre*11)
  bordures[3] = Create_Edge_Shape(world, largeur/2, hauteur-metre, "static", -metre*15, 0, metre*15, 0)
  bordures[4] = Create_Edge_Shape(world, metre, hauteur/2, "static", 0, -metre*11, 0, metre*11)
  
  nombre_chainons = 22
  --carre = Create_Rect_Shape(world, metre*5, metre*5, "static", metre*3, metre*3)
  carre_2 = Create_Rect_Shape(world, metre*15, metre*10, "kinematic", metre*3, metre*3)
  carre_2.body:setAngularVelocity(2)
  --carre_2.body:setMass(nombre_chainons * 3)
  --carre_joint = love.physics.newRevoluteJoint(carre.body, carre_2.body, carre.body:getX(), carre.body:getY(), carre_2.body:getX(), carre_2.body:getY(), false)
  --carre_joint:setMotorEnabled(true)
  --carre_joint:setMaxMotorTorque(3000)
  --carre_joint:setMotorSpeed(360*DEGTORAD)
  
  --nombre_chainons = 9
  chainons = {}
  for i=1,nombre_chainons do
    local boite = Create_Rect_Shape(world, largeur/2, hauteur/2, "dynamic", metre*2, metre*0.5)
    --boite.body:setMass(1)
    table.insert(chainons, boite)
  end
  for i=2,#chainons do
    x1 = chainons[i-1].body:getX() + 20
    y1 = chainons[i-1].body:getY()
    x2 = chainons[i].body:getX() - 20
    y2 = chainons[i].body:getY()
    chainons_joint = love.physics.newRevoluteJoint(chainons[i-1].body, chainons[i].body, x1, y1, x2, y2, false)
  end
  
  carre_chaine_joint = love.physics.newRevoluteJoint(carre_2.body, chainons[1].body, carre_2.body:getX()-metre*1.5, carre_2.body:getY()+metre*1.5, chainons[1].body:getX() - 20, chainons[1].body:getY(), false)
  --carre_chaine_joint:setMotorEnabled(true)
  --carre_chaine_joint:setMaxMotorTorque(1500)
  --carre_chaine_joint:setMotorSpeed(-90*DEGTORAD)
end

function love.update(dt)
  world:update(dt)
end

function love.draw()
  for i=1,#bordures do
    Draw_Edge(bordures[i])
  end
  Draw_Rect_Or_Poly("line", carre_2)
  for i=1,nombre_chainons do
    Draw_Rect_Or_Poly("line", chainons[i])
  end
end