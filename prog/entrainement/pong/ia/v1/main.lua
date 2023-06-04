io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

require "game"

function love.load()
  Load_Game()
end

function love.update(dt)
  Update_Game()
end

function love.draw()
  Draw_Game()
end