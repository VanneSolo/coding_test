local asset = {}

--[[

    Ici sont codés les assets du jeu. Il faudra que je les refasse avec le fonctions
    d'affichages de primitives que j'ai encapsulées dans util. La création d'un asset
    se fait en quatre temps:
    -> Définir la taille du canvas de l'image.
    -> Créer une fonction par canvas pour sauvegarder ce qu'on veut afficher sur
       le canvas
    -> Placer chaque fonction init des sprites dans une fonction init globale qui permet
       de centraliser le load de tous les sprites sans avoir à saloper le load global du
       Game.
    -> Appeler la fonction init globale au début du load du Game.

]]
asset.vaisseau_joueur = love.graphics.newCanvas(40, 40)
function asset.ship_spr_init()
  love.graphics.setCanvas(asset.vaisseau_joueur)
  love.graphics.setColor(0, 0, 1)
  love.graphics.polygon("fill", 0, 40, 20, 0, 40, 40)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

asset.alien_1 = love.graphics.newCanvas(40, 40)
function asset.alien_1_spr_init()
  love.graphics.setCanvas(asset.alien_1)
  love.graphics.setColor(1, 0, 0)
  love.graphics.polygon("fill", 0, 0, 20, 40, 40, 0)
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("line", 0, 0, 40, 40)
  love.graphics.setCanvas()
end

asset.tuile_1 = love.graphics.newCanvas(50, 50)
function asset.tuile_1_spr_init()
  love.graphics.setCanvas(asset.tuile_1)
  love.graphics.setColor(0.28, 0.17, 0.15)
  love.graphics.rectangle("fill", 0, 0, 50, 50)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

asset.tuile_2 = love.graphics.newCanvas(50, 50)
function asset.tuile_2_spr_init()
  love.graphics.setCanvas(asset.tuile_2)
  love.graphics.setColor(0.25, 0.37, 0.09)
  love.graphics.rectangle("fill", 0, 0, 50, 50)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

asset.tir_joueur = love.graphics.newCanvas(6, 15)
function asset.tir_joueur_init()
  love.graphics.setCanvas(asset.tir_joueur)
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", 0, 0, 6, 15)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

asset.tir_alien = love.graphics.newCanvas(6, 15)
function asset.tir_alien_init()
  love.graphics.setCanvas(asset.tir_alien)
  love.graphics.setColor(1, 1, 0)
  love.graphics.rectangle("fill", 0, 0, 6, 15)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

function asset.initialize()
  asset.ship_spr_init()
  asset.alien_1_spr_init()
  asset.tuile_1_spr_init()
  asset.tuile_2_spr_init()
  asset.tir_joueur_init()
  asset.tir_alien_init()
end

return asset