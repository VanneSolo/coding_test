sound = {}

function sound.Init()
  sound.shoot = love.audio.newSource("sounds/shoot.ogg", "static")
  sound.boom = love.audio.newSource("sounds/boom.ogg", "static")
end

function sound.Play(pSource)
  pSource:play()
end

return sound