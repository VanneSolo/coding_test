io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  require "physical_shape"
  require "add_fixture"
  require "debug_draw"
  
  DEGTORAD = 0.0174532925199432957
  RADTODEG = 57.295779513082320876
  
  world = love.physics.newWorld(0, 0, true)
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  love.physics.setMeter(25)
  metre = love.physics.getMeter()
  
  aile_droite_points = {{metre, metre}, {metre, -metre}, {metre*2, metre}}
  
  triangle_equi = Create_Regular_Polygon_Shape(world, metre*3, hauteur/2, "static", 3, 360, metre*2)
  square = Create_Regular_Polygon_Shape(world, metre*8, hauteur/2, "static", 4, 360, metre*2)
  pentagon = Create_Regular_Polygon_Shape(world, metre*13, hauteur/2, "static", 5, 360, metre*2)
  hexagon = Create_Regular_Polygon_Shape(world, metre*18, hauteur/2, "static", 6, 360, metre*2)
  heptagon = Create_Regular_Polygon_Shape(world, metre*23, hauteur/2, "static", 7, 360, metre*2)
  octogon = Create_Regular_Polygon_Shape(world, metre*28, hauteur/2, "static", 8, 360, metre*2)
  quart_cercle = Create_Regular_Polygon_Shape(world, metre*8, metre*4, "static", 8, 90, metre*2)
  
  carre = Create_Rect_Shape(world, metre*4, metre*4, "static", metre*2, metre*2)
  aile_droite = Add_Polygon_Fixture(carre.body, aile_droite_points)
end

function love.update(dt)
  world:update(dt)
end

function love.draw()
  Draw_Rect_Or_Poly("line", triangle_equi)
  Draw_Rect_Or_Poly("line", square)
  Draw_Rect_Or_Poly("line", pentagon)
  Draw_Rect_Or_Poly("line", hexagon)
  Draw_Rect_Or_Poly("line", heptagon)
  Draw_Rect_Or_Poly("line", octogon)
  
  Draw_Rect_Or_Poly("line", quart_cercle)
  
  Draw_Rect_Or_Poly("line", carre)
  Draw_Supplemental_Rect_Or_Poly("line", carre, aile_droite)
end