require "game_field"
require "game_ia"
require "game_balle"

function Load_Game()
  Load_Field()
end

function Update_Game()
  Update_AI()
  Update_Balle()
end

function Draw_Game()
  Draw_Field()
  Draw_AI()
  Draw_Balle()
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 0, 0, 9, 360)
  love.graphics.setColor(1, 1, 1)
end