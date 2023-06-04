local util = require("util")
local map = require("map")
local asset = require("asset")
local sound = require("sound")

local collision = {}

--[[
    Cette fonction est appellée à chaque tour de boucle sur les tirs. On récupère le sprite et la table du joueur,
    la même chose pour les aliens. On récupère aussi le tir en cours de traitement et la liste des tirs et les compteurs
    des boucles qui parcourent la liste des tirs et la liste des aliens.
]]
function collision.Update(sprite_1, sprite_1_lst, sprite_2, sprite_2_lst, tir, tir_liste, compteur, alien_compteur, dt)
  -- On utilise l'ID pour savoir si le tir vient du joueur ou d'un alien. Ensuite on opère un test de collision de type
  -- AABB entre le tir en cours de traitement et le sprite émetteur du tir. Si une collision est détectée, on marque le
  -- tir comme étant à supprimer de la liste globale des sprites (qui est nettoyée à chaque fin d'update du Game) et on
  -- supprime le tir.
  -- Si le tir touche un alien, on supprime en plus l'alien de la même façon qu'un tir. S'il n'y a plus de d'alien dans
  -- la liste des aliens, alors la partie est gagnée. Il reste encore à coder la condition de défaite.
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