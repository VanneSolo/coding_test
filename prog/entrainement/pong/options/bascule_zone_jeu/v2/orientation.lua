horizontal = true
vertical = false

function Button_Clic(x, y, button)
  if x > 450 and x < 550 and y > 10 and y < 110 and button==1 then
    horizontal = not horizontal
    vertical = not vertical
  end
end

function Button_Draw()
  love.graphics.rectangle("fill", 450, 10, 100, 100)
  love.graphics.rectangle("fill", 560, 10, 100, 100)
  love.graphics.rectangle("fill", 670, 10, 100, 100)
  
  if horizontal then
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle("fill", 560, 10, 100, 100)
  elseif vertical then
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle("fill", 670, 10, 100, 100)
  end
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Hor", 600, 50)
  love.graphics.print("Ver", 710, 50)
  love.graphics.setColor(1, 1, 1)
end