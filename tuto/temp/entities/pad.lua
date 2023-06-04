return function(p_x, p_y, p_id)
  local window_w = love.window.getMode()
  local pad_w = 120
  local pad_h = 20
  local pad_speed = 600
  local mur_g = (pad_w/2) + 2
  local mur_d = window_w-(pad_w/2) - 2
  
  local pad = {}
  pad.id = p_id
  pad.body = love.physics.newBody(world, p_x, p_y, "kinematic")
  pad.shape = love.physics.newRectangleShape(pad_w, pad_h)
  pad.fixture = love.physics.newFixture(pad.body, pad.shape)
  pad.fixture:setUserData(pad)
  
  pad.update = function(self, dt)
    if state.button_left and state.button_right then 
      self.body:setLinearVelocity(0, 0)
      return
    end
    
    local self_x = self.body:getX()
    if state.button_left and self_x > mur_g then
      self.body:setLinearVelocity(-pad_speed, 0)
    elseif state.button_right and self_x < mur_d then
      self.body:setLinearVelocity(pad_speed, 0)
    else
      self.body:setLinearVelocity(0, 0)
    end
  end
  
  pad.draw = function(self)
    love.graphics.polygon("line", self.body:getWorldPoints(self.shape:getPoints()))
  end

  return pad
end