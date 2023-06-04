if arg[#arg] =="-debug" then require("mobdebug").start() end

function love.load()
  require "physical_shape"
  require "debug_draw"
  require "joueur"
  require "balle"
  
  love.window.setMode(1250, 600)
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  largeur_drawzone = 800
  hauteur_drawzone = 600
  
  world = love.physics.newWorld(0, 0, true)
  love.physics.setMeter(25)
  metre = love.physics.getMeter()
  
  bordures = {}
  bordures[1] = Create_Edge_Shape(world, largeur_drawzone/2, metre, "static", -metre*15, 0, metre*15, 0)
  bordures[2] = Create_Edge_Shape(world, largeur_drawzone-metre, hauteur_drawzone/2, "static", 0, -metre*11, 0, metre*11)
  bordures[3] = Create_Edge_Shape(world, largeur_drawzone/2, hauteur_drawzone-metre, "static", -metre*15, 0, metre*15, 0)
  bordures[4] = Create_Edge_Shape(world, metre, hauteur_drawzone/2, "static", 0, -metre*11, 0, metre*11)
  
  j1 = Create_Joueur()
  j1.Load()
  
  balle_test = Create_Balle()
  balle_test.Load()
end

function love.update(dt)
  world:update(dt)
  j1.Update(dt)
end

function love.draw()
  for i=1,4 do
    Draw_Edge(bordures[i])
  end
  j1.Draw()
  balle_test.Draw()
end