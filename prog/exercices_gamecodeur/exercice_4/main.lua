io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  buildings = 12
  nombre_etage = {}
  hauteur_etage = 10
  
  for i=1, buildings do
    hauteur_building = love.math.random(1, 11)
    table.insert(nombre_etage, hauteur_building)
  end
  monter = hauteur + (#nombre_etage*hauteur_etage)
  descendre = -(#nombre_etage*hauteur_etage)
end

function love.update(dt)
  
  monter = monter - 2
  if monter <= hauteur-50 then
    monter = hauteur-50
  end
  
  descendre = descendre + 2
  if descendre >= 50 then
    descendre = 50
  end
  
end

function love.draw()
  
  for i=1, buildings do
      espace = largeur/buildings
      love.graphics.rectangle("line", ((i-1)*espace)+(espace/2), monter, 20, -nombre_etage[i]*hauteur_etage)
      love.graphics.rectangle("line", ((i-1)*espace)+(espace/2), descendre, 20, nombre_etage[i]*hauteur_etage)
      
      love.graphics.print(nombre_etage[i], ((i-1)*espace)+(espace/2), (monter-20-(nombre_etage[i]*hauteur_etage)))
      love.graphics.print(nombre_etage[i], ((i-1)*espace)+(espace/2), (descendre+20+(nombre_etage[i]*hauteur_etage)))
  end
  
  love.graphics.line(0, hauteur-49, largeur, hauteur-49)
  love.graphics.line(0, 49, largeur, 49)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 0, hauteur-48, largeur, hauteur-48)
  love.graphics.rectangle("fill", 0, 0, largeur, 48)
  love.graphics.setColor(1, 1, 1)
  
end