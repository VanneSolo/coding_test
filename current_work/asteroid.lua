-- CREATION D'UN ASTEROIDE
function Create_Asteroid()
  local asteroid = {}
  asteroid.body = love.physics.newBody(world, 200, 200, "dynamic")
  asteroid.body:setUserData(asteroid)
  asteroid.shape = love.physics.newCircleShape(30)
  asteroid.fixture = love.physics.newFixture(asteroid.body, asteroid.shape, 10)
  asteroid.fixture:setUserData(asteroid)
  asteroid.id = "asteroid"
  asteroid.pv = 4
  asteroid.nb_lives = 3
  asteroid.is_alive = true
  return asteroid
end

-- CREATION D'UN ASTEROIDE
  asteroid = Create_Asteroid()
  
  -- DEPLACEMENT DE L'ASTEROIDE
  --asteroid.body:setLinearVelocity(-50, math.random(-10, 10))
  if asteroid.body:isDestroyed() == false then
    asteroid.body:setLinearVelocity(-50, -50)
    if asteroid.body:getX() > largeur+asteroid.shape:getRadius() then
      asteroid.body:setX(-asteroid.shape:getRadius())
    end
    if asteroid.body:getX() < -asteroid.shape:getRadius() then
      asteroid.body:setX(largeur+asteroid.shape:getRadius())
    end
    if asteroid.body:getY() > hauteur+asteroid.shape:getRadius() then
      asteroid.body:setY(-asteroid.shape:getRadius())
    end
    if asteroid.body:getY() < -asteroid.shape:getRadius() then
      asteroid.body:setY(hauteur+asteroid.shape:getRadius())
    end
    if asteroid.is_alive == false then
      asteroid.body:destroy()
    end
  end
  
  -- AFFICHAGE DE L'ASTEROIDE
  if asteroid.body:isDestroyed() == false then
    love.graphics.setColor(1, 0.33, 0.47)
    love.graphics.circle("fill", asteroid.body:getX(), asteroid.body:getY(), asteroid.shape:getRadius())
  end