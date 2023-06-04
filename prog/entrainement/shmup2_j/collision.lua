local util = require("util")
local map = require("map")
local asset = require("asset")
local sound = require("sound")

local collision = {}

function collision.Update(sprite_1, sprite_1_lst, sprite_2, sprite_2_lst, tir, tir_liste, compteur, alien_compteur, dt)
  if tir.ID == "tir_alien" then
    if util.CheckCollision(sprite_1, tir) then
      tir.supprime = true
      table.remove(tir_liste, compteur)
    end
  elseif tir.ID == "tir_joueur" then
    if util.CheckCollision(sprite_2, tir) then
      tir.supprime = true
      sprite_2.supprime = true
      table.remove(tir_liste, compteur)
      table.remove(sprite_2_lst, alien_compteur)
      if #sprite_2_lst <= 0 then
        current_scene = "VICTOIRE"
        util.sprites = {}
      end
    end
  end
end

return collision