return function(p_x, p_y, p_w, p_h, p_id)
  local mur = {}
  mur.id = p_id
  mur.body = love.physics.newBody(world, p_x, p_y, "static")
  mur.shape = love.physics.newRectangleShape(p_w, p_h)
  mur.fixture = love.physics.newFixture(mur.body, mur.shape)
  mur.fixture:setUserData(mur)
  
  mur.end_contact = function(self)
    if p_id == "mur_bas" then
      --state.game_over = true
    end
  end
  return mur
end