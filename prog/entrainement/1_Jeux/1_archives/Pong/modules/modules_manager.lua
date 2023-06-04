LG = love.graphics
LK = love.keyboard
LM = love.math
LT = love.timer
LW = love.windows

love.graphics.setDefaultFilter("nearest", "nearest", 1)

math.randomseed(os.time())

require("modules.game_settings")

require("modules.utils.collider")
require("modules.utils.maths")
require("modules.utils.outils")
gui = require("modules.utils.user_interface")
require("modules.utils.particules")
require("modules.utils.vector")

options_assets = require("assets.options_assets")
require("assets.graphismes.sprites")
--font_menu = love.graphics.newFont("assets.graphismes.Montserrat-Regular.ttf")

-- chargement insertion des game objects dans la table correspondante
-- dans le fichier game_settings

terrain = require("modules.game_objects.terrain")
balle = require("modules.game_objects.balle")
joueur_1 = require("modules.game_objects.joueur_1")
joueur_2 = require("modules.game_objects.joueur_2")

table.insert(game_objects, terrain)
table.insert(game_objects, balle)
table.insert(game_objects, joueur_1)
table.insert(game_objects, joueur_2)

-- scènes
menu = require("scenes.menu")
options_in_menu = require("scenes.options_in_menu")
jeu = require("scenes.jeu")
options_in_jeu = require("scenes.options_in_jeu")
pause = require("scenes.pause")
victore = require("scenes.victoire")
defaite = require("scenes.defaite")