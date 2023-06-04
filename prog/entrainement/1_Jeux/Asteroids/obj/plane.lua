local ship = {
  velocite = {},
  transform = {},
  
  reload_time = 0.25,
  ready = 0
}

function ship:Load()
  self.velocite = {force=Vector(0, 0), acceleration=350}
  self.transform = New_Object_Transform(game.fenetre.size.x/2, game.fenetre.size.y/2, 0, 0, 4.5, 2, 2)
  self.origine = Vector(plane_img:getWidth()/2, plane_img:getHeight()/2)
  self.reacteur = false
  self.toggle = true
  self.timer = 0
  self.timer_max = 0
  self.collider = false
  self.boost_timer = 0
end

function ship:Center_Screen()
  self.transform.move = Div(game.fenetre.size, 2)
end

function ship:Clignote(dt)
  self.timer = self.timer+dt
  
  if self.timer > 0.3 and self.collider then
    self.timer = 0
    self.toggle = not self.toggle
    
    self.timer_max = self.timer_max + 1
    if self.timer_max > 10 then
      self.collider = false
      self.toggle = true
      self.timer_max = 0
    end
  end
end

function ship:Shoot(dt)
  if self.ready > 0 then
    self.ready = self.ready - dt
  end
  
  if self.ready <= 0 then
    table.insert(bullet_object.weapon.bullets, bullet_object.Create())
    local nb_bullet = #bullet_object.weapon.bullets
    local new_bullet = bullet_object.weapon.bullets[nb_bullet]
    
    new_bullet.ID = "bullet_plane"
    local off_rotation = plane_img:getWidth()/2
    self.ready = self.reload_time
    
    new_bullet.transform.move.x = plane_object.transform.move.x + math.sin(plane_object.transform.rotation.x)*off_rotation
    new_bullet.transform.move.y = plane_object.transform.move.y - math.cos(plane_object.transform.rotation.x)*off_rotation
    
    new_bullet.velocite.force.x = math.sin(plane_object.transform.rotation.x) * new_bullet.velocite.acceleration
    new_bullet.velocite.force.y = -math.cos(plane_object.transform.rotation.x) * new_bullet.velocite.acceleration
  end
end

function ship:Update(dt)
  ship:Clignote(dt)
  
  self.reacteur = false
  
  if love.keyboard.isDown("right") then self:Tourne_Right(dt) end
  if love.keyboard.isDown("left") then self:Tourne_Left(dt) end
  if love.keyboard.isDown("up") then self:Thrust(dt) end
  if love.keyboard.isDown("space") then self:Shoot(dt) end
  
  self.transform.move.Add_To(Mul(self.velocite.force, dt))
  
  Wrap_Around(self)
end

function ship:Draw()
  love.graphics.print(self.ready, 5, 5)
  if self.toggle then
    LG.draw(plane_img,
            self.transform.move.x,
            self.transform.move.y,
            self.transform.rotation.x,
            self.transform.scale.x,
            self.transform.scale.y,
            self.origine.x, self.origine.y)
    if self.reacteur then
      local pos = Vector(self.transform.move.x, self.transform.move.y)
      LG.draw(plane_reacteur_img,
            pos.x, pos.y,
            self.transform.rotation.x,
            self.transform.scale.x,
            self.transform.scale.y,
            self.origine.x, self.origine.y)
    end
  end
  LG.setColor(0, 0, 1)
  LG.circle("fill", self.origine.x, self.origine.y, self.transform.scale.x)
  LG.rectangle("line", self.transform.move.x, self.transform.move.y, plane_img:getWidth(), plane_img:getHeight())
  LG.setColor(1, 1, 1)
end

function ship:Tourne_Left(dt)
  self.transform.rotation.x = self.transform.rotation.x - (self.transform.rotation.speed * dt)
end

function ship:Tourne_Right(dt)
  self.transform.rotation.x = self.transform.rotation.x + (self.transform.rotation.speed * dt)
end

function ship:Thrust(dt)
  plane_reacteur_sound:play()
  
  self.velocite.force.x = self.velocite.force.x + math.sin(self.transform.rotation.x) * Clamp(self.velocite.force.x, 150, 190) * dt
  self.velocite.force.y = self.velocite.force.y - math.cos(self.transform.rotation.x) * Clamp(self.velocite.force.y, 150, 190) * dt
  
  self.reacteur = true
end

function ship:Shields()
  self.transform.move.x = love.math.random(0+32, game.fenetre.size.x)
  self.transform.move.y = love.math.random(0+32, game.fenetre.size.y)
end

function ship:Debug()
  LG.print("Ship Velocite X: "..tostring(self.velocite.force.x), 5, 5+16)
  LG.print("Ship Velocite Y: "..tostring(self.velocite.force.y), 5, 5+16*2)
end

function ship:Keypressed(key)
  if key == "down" then
    self:Shields()
  end
end

return ship