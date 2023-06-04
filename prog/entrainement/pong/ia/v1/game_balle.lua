require "game_field"

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

speed = 2

balle_dim = {}
balle_dim.r = 5
balle_dim.x = middle_field_x
balle_dim.y = love.math.random(balle_dim.r, bord_bas-balle_dim.r)
balle_dim.spd_x = speed
balle_dim.spd_y = speed

function Update_Balle()
  if balle_dim.x >= bord_droit-balle_dim.r then
    balle_dim.x = bord_droit-balle_dim.r
    balle_dim.spd_x = -balle_dim.spd_x
  elseif balle_dim.x < bord_gauche-balle_dim.r then
    balle_dim.x = middle_field_x
    balle_dim.y = love.math.random(balle_dim.r, bord_bas-balle_dim.r)
    balle_dim.spd_x = speed
    balle_dim.spd_y = speed
  end
  if balle_dim.y >= bord_bas-balle_dim.r then
    balle_dim.y = bord_bas-balle_dim.r
    balle_dim.spd_y = -balle_dim.spd_y
  elseif balle_dim.y < bord_haut+balle_dim.r then
    balle_dim.y = bord_haut+balle_dim.r
    balle_dim.spd_y = -balle_dim.spd_y
  end
  
  if balle_dim.x <= ia_dim.x+ia_dim.w + balle_dim.r and balle_dim.y > ia_dim.y and balle_dim.y < ia_dim.y+ia_dim.h then
    balle_dim.spd_x = -balle_dim.spd_x
  end
  
  balle_dim.x = balle_dim.x + balle_dim.spd_x
  balle_dim.y = balle_dim.y + balle_dim.spd_y
end

function Draw_Balle()
  love.graphics.setColor(1, 0, 0)
  love.graphics.circle("fill", balle_dim.x, balle_dim.y, balle_dim.r)
  love.graphics.setColor(1, 1, 1)
end