io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

require "scene_manager"

function love.load()
  Init_Scene_Manager()
end

function love.update(dt)
  Update_Scene_Manager(dt)
end

function love.draw()
  Draw_Scene_Manager()
end

function love.mousepressed(x, y, button)
  Mouse_Scene_Manager(x, y, button)
end

function love.keypressed(key)
  Keyboard_Scene_Manager(key)
end