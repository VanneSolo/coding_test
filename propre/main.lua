io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

--[[

  Exercice 1.
  Recreate the radial trigger. Détecter si un point est à l'intérieur ou non d'un cercle.
  
  Exercice 2.
  Look at trigger. Détecter si le sprite du joueur "regarde" dans la direction d'une cible.
  threshold (-> définition) de 0 à 1.
  1 -> très strict, nécessite de regarder exactement dans la direction de la cible.
  0 -> perpendiculaire ou presque à l'axe sprite/cible
  
  Exercice 3.
  Construire une fonction transform qui permet de passer des coordonnées globales à locales
  et vice versa.

]]

-- distance * time / duration + valeur départ
-- t = temps, c'est en incrémentant cette variable qu'on anime le tweening.
-- b = valeur de départ
-- c = distance à parcourir
-- d = durée du mouvement

require "vector"
require "math_sup"
require "tween"

function InitTween(t, b, c, d)
  tweening = {}
  tweening.time = t
  tweening.valeur_début = b
  tweening.distance = c
  tweening.duration = d
end

-- LOAD
function love.load()
  love.graphics.setPointSize(5)
  pt = Vector(100, 100)
  InitTween(0, pt.x, 150, 2)
end

-- UPDATE
function love.update(dt)
  if tweening.time < tweening.duration then
    tweening.time = tweening.time + dt
  end
  pt.x = Linear(tweening.time, tweening.valeur_début, tweening.distance, tweening.duration)
end

-- DRAW
function love.draw()
  love.graphics.points(pt.x, pt.y)
end

-- TEXTINPUT
function love.textinput(t)
  
end

-- KEYPRESSED
function love.keypressed(key)
  
end

-- MOUSEPRESSED
function love.mousepressed(x, y, button)
  
end