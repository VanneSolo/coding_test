-- INITIALISATION ET FONCTION DE CREATION DES BULLETS
bullets = {}
function Create_Bullet()
  local bullet = {}
  bullet.body = love.physics.newBody(world, player.body:getX()+player.img:getWidth()*math.cos(player.body:getAngle()), player.body:getY()+player.img:getWidth()*math.sin(player.body:getAngle()), "dynamic")
  bullet.body:isBullet(true)
  bullet.body:setUserData(bullet)
  bullet.shape = love.physics.newCircleShape(2)
  bullet.fixture = love.physics.newFixture(bullet.body, bullet.shape, 1)
  bullet.fixture:setUserData(bullet)
  bullet.lifespan = 0.6
  bullet.snd = love.audio.newSource("player_shoot.wav", "stream")
  bullet.id  = "bullet"
  return bullet
end

-- UPDATE DE LA POSITION DES BULLETS ET DE LEUR DUREE DE VIE, JOUE UN SON DE TIR
  -- GERE LEUR DESTRUCTION A LA FIN DE LEUR DUREE DE VIE
  for i=#bullets,1,-1 do
    bullets[i].snd:play()
    bullets[i].body:setAngle(player.body:getAngle())
    bullets[i].body:applyLinearImpulse(20*math.cos(bullets[i].body:getAngle()), 20*math.sin(bullets[i].body:getAngle()))
    bullets[i].lifespan = bullets[i].lifespan - 0.1
    if bullets[i].lifespan <= 0 then
      table.remove(bullets, i)
    end
  end
  
  -- AFFICHAGE DES BULLETS
  love.graphics.setColor(0, 1, 0, 1)
  for i=1,#bullets do
    love.graphics.circle("fill", bullets[i].body:getX(), bullets[i].body:getY(), bullets[i].shape:getRadius())
  end