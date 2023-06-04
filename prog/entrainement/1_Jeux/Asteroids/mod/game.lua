game = {
  fenetre = {size=Vector(800, 600), fullscreen=false},
  assets_manager = require("lib/assets_manager"),
  current_state = "intro",
  level = 0,
  vies = 3,
  score = {points=0, time_points=10000, compteur=0},
  debugage = false
}

function game:Load()
  math.randomseed(os.time())
  LG.setDefaultFilter("linear", "linear", 8)
  LW.setFullscreen(self.fenetre.fullscreen)
  highscore_mod:Load()
  
  game_music:setVolume(0.3)
  game_music:setLooping(true)
  self:intro()
end

function game:Update(dt)
  if self.current_state == "intro" then intro:Update(dt)
  elseif self.current_state == "menu" then menu:Update(dt)
  elseif self.current_state == "play" then play:Update(dt)
  elseif self.current_state == "highscore" then highscore:Update(dt) end
end

function game:Draw()
  if self.current_state == "intro" then intro:Draw()
  elseif self.current_state == "menu" then menu:Draw()
  elseif self.current_state == "play" then play:Draw()
  elseif self.current_state == "highscore" then highscore:Draw() end
end

function game:intro()
  self.current_state = "intro"
  intro:Load()
end

function game:menu()
  self.current_state = "menu"
  menu:Load()
end

function game:Play()
  self.current_state = "play"
  play:Load()
end

function game:reset()
  self.level = 0
  self.vies = 3
  self.score.points = 0
  self.score.compteur = 0
end

function game:window_reset()
  self.fenetre.size = Vector(800, 600)
  background_object:Set_Scale(2, 2)
  self.fenetre.fullscreen = false
  LW.setFullscreen(false)
end

function game:Add_Live(points)
  self.score.compteur = self.score.compteur + points
  if tonumber(self.score.compteur) >= tonumber(self.score.time_points) then
    new_live_sound:play()
    self.vies = self.vies + 1
    self.score.compteur = 0
  end
end

function game:Dec_Live()
  self.vies = self.vies - 1
  self.vies = self.vies
  if tonumber(self.vies) <= 0 then
    self:menu()
    table.foreach(highscore_mod.scores, function(k,v)
      if tonumber(self.score.points) > tonumber(v.sc) then
        self.current_state = "highscore"
      end
    end)
  end
end

function game:Add_Score(points)
  self.score.points = self.score.points + points
  self:Add_Live(points)
end

function game:Draw_Score()
  LG.printf( (tonumber(self.score.points) == 0 and "00" or tostring(self.score.points)), font_30, 0, 8, 210, "center")
  
  LG.printf( (tonumber(highscore_mod.high_score) == 0 and "00" or tostring(highscore_mod.high_score)), font_24, self.fenetre.size.y/2, 10, 400, "left")
end

function game:Draw_Lives()
  for i=1,((tonumber(self.vies) < 6) and tonumber(self.vies) or 5) do
    LG.draw(plane_img, (i-1)*32+5, 40, 0, 0.5, 0.5)
  end
  
  if tonumber(self.vies) > 5 then
    LG.printf("(+"..tostring(self.vies - 5)..")", font_24, 5*32+5, 40, 10, "center")
  end
end

function game:Next_Level()
  if #asteroid_object.cailloux == 0 then
    self.level = self.level + 1
    bullet_object.weapon.bullets = {}
    asteroid_object:New_Asteroid_Level()
  end
end