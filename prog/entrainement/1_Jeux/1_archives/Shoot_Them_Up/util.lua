local Util = {}

Util.sprites = {}

-- Crée des sprites.

function Util.Cree_Sprite(pType, pImg, pX, pY, pVie)
  local sprite = {}
  sprite.ID = pType
  sprite.img = pImg
  sprite.w = sprite.img:getWidth()
  sprite.h = sprite.img:getHeight()
  sprite.x = pX
  sprite.y = pY
  sprite.vx = 0
  sprite.vy = 0
  sprite.pv = pVie
  sprite.supprime = false
  table.insert(Util.sprites, sprite)
end

-- Contrôle si deux éléments du jeu se superposent. Sera remplacé
-- prochainement par des algo plus précis (cf videos de javidx9)

function Util.CheckCollision(entite_1, entite_2)
  return entite_1.x < entite_2.x+entite_2.w and
    entite_2.x < entite_1.x+entite_1.w and
    entite_1.y < entite_2.y+entite_2.h and
    entite_2.y < entite_1.y+entite_1.h
end

-- Directions. Elles sont présentées ici dans le sens des aiguilles d'une montre
-- à partie du haut.

function Util.Haut(pEntite, pSpeed)
  pEntite.vx = 0
  pEntite.vy = -pSpeed
end

function Util.Haut_Droite(pEntite, pSpeed)
  pEntite.vx = pSpeed
  pEntite.vy = -pSpeed
end

function Util.Droite(pEntite, pSpeed)
  pEntite.vx = pSpeed
  pEntite.vy = 0
end

function Util.Bas_Droite(pEntite, pSpeed)
  pEntite.vx = pSpeed
  pEntite.vy = pSpeed
end

function Util.Bas(pEntite, pSpeed)
  pEntite.vx = 0
  pEntite.vy = pSpeed
end

function Util.Bas_Gauche(pEntite, pSpeed)
  pEntite.vx = -pSpeed
  pEntite.vy = pSpeed
end

function Util.Gauche(pEntite, pSpeed)
  pEntite.vx = pSpeed
  pEntite.vy = 0
end

function Util.Haut_Gauche(pEntite, pSpeed)
  pEntite.vx = -pSpeed
  pEntite.vy = -pSpeed
end

function Util.Stop(pEntite)
  pEntite.vx = 0
  pEntite.vy = 0
end

-- Dessiner des formes primitives (pour l'instant ligne, rectangle, polygone et cercle).
-- A venir triangle, pentagone, hexagone.

function Util.Line(r, g, b, x1, y1, x2, y2)
  love.graphics.setColor(r, g, b)
  love.graphics.line(x1, y1, x2, y2)
  love.graphics.setColor(1, 1, 1)
end

function Util.Rect(r, g, b, pType, x, y, w, h)
  love.graphics.setColor(r, g, b)
  love.graphics.rectangle(pType, x, y, w, h)
  love.graphics.setColor(1, 1, 1)
end

function Util.Polygon(r, g, b, pType, x1, y1, x2, y2, x3, y3, ...)
  love.graphics.setColor(r, g, b)
  love.graphics.polygon(pType, x1, y1, x2, y2, x3, y3, ...)
  love.graphics.setColor(1, 1, 1)
end

function Util.Circle(r, g, b, origine_x, origine_y, rayon)
  love.graphics.setColor(r, g, b)
  love.graphics.circle(pType, origine_x, origine_y, rayon)
  love.graphics.setColor(1, 1, 1)
end

return Util