io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  boutton_1 = {}
  boutton_1.x = 10
  boutton_1.y = 10
  boutton_1.w = 80
  boutton_1.h = 40
  
  boutton_2 = {}
  boutton_2.x = 10
  boutton_2.y = 60
  boutton_2.w = 80
  boutton_2.h = 40
end

function love.update(dt)
  
end

function love.draw()
  love.graphics.rectangle("line", boutton_1.x, boutton_1.y, boutton_1.w, boutton_1.h)
  love.graphics.rectangle("line", boutton_2.x, boutton_2.y, boutton_2.w, boutton_2.h)
end

function love.mousepressed(x, y, button)
  print("clic", x, y)
  if x > boutton_1.x and x < boutton_1.x+boutton_1.w and y > boutton_1.y and y < boutton_1.y+boutton_1.h then
    print("Boutton 1 clique")
  end
  if x > boutton_2.x and x < boutton_2.x+boutton_2.w and y > boutton_2.y and y < boutton_2.y+boutton_2.h then
    print("Boutton 2 clique")
  end
end