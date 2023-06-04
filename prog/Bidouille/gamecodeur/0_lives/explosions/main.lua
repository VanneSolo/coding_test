io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  liste_particule = {}
  
  --Ajoute_Explosion(400, 300)
  --Ajoute_Explosion(100, 100)
end

function love.update(dt)
  for i=#liste_particule, 1, -1 do
    local particule = liste_particule[i]
    particule.x = particule.x + particule.vx
    particule.y = particule.y + particule.vy
    particule.vie = particule.vie - dt
    if particule.vie <= 0 then
      table.remove(liste_particule, i)
    end
  end
end

function love.draw()
  for i=1,#liste_particule do
    local particule = liste_particule[i]
    if particule.vie >= 0.1 then
      love.graphics.setColor(1, 1, 1)
    else
      love.graphics.setColor(1, 0, 0)
    end
    love.graphics.rectangle("fill", particule.x, particule.y, 5, 5)
  end
end

function Ajoute_Particule(pX, pY)
  particule = {}
  particule.x = pX
  particule.y = pY
  particule.vx = love.math.random(-300, 300)/100
  particule.vy = love.math.random(-300, 300)/100
  particule.vie = love.math.random(50, 300)/100
  table.insert(liste_particule, particule)
end

function Ajoute_Explosion(pX, pY)
  for i=1,50 do
    Ajoute_Particule(pX, pY)
  end
end

function love.mousepressed(x, y, button)
  if button == 1 then
    Ajoute_Explosion(x, y)
  end
end