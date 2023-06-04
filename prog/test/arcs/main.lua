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
  
  quart_cercle = Create_Arc_Shape(world, largeur/2, hauteur/2, "static", 8, 110, metre*4)
end

function love.update(dt)
  world:update(dt)
end

function love.draw()
  love.graphics.setColor(1, 0, 0)
  love.graphics.line(0, metre*12, largeur, metre*12)
  love.graphics.setColor(1, 1, 1)
  Draw_Rect_Or_Poly("line", quart_cercle)
end