require "scene_manager"
require "menu"
require "options"
require "game"
require "victoire"
require "defaite"

scenes = {}
scenes.menu = "MENU"
scenes.options = "OPTIONS"
scenes.jeu = "JEU"
scenes.victoire = "VICTOIRE"
scenes.defaite = "DEFAITE"

current_scene = "MENU"
in_menu = true
in_game = false
in_options = false
victoire = false
defaite = false