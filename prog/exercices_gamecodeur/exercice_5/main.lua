io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

function CheckCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end

function Create_Rectangle(pNombre)
  compteur = 0
  
  while compteur ~= pNombre do
    valide = false
    nb_essai = 0
    essai_max = 500
    while valide == false do
      nb_essai = nb_essai+1
      if nb_essai > essai_max then
        print("Nombre maximum d'essais atteint!")
        break
      end
    
      rect = {}
      rect.x = love.math.random(0, largeur)
      rect.y = love.math.random(0, hauteur)
      rect.width = love.math.random(10, 100)
      rect.height = love.math.random(10, 100)
      rect.red = love.math.random()
      rect.green = love.math.random()
      rect.blue = love.math.random()
      
      valide = true
      
      if ((rect.x + rect.width) >= largeur) or ((rect.y + rect.height) >= hauteur) then
        valide = false
      end
      for k,v in pairs(liste_rectangle) do
        if CheckCollision(rect.x, rect.y, rect.width, rect.height, v.x, v.y, v.width, v.height) then
          valide = false
        end
      end
      if valide then
        table.insert(liste_rectangle, rect)
        compteur = compteur + 1
      end
    end
  end
  
end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  red = love.math.random(0.1, 1)
  green = love.math.random(0.1, 1)
  blue = love.math.random(0.1, 1)
  
  nombre_rectangle = 100
  liste_rectangle = {}
  
  Create_Rectangle(nombre_rectangle)
end

function love.update(dt)
  curseur_x, curseur_y = love.mouse:getPosition()
  
  for k, v in pairs(liste_rectangle) do
    if curseur_x>v.x and curseur_x<v.x+v.width and curseur_y>v.y and curseur_y<v.y+v.height then
      --print("Vous avez survolé le rectangle: "..tostring(k))
    end
  end
end

function love.draw()
  
  for k,v in pairs(liste_rectangle) do
    love.graphics.setColor(v.red, v.green, v.blue)
    love.graphics.rectangle("fill", v.x, v.y, v.width, v.height)
  end
end

function love.mousepressed(x, y, button)
  if button == 1 then
    for k, v in pairs(liste_rectangle) do
      if x>=v.x and x<=v.x+v.width and y>=v.y and y<=v.y+v.height then
        print("Vous avez cliqué sur le rectangle: "..tostring(k))
      end
    end
  end
end