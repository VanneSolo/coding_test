local function Require_Level(p_sequence)
  local file_name = "levels/"..p_sequence[state.current_level]
  local level = require(file_name)
  return level
end

local function Level(brick, cur_level, p_table, p_sequence)
  local brick_h = 20
  local level = {}
  level.current_level = Require_Level(cur_level)
  for i=1,#p_sequence[level.current_level] do
    for j=1,#p_sequence[level.current_level][i] do
      local brick_w = largeur / #p_sequence[level.current_level][i]
      if p_sequence[level.current_level][i][j] == 1 then
        local brick_x = (j-1)*(brick_w)
        local brick_y = (i-1)*brick_h
        table.insert(p_table, brick(brick_x, brick_y, brick_w, brick_h, "brick"))
      end
    end
  end
  return level
end

return function(self, dt)
  local levels = {}
  levels.briques = {}
  ----
  levels.sequence = require("levels/sequence")
  levels.create_level_one = Level(brick, 1, levels.briques)
  ----
  levels.switch = function(self)
    if state.stage_cleared then
      if state.current_level < #sequence then
        state.current_level = state.current_level + 1
        Level(brick, state.current_level, levels.briques)
        state.stage_cleared = false
      end
    end
  end
  ----
  levels.update = function(self, dt)
    local brick_index = 1
    while brick_index <= #self.one do
      local entite = self.one[brick_index]
      if entite.health < 1 then
        table.remove(self.one, brick_index)
        entite.fixture:destroy()
        self:switch()
      else
        brick_index = brick_index + 1
      end
    end
    
    if #self.one < 1 then
      state.stage_cleared = true
    end
  end
  ----
  levels.draw = function(self)
    for i=#self.one,1,-1 do
      self.one[i]:draw()
    end
  end
  ----
  return levels
end