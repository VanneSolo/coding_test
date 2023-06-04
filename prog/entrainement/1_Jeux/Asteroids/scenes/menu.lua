local scene_menu = {}

function scene_menu:Load()
  game_music:stop()
  vdo_intro:getSource():stop()
  
  width, height = vdo_menu:getDimensions()
  scale = Vector(game.fenetre.size.x / width, game.fenetre.size.y / height)
  vdo_menu:play()
  timer_toggle = 0
end

function scene_menu:Update(dt)
  timer_toggle = timer_toggle + dt
  
  if timer_toggle > 0.3 then
    timer_toggle = 0
    toggle = not toggle
  end
end

function scene_menu:Draw()
  if vdo_menu:isPlaying() then
    LG.draw(vdo_menu, 0, -50, 0, scale.x, scale.y)
  end
  if not vdo_menu:isPlaying() then
    vdo_menu:seek(0)
    vdo_menu:play()
  end
  game:Draw_Score()
  if toggle then
    LG.printf("PUSH START", font_70, 0, 50, game.fenetre.size.x, "center")
  end
  highscore_mod:Draw()
  LG.printf("2022 OURS_SOLITAIRE", font_30, 0, game.fenetre.size.y-50, game.fenetre.size.x, "center")
end

function scene_menu:Resize(w, h)
  game.fenetre.size = Vector(w, h)
  
  if w > width then
    scale = Vector(game.fenetre.size.x / width, game.fenetre.size.y / height)
  end
end

function scene_menu:Keypressed(key)
  if key == "space" then
    game:reset()
    game:Play()
  end
  if key == "escape" then
    game:window_reset()
    self.Load()
  end
end

return scene_menu