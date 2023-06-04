io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

liste_points = {}

function Genere()
  liste_points = {}
  local p1 = {x=0, y=love.math.random(250, 350)}
  local p2 = {x=largeur, y=love.math.random(200, p1.y)}
  table.insert(liste_points, p1)
  table.insert(liste_points, p2)
  
  local iteration = 5
  disp = (p1.y + p2.y)/2
  for i=1,iteration do
    local copie = {}
    for k,v in pairs(liste_points) do
      table.insert(copie, v)
    end
    for i=1,#copie-1 do
      local p1 = copie[i]
      local p2 = copie[i+1]
      local m = (p1.y+p2.y)/2
      local p3 = { x = p1.x+(p2.x-p1.x)/2, y = love.math.random(m-disp, m+disp) }
      table.insert(liste_points, 2*i, p3)
    end
    disp = disp*2^(-0.9)
  end
end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  love.graphics.setPointSize(3)
  
  Genere()
end

function love.update(dt)
  
end

function love.draw()
  local liste = {}
  for k,v in pairs(liste_points) do
    table.insert(liste, v.x)
    table.insert(liste, v.y)
  end
  love.graphics.line(liste)
end

function love.keypressed(key)
  if key == "space" then
    Genere()
  end
end