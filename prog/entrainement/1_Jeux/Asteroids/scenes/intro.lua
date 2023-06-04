local scene_intro = {}

function scene_intro:Load()
  width, height = vdo_intro:getDimensions()
  scale = Vector(game.fenetre.size.x / width, game.fenetre.size.y / height)
  vdo_intro:play()
end

function scene_intro:Update(dt)
  if vdo_intro:isPlaying() == false then 
    self:Keypressed("space")
  end
end

function scene_intro:Draw()
  if vdo_intro:isPlaying() then
    LG.draw(vdo_intro, 0, -50, 0, scale.x, scale.y)
  end
end

function scene_intro:Resize(w, h)
  game.fenetre.size = Vector(w, h)
  
  if w > width then
    scale = Vector(game.fenetre.size.x / width, game.fenetre.size.y / height)
  end
end

function scene_intro:Keypressed(key)
  if key == "space" then
    game:menu()
  end
  if key == "escape" then
    game:window_reset()
    self.Load()
  end
end

return scene_intro