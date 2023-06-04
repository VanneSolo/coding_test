local asset = require("asset")
local sprite = require("util")
local map = require("map")
local joueur = require("joueur")
local alien = require("alien")
local tir = require("tir")
local sound = require("sound")
local pause = require("pause")

local Game = {}

function Game.Init()
  tir.entite = {}
  
  asset.initialize()
  joueur.Init()
  alien.Init()
  sound.Init()
  
  game_state = "PLAY"
end

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

function Game.Keyboard(key)
  if game_state == "PLAY" then
    joueur.Keyboard(key)
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