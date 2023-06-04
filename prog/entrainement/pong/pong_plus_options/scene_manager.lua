if current_scene == "MENU" then
  in_menu = true
  in_game = false
  in_options = false
  victoire = false
  defaite = false
elseif current_scene == "OPTIONS" then
  in_menu = false
  in_game = false
  in_options = true
  victoire = false
  defaite = false
elseif current_scene == "JEU" then
  in_menu = false
  in_game = true
  in_options = false
  victoire = false
  defaite = false
elseif current_scene == "VICTOIRE" then
  in_menu = false
  in_game = false
  in_options = false
  victoire = true
  defaite = false
elseif current_scene == "DEFAITE" then
  in_menu = false
  in_game = false
  in_options = false
  victoire = false
  defaite = true
end

function Update_Manager()
  if in_menu then
    current_scene = "MENU"
  elseif in_game then
    current_scene = "JEU"
    Game_Update(dt)
  elseif in_options then
    current_scene = "OPTIONS"
  elseif victoire then
    current_scene = "VICTOIRE"
  elseif defaite then
    current_scene = "DEFAITE"
  end
end

function Keyboard_Manager(key)
  if current_scene == "MENU" then
    in_menu = true
    in_game = false
    in_options = false
    victoire = false
    defaite = false
    if key == "n" then
      in_menu = false
      in_game = true
      in_options = false
      victoire = false
      defaite = false
      current_scene = "JEU"
      Game_Load()
    elseif key == "o" then
      in_menu = false
      in_game = false
      in_options = true
      victoire = false
      defaite = false
      current_scene = "OPTIONS"
    elseif key == "q" then
      love.event.quit()
    end
  elseif current_scene == "OPTIONS" then
    if key == "q" then
      in_menu = true
      in_game = false
      in_options = false
      victoire = false
      defaite = false
      current_scene = "MENU"
    end 
  elseif current_scene == "VICTOIRE" then
    if key == "m" then
      in_menu = true
      in_game = false
      in_options = false
      victoire = false
      defaite = false
      current_scene = "MENU"
    elseif key == "n" then
      in_menu = false
      in_game = true
      in_options = false
      victoire = false
      defaite = false
      current_scene = "JEU"
      Game_Load()
    end
  elseif current_scene == "DEFAITE" then
    if key == "m" then
      in_menu = true
      in_game = false
      in_options = false
      victoire = false
      defaite = false
      current_scene = "MENU"
    elseif key == "n" then
      in_menu = false
      in_game = true
      in_options = false
      victoire = false
      defaite = false
      current_scene = "JEU"
      Game_Load()
    end
  end
end

function Mouse_Manager(x, y, button)
  if current_scene == "MENU" then
    if button == 1 and on_game_button then
      in_menu = false
      in_game = true
      in_options = false
      victoire = false
      defaite = false
      current_scene = "JEU"
      Game_Load()
    elseif button == 1 and on_options_button then
      in_menu = false
      in_game = false
      in_options = true
      victoire = false
      defaite = false
      current_scene = "OPTIONS"
    elseif button == 1 and on_quit_button then
      love.event.quit()
    end
  elseif current_scene == "OPTIONS" then
    if button == 1 and quit_option_button.cursor_on then
      in_menu = true
      in_game = false
      in_options = false
      victoire = false
      defaite = false
      current_scene = "MENU"
    end
  elseif current_scene == "VICTOIRE" then
    if button == 1 and on_n_v_button then
      in_menu = false
      in_game = true
      in_options = false
      victoire = false
      defaite = false
      current_scene = "JEU"
      Game_Load()
    elseif button == 1 and on_m_v_button then
      in_menu = true
      in_game = false
      in_options = false
      victoire = false
      defaite = false
      current_scene = "MENU"
    end
  elseif current_scene == "DEFAITE" then
    if button == 1 and on_n_d_button then
      in_menu = false
      in_game = true
      in_options = false
      victoire = false
      defaite = false
      current_scene = "JEU"
      Game_Load()
    elseif button == 1 and on_m_d_button then
      in_menu = true
      in_game = false
      in_options = false
      victoire = false
      defaite = false
      current_scene = "MENU"
    end
  end
end