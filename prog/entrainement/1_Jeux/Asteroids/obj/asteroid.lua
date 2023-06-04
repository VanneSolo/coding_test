local asteroid = {}

function asteroid:Load()
  self.cailloux = {}
  self.origine = Vector(asteroid_img:getWidth()/2, asteroid_img:getHeight()/2)
end

function asteroid:New_Asteroid_Level()
  for i=1,Clamp(game.level, 6, 15) do
    self:New_2(game.fenetre.size.x, game.fenetre.size.y, 1, 3)
  end
end

function asteroid:Create()
  return {
    velocite = {force=Vector(0, 0), acceleration = 0},
    transform = New_Object_Transform(0, 0, 0, 0, 0, 2, 2),
    nb_points = 20
  }
end

function asteroid:New(new_astre)
  table.insert(self.cailloux, new_astre)
end

function asteroid:New_2(x, y, rotation_speed, scale)
  local size = Vector(love.math.random(500-x, 5000), love.math.random(500-y, 5000))
  
  local new_astre = {
                    velocite = {force=Vector(0, 0), acceleration = love.math.random(1, 4)},
                    transform = New_Object_Transform(size.x, size.y, 0, 0, rotation_speed, scale, scale),
                    nb_points = 20
  }
  table.insert(self.cailloux, new_astre)
end

function asteroid:Update(dt)
  for k,v in pairs(self.cailloux) do
    v.transform.rotation.x = v.transform.rotation.x + v.transform.rotation.speed * dt
	
    if v.transform.scale.x > 2 then
      vspeed = 40 + game.level * 2
    elseif v.transform.scale.x > 1 then
      vspeed = 50 + game.level * 4
    elseif v.transform.scale.x > 0 then
      vspeed = 80 + game.level * 6
    end
    
    v.velocite.force = Vector(vspeed, vspeed)
    
    if v.velocite.acceleration == 1 then
      v.transform.move.Add_To(Mul(v.velocite.force, dt))
    elseif v.velocite.acceleration == 2 then
      v.transform.move.x = v.transform.move.x - v.velocite.force.x*dt
      v.transform.move.y = v.transform.move.y + v.velocite.force.y*dt
    elseif v.velocite.acceleration == 3 then
      v.transform.move.x = v.transform.move.x + v.velocite.force.x*dt
      v.transform.move.y = v.transform.move.y - v.velocite.force.y*dt
    elseif v.velocite.acceleration == 4 then
      v.transform.move.Sub_To(Mul(v.velocite.force, dt))
    end
    
    Wrap_Around(v)
    
    if v.transform.scale.x < 1 then
      table.remove(self.cailloux, k)
    end
  end
end

function asteroid:Draw()
  for _,v in pairs(self.cailloux) do
    LG.draw(asteroid_img,
            v.transform.move.x,
            v.transform.move.y,
            v.transform.rotation.x,
            v.transform.scale.x,
            v.transform.scale.y,
            self.origine.x, self.origine.y)
  end
end

function asteroid:Debug()
  LG.print("Nb astéroides: "..tostring(#self.cailloux), 5, 5+16*4)
end

return asteroid