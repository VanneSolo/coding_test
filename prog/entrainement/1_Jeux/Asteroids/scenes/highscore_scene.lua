local scene_highscore = {
  toggle = false,
  tempo = 0,
  chars = {[1]=65, [2]=65, [3]=65},
  indice = 1
}

function scene_highscore:Load()
  width, height = vdo_highscore:getDimensions()
  scale = Vector(game.fenetre.size.x/width, game.fenetre.size.y/height)
  
  vdo_highscore:play()
end

function scene_highscore:Update(dt)
  self.tempo = self.tempo + dt
  
  if self.tempo > 0.3 then
    self.tempo = 0
    self.toggle = not self.toggle    
  end
end

function scene_highscore:Draw()
  if vdo_highscore:isPlaying() then
    LG.draw(vdo_highscore, 0, -50, 0, scale.x, scale.y)
  end
  
  if not vdo_highscore:isPlaying() then
    vdo_highscore:seek(0)
    vdo_highscore:play()
  end
  
  game:Draw_Score()
  
  local font = ((game.fenetre.fullscreen) and font_70 or font_30)
  local h = (game.fenetre.fullscreen) and 250 or 200
  local off_h = (game.fenetre.fullscreen) and 50 or 20
  LG.printf("YOUR SCORE IS ONE OF THE TEN BEST", font, 0, game.fenetre.size.y/2-h, game.fenetre.size.x, "left")
  LG.printf("PLEASE ENTER YOUR INITIALS", font, 0, game.fenetre.size.y/2-(h-off_h), game.fenetre.size.x, "left")
  LG.printf("PUSH LEFT OR RIGHT TO SELECT LETTER", font, 0, game.fenetre.size.y/2-(h-2*off_h), game.fenetre.size.x, "left")
  LG.printf("PUSH SPACE WHEN LETTER IS CORRECT", font, 0, game.fenetre.size.y/2-(h-3*off_h), game.fenetre.size.x, "left")
  
  if self.indice == 1 then
    if self.toggle then
      LG.printf(string.char(self.chars[1]), font_70, game.fenetre.size.x/2-50, game.fenetre.size.y/2, game.fenetre.size.x, "left")
    end
    LG.printf(string.char(self.chars[2]), font_70, game.fenetre.size.x/2, game.fenetre.size.y/2, game.fenetre.size.x, "left")
    LG.printf(string.char(self.chars[3]), font_70, game.fenetre.size.x/2+50, game.fenetre.size.y/2, game.fenetre.size.x, "left")
  elseif self.indice == 2 then
    LG.printf(string.char(self.chars[1]), font_70, game.fenetre.size.x/2-50, game.fenetre.size.y/2, game.fenetre.size.x, "left")
    if self.toggle then
      LG.printf(string.char(self.chars[2]), font_70, game.fenetre.size.x/2, game.fenetre.size.y/2, game.fenetre.size.x, "left")
    end
    LG.printf(string.char(self.chars[3]), font_70, game.fenetre.size.x/2+50, game.fenetre.size.y/2, game.fenetre.size.x, "left")
  elseif self.indice == 3 then
    LG.printf(string.char(self.chars[1]), font_70, game.fenetre.size.x/2-50, game.fenetre.size.y/2, game.fenetre.size.x, "left")
    LG.printf(string.char(self.chars[2]), font_70, game.fenetre.size.x/2, game.fenetre.size.y/2, game.fenetre.size.x, "left")
    if self.toggle then
      LG.printf(string.char(self.chars[3]), font_70, game.fenetre.size.x/2+50, game.fenetre.size.y/2, game.fenetre.size.x, "left")
    end
  end
end

function scene_highscore:reset()
  self.indice = 1
  self.chars[1] = 65
  self.chars[2] = 65
  self.chars[3] = 65
end

function scene_highscore:Resize(w, h)
  game.fenetre.size = Vector(w, h)
  
  if w > width then
    scale = Vector(game.fenetre.size.x/width, game.fenetre.size.y/height)
  end
end

function scene_highscore:Add_High_Score()
  local l_name = string.char(highscore.chars[1])..string.char(highscore.chars[2])..string.char(highscore.chars[3])
  highscore_mod:Add({sc=game.score.points, na = l_name})
  highscore_mod:save()
end

function scene_highscore:Keypressed(key)
  if key == "space" then
    self:Add_High_Score()
    self:reset()
    game:reset()
    game:menu()
  end
  
  if key == "escape" then
    game:window_reset()
    self:Load()
  end
  
  if key == "right" then
    selection_sound:play()
    self.chars[self.indice] = self.chars[self.indice] + 1
    if self.chars[self.indice] > 90 then
      self.chars[self.indice] = 65
    end
  elseif key == "left" then
    selection_sound:play()
    self.chars[self.indice] = self.chars[self.indice] - 1
    if self.chars[self.indice] < 65 then
      self.chars[self.indice] = 90
    end
  elseif key == "down" then
    selection_sound:play()
    self.indice = self.indice+1
    if self.indice > 3 then
      self.indice = 1
    end
  end
end

return scene_highscore