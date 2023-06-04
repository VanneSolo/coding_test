--[[

    Scène de jeu. C'est principalement un passe plats entre les différents composants du
    jeu: le joueur, les aliens et leurs patterns, les tirs, les collisions et la map.

]]

local asset = require("asset")
local sprite = require("util")
local map = require("map")
local joueur = require("joueur")
local alien = require("alien")
local tir = require("tir")
local sound = require("sound")
local pause = require("pause")

local Game = {}

--[[
    Fonction qui initialise le jeu en appellant les différentes fonctions Init 
    des composants du jeu. On défini aussi un game state courrant pour pouvoir
    gérer la pause.
    La fonction asset.initialize permet de charger tous les assets, qui sont
    codés à partir des primitives de Löve2D.
    
    On initialise aussi ici la liste des tirs à vide à chaque lancement d'une
    nouvelle partie. Ca ne me parait pas le plus propre mais c'est la seule
    façon que j'ai trouvé jusqu'ici pour vider la liste lorsqu'une partie se 
    termine.
]]
function Game.Init()
  tir.entite = {}
  
  asset.initialize()
  joueur.Init()
  alien.Init()
  sound.Init()
  
  game_state = "PLAY"
end

--[[
    Pour l'update, même principe que pour l'init. On appelle les
    updates des différents composants du jeu. 
    
    Dans l'update du tir, en plus du dt, on appelle aussi les listes qui 
    contiennent le joueur et les aliens. C'est nécessaire pour la gestion 
    des collisions.
    
    Le nettoyage de la liste globale des sprites se fait à la fin de chaque 
    update, après avoir réalisé tous les petits updates.
    
    Si le game state est sur pause, on appelle l'update de la pause.
]]
function Game.Update(dt)
  if game_state == "PLAY" then
    map.Update(dt)
    joueur.Update(dt)
    alien.Update(dt)
    tir.Update(joueur.entite, alien.entite, dt)
    
    for i_sprite=#sprite.sprites,1,-1 do
      local truc = sprite.sprites[i_sprite]
      if truc.supprime == true then
        table.remove(sprite.sprites, i_sprite)
      end
    end
  elseif game_state == "PAUSE_GAME" then
    pause.Update(dt)
  end
end

--[[
    Toujours le même principe, on appelle les draw des différents composants
    du jeu. J'affiche également quelques infos de debug. Si le game state est
    sur pause, on appelle le draw de la pause.
]]
function Game.Draw()
  map.Draw()
  joueur.Draw()
  alien.Draw()
  tir.Draw()
  
  love.graphics.print("nombre de sprites: "..tostring(#sprite.sprites), 5, 5)
  love.graphics.print("#joueur: "..tostring(#joueur.entite).."#alien: "..tostring(#alien.entite).."#tir: "..tostring(#tir.entite).."#joueur: "..tostring(#sprite.sprites), 5, 5+16)
  
  if game_state == "PAUSE_GAME" then
    pause.Draw()
  end
end

--[[
    C'est d'ici que l'on gère les entrées clavier du joueur pendant la partie,
    mais aussi l'appel au menu pause.
]]
function Game.Keyboard(key)
  if game_state == "PLAY" then
    joueur.Keyboard(key)
  elseif game_state == "PAUSE_GAME" then
    pause.Keyboard(key)
  end
  
  if key == "escape" then 
    if game_state == "PLAY" then
      game_state = "PAUSE_GAME"
    elseif game_state == "PAUSE_GAME" then
      game_state = "PLAY"
    end
  end
end

return Game