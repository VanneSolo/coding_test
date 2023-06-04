require "menu"
require "options"
require "game"
require "pause"
require "victoire"
require "defaite"

function Init_Scene_Manager()
  scenes = {}
  scenes.menu = true
  scenes.options = false
  scenes.game = false
  scenes.pause = false
  scenes.victoire = false
  scenes.defaite = false
  
  current_scene = "MENU"
end

function Update_Scene_Manager(dt)
  if current_scene == "MENU" then
    scenes.menu = true
    scenes.options = false
    scenes.game = false
    scenes.pause = false
    scenes.victoire = false
    scenes.defaite = false
    Update_Menu()
  elseif current_scene == "OPTIONS" then
    scenes.menu = false
    scenes.options = true
    scenes.game = false
    scenes.pause = false
    scenes.victoire = false
    scenes.defaite = false
    Update_Options()
  elseif current_scene == "GAME" then
    scenes.menu = false
    scenes.options = false
    scenes.game = true
    scenes.pause = false
    scenes.victoire = false
    scenes.defaite = false
    Update_Game(dt)
  elseif current_scene == "PAUSE" then
    scenes.menu = false
    scenes.options = false
    scenes.game = false
    scenes.pause = true
    scenes.victoire = false
    scenes.defaite = false
  elseif current_scene == "VICTOIRE" then
    scenes.menu = false
    scenes.options = false
    scenes.game = false
    scenes.pause = false
    scenes.victoire = true
    scenes.defaite = false
  elseif current_scene == "DEFAITE" then
    scenes.menu = false
    scenes.options = false
    scenes.game = false
    scenes.pause = false
    scenes.victoire = false
    scenes.defaite = true
  end
end

function Draw_Scene_Manager()
  if current_scene == "MENU" then
    Draw_Menu()
  elseif current_scene == "OPTIONS" then
    Draw_Options()
  elseif current_scene == "GAME" then
    Draw_Game()
  elseif current_scene == "PAUSE" then
    
  elseif current_scene == "VICTOIRE" then
    
  elseif current_scene == "DEFAITE" then
    
  end
end

function Mouse_Scene_Manager(x, y, button)
  if button == 1 then
    if current_scene == "MENU" then
      if menu_to_options_button.cursor_on then
        current_scene = "OPTIONS"
      elseif menu_to_game_button.cursor_on then
        current_scene = "GAME"
      elseif menu_to_quit_button.cursor_on then
        love.event.quit()
      end
    elseif current_scene == "OPTIONS" then
      
    elseif current_scene == "GAME" then
      
    elseif current_scene == "PAUSE" then
      
    elseif current_scene == "VICTOIRE" then
      
    elseif current_scene == "DEFAITE" then
      
    end
  end
end

function Keyboard_Scene_Manager(key)
  if current_scene == "MENU" then
    if key == "o" then
      current_scene = "OPTIONS"
    elseif key == "space" then
      current_scene = "GAME"
    elseif key == "escape" then
      love.event.quit()
    end
  elseif current_scene == "OPTIONS" then
    if key == "escape" then
      current_scene = "MENU"
    end
  elseif current_scene == "GAME" then
    if key == "escape" then
      current_scene = "PAUSE"
    end
  elseif current_scene == "PAUSE" then
    if key == "o" then
      current_scene = "OPTIONS"
    elseif key == "q" then
      current_scene = "MENU"
    elseif key == "escape" then
      current_scene = "GAME"
    end
  elseif current_scene == "VICTOIRE" then
    if key == "space" then
      current_scene = "GAME"
    elseif key == "escape" then
      current_scene = "MENU"
    end
  elseif current_scene == "DEFAITE" then
    if key == "space" then
      current_scene = "GAME"
    elseif key == "escape" then
      current_scene = "MENU"
    end
  end
end