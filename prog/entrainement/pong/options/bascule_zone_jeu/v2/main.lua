io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  require "game_zone"
  require "orientation"
  
  Field_Init()
end

function love.update(dt)
  
end

function love.draw()
  Field_Draw()
  Button_Draw()
end

function love.keypressed(key)
  
end

function love.mousepressed(x, y, button)
  Button_Clic(x, y, button)
end