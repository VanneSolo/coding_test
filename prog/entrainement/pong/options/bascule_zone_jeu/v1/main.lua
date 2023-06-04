io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  love.graphics.setPointSize(3)
  
  field_w = 350
  field_h = 200
  field_x = 225
  field_y = 150
  field_ox = field_w/2
  field_oy = field_h/2
  
  terrain = love.graphics.newCanvas(field_w, field_h)
  love.graphics.setCanvas(terrain)
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", 0, 0, 350, 200)
  love.graphics.setColor(1, 0, 0)
  love.graphics.rectangle("fill", 10, 75, 10, 50)
  love.graphics.setColor(0, 0, 1)
  love.graphics.rectangle("fill", 330, 75, 10, 50)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
  
  rotation = 0
  
  horizontal = true
  vertical = false
end

function love.update(dt)
  
end

function love.draw()
  if horizontal then
    love.graphics.draw(terrain, field_x, field_y, rotation, 1, 1, field_ox, field_oy)
  elseif vertical then
    love.graphics.draw(terrain, field_x-75, field_y+75, rotation+math.rad(90), 1, 1, field_ox, field_oy)
  end
  
  love.graphics.print("horizontal: "..tostring(horizontal), 5, 5)
  love.graphics.print("vertical: "..tostring(vertical), 5, 5+16)
end

function love.keypressed(key)
  if key == "space" then
    if horizontal then
      horizontal = false
      vertical = true
    elseif vertical then
      horizontal = true
      vertical = false
    end
  end
end