local asset = require("asset")
local sprite = require("util")
local map = require("map")
local tir = require("tir")
local pattern = require("mob_pattern")

local alien = {}

function alien.Init()
  alien.entite = {}
  alien.chrono_tir = 0
  sprite.Cree_Sprite("alien", asset.alien_1, (map.colonnes*map.tuile_width)/2 - asset.alien_1:getWidth()/2, (map.lignes*map.tuile_width) - (map.tuile_width*10), 5)
  local settings = {}
  settings.spr = sprite.sprites[2]
  table.insert(alien.entite, settings)
end

function alien.Update(dt)
  for i_update_alien=#alien.entite,1,-1 do
    local ennemi = alien.entite[i_update_alien]
    alien.chrono_tir = alien.chrono_tir + 1
    if alien.chrono_tir >= 15 then
      tir.Init("tir_alien", asset.tir_alien, ennemi.spr.x+(ennemi.spr.w/2), ennemi.spr.y+ennemi.spr.h, 0, 10)
      sound.Play(sound.shoot)
      alien.chrono_tir = 0
    end
  end
end

function alien.Draw()
  for i_draw_alien=1,#alien.entite do
    local aliens = alien.entite[i_draw_alien]
    love.graphics.draw(aliens.spr.img, aliens.spr.x, aliens.spr.y)
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle("line", aliens.spr.x-1, aliens.spr.y-1, aliens.spr.img:getWidth()+1, aliens.spr.img:getHeight()+1)
    love.graphics.setColor(1, 1, 1)
  end
end

return alien