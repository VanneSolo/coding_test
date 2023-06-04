local asset = require("asset")
local sprite = require("util")
local collision = require("collision")

local tir = {}

--[[
    L'init du tir fonctionne de la même manière que pour le joueur ou les aliens,
    rien de plus à ajouter.
]]
tir.entite = {}

-- Quand un tir est crée, on recupère son ID, qui permettra de l'identifier lors des
-- collisions, son image, ses coordonnées de spawn pour pouvoir l'afficher et sa
-- vitesse pour pouvoir maj sa position.
function tir.Init(pType, pAsset, pX, pY, pSpeedX, pSpeedY)
  sprite.Cree_Sprite(pType, pAsset, pX, pY)
  local settings = {}
  settings.spr = sprite.sprites[#sprite.sprites]
  settings.spr.vx = pSpeedX
  settings.spr.vy = pSpeedY
  table.insert(tir.entite, settings)
end

--[[
    L'update est un peu plus compliqué. On réupère la liste qui contient le joueur et
    la liste qui contient les aliens.
    
    On boucle sur la liste des tirs pour mettre leur position à jour à chaque
    frame.
    
    Ensuite, pour chaque alien, on test les collisions entre le joueur, l'alien[i] et le
    tir. Il faudra certainement trouver autre chose lorsqu'il y aura plusieurs aliens, voire
    type d'aliens.
    
    Enfin on supprime les tirs qui sortent de l'écran.
]]
function tir.Update(sprite_1_lst, sprite_2_lst, dt)
  for i_update_tir=#tir.entite,1,-1 do
    local pan = tir.entite[i_update_tir]
    pan.spr.x = pan.spr.x + pan.spr.vx
    pan.spr.y = pan.spr.y + pan.spr.vy
    
    for i_alien_lst=#sprite_2_lst,1,-1 do
      local player = sprite_1_lst[1]
      local ennemi = sprite_2_lst[i_alien_lst]
      -- Paramètres de la gestion de collision: sprite du joueur, liste qui contient le joueur, sprite
      -- de l'alien en cour de traitement, liste des aliens, le tir en cour de traitement, la liste des tirs,
      -- le compteur qui boucle sur la liste des tirs et le compteur qui boucle sur la liste des aliens.
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