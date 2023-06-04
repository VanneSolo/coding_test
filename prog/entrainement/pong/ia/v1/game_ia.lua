require "game_field"
require "game_balle"

ia_dim = {}
ia_dim.w = 10
ia_dim.h = 50
ia_dim.x = field_dim.pos_x
ia_dim.y = field_dim.pos_y
ia_dim.s = 2

function Update_AI()
  ia_dim.y = ia_dim.y + ia_dim.s
  if ia_dim.y >= bord_bas - ia_dim.h or ia_dim.y < bord_haut then
    ia_dim.s = -ia_dim.s
  end
end

function Draw_AI()
  love.graphics.rectangle("fill", ia_dim.x, ia_dim.y, ia_dim.w, ia_dim.h)
end