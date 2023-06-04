io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

require("utils")
require("particule")
require("maths")
require("vector")
require("collisions")

penta = Create_Poly_Points(5, 30, 0)
tri = Create_Poly_Points(3, 20, 0)
quad = Create_Poly_Points(4, 40, math.pi/4)

-- Table qui contient tous les polygones.
entites = {}
entites[1] = Create_Polygon(penta, 100, 100, 0, "pentagon")
entites[2] = Create_Polygon(tri, 300, 300, 0, "triangle")
entites[3] = Create_Polygon(quad, 650, 250, 0, "carre")

-- Navigation entre les différents algorithmes, mode par défaut.
mode = 0

-- LOAD
function love.load()
  love.graphics.setPointSize(5)
end

-- UPDATE
function love.update(dt)
  Rotate_And_Move(entites[1], "up", "down", "right", "left", dt)
  Rotate_And_Move(entites[2], "z", "s", "d", "q", dt)
  Rotate_And_Move(entites[3], "kp8", "kp5", "kp6", "kp4", dt)
  
  -- Vérification des overlaps.
  hit = false
  for i=1,#entites do
    entites[i].Update(dt)
    for j=i+1,#entites do
      if mode == 0 then
        entites[i].overlap = Sat_Overlap(entites[i], entites[j])
      elseif mode == 1 then
        entites[i].overlap = Sat_Resolution(entites[i], entites[j])
      elseif mode == 2 then
        entites[i].overlap = Diags_Overlap(entites[i], entites[j])
      elseif mode == 3 then
        entites[i].overlap = Diags_Resolution(entites[i], entites[j])
      end
      if entites[1].overlap then
        hit = true
      end
    end
  end
end

-- DRAW
function love.draw()
  for i=1,#entites do
    love.graphics.setColor(0, 1, 0)
    entites[i].Draw()
    if hit then
      love.graphics.setColor(1, 0, 0)
    else
      love.graphics.setColor(1, 1, 1)
    end
    entites[1].Draw()
  end
  love.graphics.setColor(1, 1, 1)
  love.graphics.line(entites[1].position.x, entites[1].position.y, entites[1].verticies[5].x, entites[1].verticies[5].y)
  love.graphics.setColor(0, 1, 1)
  love.graphics.line(entites[2].position.x, entites[2].position.y, entites[2].verticies[3].x, entites[2].verticies[3].y)
  love.graphics.setColor(1, 0, 0)
  for i=1,#entites[1].verticies do
    love.graphics.print(tostring(i), entites[1].verticies[i].x, entites[1].verticies[i].y)
  end
  love.graphics.setColor(0, 1, 0)
  for i=1,#entites[2].verticies do
    love.graphics.print(tostring(i), entites[2].verticies[i].x, entites[2].verticies[i].y)
  end
  for i=1,#entites[3].verticies do
    love.graphics.print(tostring(i), entites[3].verticies[i].x, entites[3].verticies[i].y)
  end
  love.graphics.setColor(1, 1, 1)
  
  -- Debug
  love.graphics.print("mode: "..tostring(mode), 750, 5)
  for i=1,#entites do
    love.graphics.print("entites["..tostring(i).."]: "..tostring(entites[i].ID), 5, 5+16*(i-1))
  end
  
  if mode == 0 then
    love.graphics.print("SAT Overlap", 200, 5)
    love.graphics.print("pentagone/carre: "..tostring(Sat_Overlap(entites[1], entites[3])), 200, 5+16)
    love.graphics.print("pentagone/triangle: "..tostring(Sat_Overlap(entites[1], entites[2])), 200, 5+16*2)
  elseif mode == 1 then
    love.graphics.print("SAT Resolution", 200, 5)
    love.graphics.print("pentagone/carre: "..tostring(Sat_Resolution(entites[1], entites[3])), 200, 5+16)
    love.graphics.print("pentagone/triangle: "..tostring(Sat_Resolution(entites[1], entites[2])), 200, 5+16*2)
  elseif mode == 2 then
    love.graphics.print("Diags Overlap", 200, 5)
    love.graphics.print("pentagone/carre: "..tostring(Diags_Overlap(entites[1], entites[3])), 200, 5+16)
    love.graphics.print("pentagone/triangle: "..tostring(Diags_Overlap(entites[1], entites[2])), 200, 5+16*2)
  elseif mode == 3 then
    love.graphics.print("Diags Resolution", 200, 5)
    love.graphics.print("pentagone/carre: "..tostring(Diags_Resolution(entites[1], entites[3])), 200, 5+16)
    love.graphics.print("pentagone/triangle: "..tostring(Diags_Resolution(entites[1], entites[2])), 200, 5+16*2)
  end
end

-- KEYPRESSED
function love.keypressed(key)
  if key == "kp0" then
    mode = 0
  end
  if key == "kp1" then
    mode = 1
  end
  if key == "kp2" then
    mode = 2
  end
  if key == "kp3" then
    mode = 3
  end
end

-- MOUSEPRESSED
function love.mousepressed(x, y, button)
  
end