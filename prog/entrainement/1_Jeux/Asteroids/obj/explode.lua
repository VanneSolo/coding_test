local explode = {
  run = false,
  nb_frames = 3,
  current_frame = 1,
  sc = 1, -- scale
  tempo = 0,
  tempo_max = 0.3,
  frames = {}
}

function explode:Start(x, y, scale)
  self.current_frame = 1
  self.run = true
  self.pos = Vector(x, y)
  self.x = x
  self.y = y
  self.sc = sc
  if sc == 3 then
    explode_large_sound:stop()
    explode_large_sound:play()
  elseif sc == 2 then
    explode_medium_sound:stop()
    explode_medium_sound:play()
  else
    explode_small_sound:stop()
    explode_small_sound:play()
  end
end

function explode:Load()
  self.size = Vector(explode_img:getWidth(), explode_img:getHeight())
  
  local frame_width = 24
  local frame_height = 24
  
  for i=0,self.nb_frames-1 do
    table.insert(self.frames, LG.newQuad(i*frame_width, 0, frame_width, frame_height, self.size.x, self.size.y))
  end
  self.current_frame = 1
end

function explode:Update(dt)
  self.tempo = self.tempo + dt
  
  if self.tempo > self.tempo_max then
    self.tempo = 0
    
    if self.current_frame < self.nb_frames and self.run then
      self.current_frame = self.current_frame + 1
    else
      self.run = false
    end
  end
end

function explode:Draw()
  if self.pos then
    love.graphics.draw(explode_img, self.frames[self.current_frame], self.pos.x, self.pos.y, 0, self.sc, self.sc)
  end
end

function explode:Debug()
  
end

return explode