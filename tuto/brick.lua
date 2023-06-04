--[[ 

  => Reset les bricks quand on change de niveau.
  => Types de bricks: simple, résistante, égratignée, craquée, indestructible.
  => changements d'état: (simple ou résistante)->égratignée->craquée.
  
]]

return function(p_x, p_y, p_w, p_h, p_id)
  local brick = {}
  brick.id = p_id
  brick.body = love.physics.newBody(world, p_x+p_w/2, p_y+p_h/2, "static")
  brick.shape = love.physics.newRectangleShape(p_w, p_h)
  brick.fixture = love.physics.newFixture(brick.body, brick.shape)
  brick.fixture:setUserData(brick)
  brick.health = 2
  
  brick.end_contact = function(self)
    self.health = self.health - 1
  end
  
  brick.draw = function(self)
    if brick.health == 2 then
      love.graphics.setColor(state.colors["yellow"])
    elseif brick.health == 1 then
      love.graphics.setColor(state.colors["blue"])
    end
    love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
    love.graphics.setColor(state.colors["white"])
  end
  return brick
end