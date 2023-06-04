--[[

    Les éléments du jeu qui ont directement rapport au joueur se
    situent ici.

]]

local asset = require("asset")
local sprite = require("util")
local map = require("map")
local tir = require("tir")
local sound = require("sound")

local joueur = {}

--[[
    On crée l'asset du joueur ici. Comme j'utilise le même système d'initialisation
    que pour tous les autres sprites, le sprite du joueur est placé dans une liste propre
    mais elle ne contiendra que ce seul sprite.
    Le sprite est d'abord crée par l'appel de la méthode Cree_Sprite, puis la variable
    settings.spr prend le contenu de l'index de la table globale des sprites et est insérée
    dans une table locale pour pouvoir récupérer les paramètres du sprites quand on en a
    besoin.
]]
function joueur.Init()
  joueur.entite = {}
  -- Paramètres de l'init: ID, image (ici un canvas comme pour tous les sprites du jeu), position x, position y, nombre de pv.
  sprite.Cree_Sprite("joueur", asset.vaisseau_joueur, (map.colonnes*map.tuile_width)/2 - asset.vaisseau_joueur:getWidth()/2, (map.lignes*map.tuile_width) - (map.tuile_width*3), 5)
  local settings = {}
  settings.spr = sprite.sprites[1]
  table.insert(joueur.entite, settings)
end

--[[
    Dans l'update on ne gère que les déplacements du joueur.
]]
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
    -- Paramètres de l'init du tir: ID, image, position x, position y, vitesse x, viesse y.
    tir.Init("tir_joueur", asset.tir_joueur, joueur.entite[1].spr.x+(joueur.entite[1].spr.w/2), joueur.entite[1].spr.y, 0, -10)
    sound.Play(sound.shoot)
  end
end

return joueur