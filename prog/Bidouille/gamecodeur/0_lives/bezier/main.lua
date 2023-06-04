io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  courbe = love.math.newBezierCurve({1, hauteur/2, largeur/2, 1, largeur, hauteur/2})
  --love.graphics.setPointSize(3)
  progression = 0
  liste_particules = {}
  r = love.math.random()
  g = love.math.random()
  b = love.math.random()
  
  Genere_Courbe()
end

function love.update(dt)
  local x,y = courbe:evaluate(progression)
  for i=1,5 do
    Ajoute_Particules(x, y)
  end
  progression = progression + 0.01
  if progression > 1 then
    progression = 0
    Genere_Courbe()
  end
  for i=#liste_particules,1,-1 do
    p = liste_particules[i]
    p.vie = p.vie - dt
    p.x = p.x + p.vx*dt
    p.y = p.y + p.vy*dt
    if p.vie <= 0 then
      table.remove(liste_particules, i)
    end
  end
end

function love.draw()
  local x,y = courbe:evaluate(progression)
  --love.graphics.circle("fill", x, y, 3)
  
  love.graphics.setColor(r, g, b)
  for i=1,#liste_particules do
    local p = liste_particules[i]
    love.graphics.circle("fill", p.x, p.y, 2)
  end
  love.graphics.setColor(1, 1, 1)
  
  --[[
  
  love.graphics.line(courbe:render())
  love.graphics.setColor(1, 0, 0)
  for i=0,1,0.01 do
    local x,y = courbe:evaluate(i)
    love.graphics.points(x, y)
  end
  love.graphics.setColor(1, 1, 1)
  
  ]]
end

function love.keypressed(key)
  
end

function love.mousepressed(x, y, button)
  
end

function Genere_Courbe()
  local x = love.math.random(-400, largeur+400)
  local y = love.math.random(0, hauteur)
  courbe = love.math.newBezierCurve(largeur/2, hauteur, x, y, largeur/2, 1)
end

function Ajoute_Particules(pX, pY)
  local p = {}
  p.x = love.math.random(pX-5, pX+5)
  p.y = love.math.random(pY-5, pY+5)
  p.vx = love.math.random(-50, 50)
  p.vy = love.math.random(-50, 50)
  p.vie = love.math.random(0.05, 0.3)
  table.insert(liste_particules, p)
end