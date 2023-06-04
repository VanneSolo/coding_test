local asset = require("asset")
local sprite = require("util")
local map = require("map")
local joueur = require("joueur")
local alien = require("alien")
local tir = require("tir")
local sound = require("sound")

local Game = {}

function Game.Init()
  asset.initialize()
  joueur.Init()
  alien.Init()
  sound.Init()
end

function Game.Update(dt)
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
end

function Game.Draw()
  map.Draw()
  joueur.Draw()
  alien.Draw()
  tir.Draw()
  love.graphics.print("nombre de sprites: "..tostring(#sprite.sprites))
end

function Game.Keyboard(key)
  joueur.Keyboard(key)
end

return Game