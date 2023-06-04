local asset = require("asset")
local sprite = require("util")
local map = require("map")
local tir = require("tir")
local sound = require("sound")

local joueur = {}

function joueur.Init()
  joueur.entite = {}
  sprite.Cree_Sprite("joueur", asset.vaisseau_joueur, (map.colonnes*map.tuile_width)/2 - asset.vaisseau_joueur:getWidth()/2, (map.lignes*map.tuile_width) - (map.tuile_width*3), 5)
  local settings = {}
  settings.spr = sprite.sprites[1]
  table.insert(joueur.entite, settings)
end

function joueur.Update(dt)
  if love.keyboard.isDown("up") then
    joueur.entite[1].spr.y = joueur.entite[1].spr.y - 5
  end
  if love.keyboard.isDown("right") then
    joueur.entite[1].spr.x = joueur.entite[1].spr.x + 5
  end
  if love.keyboard.isDown("down") then
    joueur.entite[1].spr.y = joueur.entite[1].spr.y + 5
  end
  if love.keyboard.isDown("left") then
    joueur.entite[1].spr.x = joueur.entite[1].spr.x - 5
  end
end

function joueur.Draw()
  love.graphics.draw(joueur.entite[1].spr.img, joueur.entite[1].spr.x, joueur.entite[1].spr.y)
end

function joueur.Keyboard(key)
  if key == "space" then
    tir.Init("tir_joueur", asset.tir_joueur, joueur.entite[1].spr.x+(joueur.entite[1].spr.w/2), joueur.entite[1].spr.y, 0, -10)
    sound.Play(sound.shoot)
  end
end

return joueur