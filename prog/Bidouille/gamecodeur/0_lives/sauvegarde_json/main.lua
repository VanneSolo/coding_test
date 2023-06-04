io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  json = require("json")
  
  --high_score = {}
  
  tableau = {}
  tableau.x = 100
  tableau.y = 3.5
  tableau.texte = "David"
  tableau.taille = "43"
  
  mon_texte = json.encode(tableau)
  --print(mon_texte)
  --[[
  Ajoute_Score("David", 450)
  Ajoute_Score("Arnaud", 15)
  Ajoute_Score("Eric", 250)
  Ajoute_Score("Henri", 78)
  scores = json.encode(high_score)
  --print(scores)
  
  local fichier = love.filesystem.newFile("score_test.json")
  fichier:open('w')
  fichier:write(scores)
  fichier:close()]]
  
  local fichier = love.filesystem.newFile("score_test.json")
  fichier:open('r')
  local contenu_fichier = fichier:read()
  --print(contenu_fichier)
  high_score = json.decode(contenu_fichier)
  for i=1,#high_score do
    print("Nom: "..tostring(high_score[i].nom)..", score: "..tostring(high_score[i].score))
  end
end

function love.update(dt)
end

function love.draw()
end

function Ajoute_Score(nom, score)
  data = {}
  data.nom = nom
  data.score = score
  table.insert(high_score, data)
end