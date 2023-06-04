require "orientation"

function Field_Init()
  terrain = love.graphics.newCanvas(250, 150)
  love.graphics.setCanvas(terrain)
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", 0, 0, 250, 150)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

function Field_Draw()
  if horizontal then
    love.graphics.draw(terrain, 10, 10, 0)
  elseif vertical then
    love.graphics.draw(terrain, 160, 10, math.rad(90))
  end
end