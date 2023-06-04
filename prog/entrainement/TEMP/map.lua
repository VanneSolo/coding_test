local asset = require("asset")
local bordure = asset.tuile_1
local sol = asset.tuile_2
  
local map = {}
map.background_y = 0
map.lignes = 12
map.colonnes = 16
map.tuile_width = 50
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
  map.background_y = map.background_y + 120 * dt
  if map.background_y >= (map.lignes*map.tuile_width) then
    map.background_y = 0--(map.lignes*map.tuile_width)
  end
end

function map.Draw()
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