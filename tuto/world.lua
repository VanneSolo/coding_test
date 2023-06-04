local begin_contact = function(fixture_a, fixture_b, contact)
  
end

local end_contact = function(fixture_a, fixture_b, contact)
  local obj_a = fixture_a:getUserData()
  local obj_b = fixture_b:getUserData()
  if obj_a.end_contact then obj_a:end_contact() end
  if obj_b.end_contact then obj_b:end_contact() end
end

local pre_solve = function(fixture_a, fixture_b, contact)
  
end

local post_solve = function(fixture_a, fixture_b, contact)
  
end

local world = love.physics.newWorld(0, 0)

world:setCallbacks(begin_contact, end_contact, pre_solve, post_solve)

return world