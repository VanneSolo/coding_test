return function()
  local window_w, window_h = love.window.getMode()
  
  local text = {}
  text.draw = function(self)
    if state.stage_cleared then
      love.graphics.print({state.colors["red"], "Stage Cleared"}, math.floor(window_w/2)-110, math.floor(window_h/2), 0, 2, 2)
    end
  end
  return text
end