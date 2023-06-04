local asset = require("asset")
local bordure = asset.tuile_1
local sol = asset.tuile_2
  
local map = {}
-- Variable qui sera modifiée pour permettre le scrolling de la map.
map.background_y = 0
-- Paramètres de la map
map.lignes = 12
map.colonnes = 16
map.tuile_width = 50
-- "Dessin" de la map
map.grid = {
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,2,2,2,2,0,0,0,0},
    {0,0,0,0,0,0,0,0,2,2,2,2,0,0,0,0},
    {0,0,0,0,0,0,0,0,2,2,2,2,0,0,0,0},
    {0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,2,2,2,2,0,0,0,0,0,0,0,0,0,0},
    {0,0,2,2,2,2,0,0,0,0,0,0,0,0,0,0},
    {0,0,2,2,2,2,0,0,0,0,0,0,0,0,0,0},
    {0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0}
}

function map.Update(dt)
  -- On incrémente la variable qui sert au scrolling de la map. Quand elle atteint
  -- une valeur égale à la hauteur de la map (nombre de lignes * largeur d'une 
  -- tuile - les tuiles sont carrées, pas besoin de deux variables poue la longueur
  -- et la hauteur), on la remt à zéro.
  map.background_y = map.background_y + 120 * dt
  if map.background_y >= (map.lignes*map.tuile_width) then
    map.background_y = 0
  end
end

function map.Draw()
  -- On dessine la map. A la coordonnée y on ajoute la valeur de background, qui est maj en
  -- continu dans l'update. Si background est supérieur à 0, donc si du noir apparait en haut
  -- de l'écran, on dessine un deuxième fond.
  for l=1,map.lignes do
    for c=1,map.colonnes do
      local ID = map.grid[l][c]
      if ID == 1 then
        love.graphics.draw(bordure, (c-1)*map.tuile_width, ((l-1)*map.tuile_width)+map.background_y)
      elseif ID == 2 then
        love.graphics.draw(sol, (c-1)*map.tuile_width, ((l-1)*map.tuile_width)+map.background_y)
      elseif ID == 0 then
        --love.graphics.rectangle("line", (c-1)*map.tuile_width, ((l-1)*map.tuile_width)+map.background_y, map.tuile_width, map.tuile_width)
      end
    end
  end
  if map.background_y > 0 then
    for l=1,map.lignes do
      for c=1,map.colonnes do
        local ID = map.grid[l][c]
        if ID == 1 then
          love.graphics.draw(bordure, (c-1)*map.tuile_width, ((l-1)*map.tuile_width)+map.background_y-(map.lignes*map.tuile_width))
        elseif ID == 2 then
          love.graphics.draw(sol, (c-1)*map.tuile_width, ((l-1)*map.tuile_width)+map.background_y-(map.lignes*map.tuile_width))
        elseif ID == 0 then
          love.graphics.setColor(1, 1, 0)
          --love.graphics.rectangle("line", (c-1)*map.tuile_width, ((l-1)*map.tuile_width)+map.background_y-(map.lignes*map.tuile_width), map.tuile_width, map.tuile_width)
          love.graphics.setColor(1, 1, 1)
        end
      end
    end
  end
  love.graphics.setColor(0.47, 0.56, 0.77)
  love.graphics.rectangle("fill", 0, map.lignes*map.tuile_width, largeur, hauteur-(map.lignes*map.tuile_width))
  love.graphics.setColor(1, 1, 1)
end

return map