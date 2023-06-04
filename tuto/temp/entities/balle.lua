--[[

  => Ajouter des balles si le bonus correspondant est récupéré.
    => Update et draw de toute les balles.
    => Supprimer une balle si elle sort de l'écran.
    => Reset de la tables des balles si on change de niveau ou qu'on perd.
  => Coller la balle au pad en début de partie ou après avoir perdu une vie.
  => Augmenter la vitesse de la balle après une collision.
  
  => Trigger pour détecter les différents bonus (ajouter une balle, ralentir, accélérer).

]]

return function(p_x, p_y, p_id)
  local balle_max_speed = 880
  
  local balle = {}
  balle.id = p_id
  balle.body = love.physics.newBody(world, p_x, p_y, "dynamic")
  balle.body:setMass(32)
  balle.body:setLinearVelocity(300, 300)
  balle.shape = love.physics.newCircleShape(0, 0, 10)
  balle.fixture = love.physics.newFixture(balle.body, balle.shape)
  balle.fixture:setFriction(0)
  balle.fixture:setRestitution(1)
  balle.fixture:setUserData(balle)
  
  balle.update = function(self)
    local vel_x, vel_y = self.body:getLinearVelocity()
    local speed = math.abs(vel_x)+ math.abs(vel_y)
    local critical_vel_x = math.abs(vel_x) > balle_max_speed*2
    local critical_vel_y = math.abs(vel_y) > balle_max_speed*2
    
    if critical_vel_x or critical_vel_y then
      self.body:setLinearVelocity(vel_x*0.75, vel_y*0.75)
    end
    
    if speed > balle_max_speed then
      self.body:setLinearDamping(0.1)
    else
      self.body:setLinearDamping(0)
    end
  end
  
  balle.draw = function(self)
    local self_x, self_y = self.body:getWorldCenter()
    love.graphics.circle("fill", self_x, self_y, self.shape:getRadius())
  end

  return balle
end