local press_functions = {
  left = function()
    state.button_left = true
  end,
  right = function()
    state.button_right = true
  end,
  escape = function()
    if state.current_scene == "menu" then
      love.event.quit()
    elseif state.current_scene == "game" then
      state.current_scene = "pause"
    elseif state.current_scene == "pause" then
      state.current_scene = "game"
    end
  end,
  space = function()
    if state.game_over or state.stage_cleared then
      return
    end
    state.paused = not state.paused
  end,
  backspace = function()
    if state.current_scene == "menu" then
      state.current_scene = "game"
    end
  end
}

local release_functions = {
  left = function()
    state.button_left = false
  end,
  right = function()
    state.button_right = false
  end
}

return {
  press = function(key)
    if press_functions[key] then
      press_functions[key]()
    end
  end,
  release = function(key)
    if release_functions[key] then
      release_functions[key]()
    end
  end,
  set_focus = function(focus)
    if not focus then
      state.paused = true
    end
  end
}