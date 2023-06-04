io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  liste = {}
  for i=1,10 do
    liste[i] = {}
    liste[i].valeur = i
    liste[i].couleur = "noire"
  end
  for i=11,20 do
    liste[i] = {}
    liste[i].valeur = i
    liste[i].couleur = "rouge"
  end
  
  --Melange(liste)
  
  tirage = love.math.random(1, #liste)
end

function love.update(dt)
  
end

function love.draw()
  love.graphics.setBackgroundColor(0.5, 0.5, 0.5)
  x = 10
  for i=1,#liste do
    if liste[i].couleur == "noire" then
      love.graphics.setColor(0, 0, 0)
    elseif liste[i].couleur == "rouge" then
      love.graphics.setColor(1, 0, 0)
    end
    love.graphics.print(liste[i].valeur, x, 10)
    x = x + 25
  end
  
  love.graphics.setColor(1, 1, 1)
  love.graphics.print(tirage, 10, 25)
end

function love.keypressed(key)
  if key == "space" then
    Melange(liste)
  end
end

function Melange(pListe)
  for m=1,500 do
    local c1 = love.math.random(1, #pListe)
    local c2 = love.math.random(1, #pListe)
    local temp = pListe[c1]
    pListe[c1] = pListe[c2]
    pListe[c2] = temp
  end
end