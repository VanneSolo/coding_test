io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

require "init"

function love.load()
  Game_Load()
end

function love.update(dt)
  Update_Manager()
  if current_scene == "MENU" then
    On_Menu_Button()
  elseif current_scene == "OPTIONS" then
    Options_Button()
  elseif current_scene == "VICTOIRE" then
    On_Local_Button_V()
  elseif current_scene == "DEFAITE" then
    On_Local_Button_D()
  end
end

function love.draw()
  if current_scene == "MENU" then
    Draw_Menu()
  elseif current_scene == "OPTIONS" then
    Draw_Options()
  elseif current_scene == "JEU" then
    Game_Draw()
  elseif current_scene == "VICTOIRE" then
    Draw_Victoire()
  elseif current_scene == "DEFAITE" then
    Draw_Defaite()
  end
  
end

function love.keypressed(key)
  Keyboard_Manager(key)
end

function love.mousepressed(x, y, button)
  Mouse_Manager(x, y, button)
end