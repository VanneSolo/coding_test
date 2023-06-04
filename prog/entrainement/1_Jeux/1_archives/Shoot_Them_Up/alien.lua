--[[

    On retrouve ici tout ce qui permet de gérer les aliens. A terme plusieurs type d'aliens
    existeront dans le jeu.

]]

local asset = require("asset")
local sprite = require("util")
local map = require("map")
local tir = require("tir")
local pattern = require("mob_pattern")

local alien = {}

--[[
    Pour plus de détails sur le fonctionnement de la création des sprites, se référer
    au commentaire précédent la création du sprite dans joueur.lua. Ce système posera
    peut-être problème quand viendra le temps de créer plusieurs type d'aliens.
]]
function alien.Init()
  alien.entite = {}
  -- Variable qui sert à la première initialisation du chronomètre qui gère le
  --déclenchement des tirs.
  alien.chrono_tir = 0
  -- Paramètres de l'init: ID, image, position x, position y, nombre de pv.
  sprite.Cree_Sprite("alien", asset.alien_1, (map.colonnes*map.tuile_width)/2 - asset.alien_1:getWidth()/2, (map.lignes*map.tuile_width) - (map.tuile_width*10), 5)
  local settings = {}
  settings.spr = sprite.sprites[2]
  table.insert(alien.entite, settings)
end

--[[
    Dans l'update des aliens, pour l'instant on ne trouve qu'un chrono qui gère le déclenchement
    des tirs.
]]
function alien.Update(dt)
  for i_update_alien=#alien.entite,1,-1 do
    -- On récupère l'index de la table des aliens du tour de boucle en cour dans une variable pour
    -- simplifier l'écriture.
    local ennemi = alien.entite[i_update_alien]
    -- On incrémente le chronomètre.
    alien.chrono_tir = alien.chrono_tir + 1
    -- Quand le chrono atteint 15, on déclenche un tir (ID, image, position x, position y, vitessex,
    -- vitesse y), on joue un son et on remet le chrono à 0.
    if alien.chrono_tir >= 15 then
      tir.Init("tir_alien", asset.tir_alien, ennemi.spr.x+(ennemi.spr.w/2), ennemi.spr.y+ennemi.spr.h, 0, 10)
      sound.Play(sound.shoot)
      alien.chrono_tir = 0
    end
  end
end

function alien.Draw()
  for i_draw_alien=#alien.entite,1,-1 do
    local aliens = alien.entite[i_draw_alien]
    love.graphics.draw(aliens.spr.img, aliens.spr.x, aliens.spr.y)
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle("line", aliens.spr.x-1, aliens.spr.y-1, aliens.spr.img:getWidth()+1, aliens.spr.img:getHeight()+1)
    love.graphics.setColor(1, 1, 1)
  end
end

return alien