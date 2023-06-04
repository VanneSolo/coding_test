highscore_mod = {
  high_score = 0,
  scores = {},
  nb_scores = 0,
  nb_scores_max = 10
}

function highscore_mod:Load()
  local file = LF.newFile("game_data.lua")
  if not LF.getInfo("game_data.lua") or not file:open("r") then return end
  
  self.scores = {}
  
  for line in file:lines() do
    local i = line:find('\t', 1, true)
    self.scores[#self.scores+1] = {sc = line:sub(1, i-1), na = line:sub(i+1)}
  end
  
  if (#self.scores) then
    self.high_score = self.scores[1].sc
  end
  
  return file:close()
end

function highscore_mod:Draw()
  LG.printf("HIGHSCORE", font_40, 0, 150, game.fenetre.size.x, "center")
  
  for k, v in ipairs(self.scores) do
    if k > self.nb_scores_max then return end
    
    LG.printf(tostring(k), font_30, game.fenetre.size.x/2-250, 200+(20*k), 50, "center")
    LG.printf(tostring(v.sc), font_30, game.fenetre.size.x/2-200, 200+(20*k), 300, "right")
    LG.printf(v.na, font_30, game.fenetre.size.x/2+140, 200+(20*k), 80, "center")
  end
end

function highscore_mod:Add(new_score)
  self.scores[#self.scores+1] = new_score
  table.sort(self.scores, function(sc1, sc2) return tonumber(sc1.sc) > tonumber(sc2.sc) end)
end

function highscore_mod:save()
  local file = LF.newFile("game_data.lua")
  if not file:open("w") then return end
  
  if #self.scores < self.nb_scores_max then
    self.nb_scores = #self.scores
  else
    self.nb_scores = self.nb_scores_max
  end
  
  for i=1, self.nb_scores do
    file:write(self.scores[i].sc.."\t"..self.scores[i].na.."\n")
  end
  
  if (#self.scores) then
    self.high_score = self.scores[1].sc
  end
  
  return file:close()
end