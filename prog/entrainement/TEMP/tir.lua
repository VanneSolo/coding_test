local asset = require("asset")
local sprite = require("util")
local collision = require("collision")

local tir = {}
tir.entite = {}

function tir.Init(pType, pAsset, pX, pY, pSpeedX, pSpeedY)
  sprite.Cree_Sprite(pType, pAsset, pX, pY)
  local settings = {}
  settings.spr = sprite.sprites[#sprite.sprites]
  settings.spr.vx = pSpeedX
  settings.spr.vy = pSpeedY
  table.insert(tir.entite, settings)
end

function tir.Update(sprite_1_lst, sprite_2_lst, dt)
  for i_update_tir=#tir.entite,1,-1 do
    local pan = tir.entite[i_update_tir]
    pan.spr.x = pan.spr.x + pan.spr.vx
    pan.spr.y = pan.spr.y + pan.spr.vy
    
    for i_alien_lst=#sprite_2_lst,1,-1 do
      local player = sprite_1_lst[1]
      local ennemi = sprite_2_lst[i_alien_lst]
      collision.Update(player.spr, sprite_1_lst, ennemi.spr, sprite_2_lst, pan.spr, tir.entite, i_update_tir, i_alien_lst, dt)
    end
    
    if (pan.spr.y < 0-pan.spr.h or pan.spr.y > hauteur) and pan.spr.supprime == false then
      pan.spr.supprime = true
      table.remove(tir.entite, i_update_tir)
    end
  end
end

function tir.Draw()
  for i_draw_tir=1,#tir.entite do
    local tirs = tir.entite[i_draw_tir]
    love.graphics.draw(tirs.spr.img, tirs.spr.x-(tirs.spr.w/2), tirs.spr.y)
  end
end

return tir