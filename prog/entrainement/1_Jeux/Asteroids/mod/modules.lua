LA = love.audio
LT = love.timer
LK = love.keyboard
LM = love.math
LG = love.graphics
LW = love.window
LF = love.filesystem

require("lib.math_ex")
require("lib.vector")
require("mod.game")

require("mod.transform")
require("mod.collider")
require("mod.outils")
require("mod.highscore_mod")

require("graphismes.assets")
Load_Assets()

game.assets_manager:Add_Object("background", require("obj.background"))
game.assets_manager:Add_Object("asteroid", require("obj.asteroid"))
game.assets_manager:Add_Object("ovni", require("obj.ovni"))
game.assets_manager:Add_Object("plane", require("obj.plane"))
game.assets_manager:Add_Object("bullet", require("obj.bullet"))
game.assets_manager:Add_Object("explode", require("obj.explode"))

highscore = require("scenes.highscore_scene")
intro = require("scenes.intro")
menu = require("scenes.menu")
play = require("scenes.play")

game.assets_manager:Load_Font("font_24", "font/Inconsolata-Regular.ttf")
game.assets_manager:Load_Font("font_30", "font/Inconsolata-Regular.ttf")
game.assets_manager:Load_Font("font_40", "font/Inconsolata-Regular.ttf")
game.assets_manager:Load_Font("font_70", "font/Inconsolata-Regular.ttf")

game.assets_manager:Load_Image("img_asteroid", canvas_asteroid)
game.assets_manager:Load_Image("img_background", canvas_background)
game.assets_manager:Load_Image("img_bullet_ovni", canvas_bullet_ovni)
game.assets_manager:Load_Image("img_bullet_plane", canvas_bullet)
game.assets_manager:Load_Image("img_explode", canvas_explode)
game.assets_manager:Load_Image("img_ovni", canvas_alien)
game.assets_manager:Load_Image("img_plane", canvas_ship)
game.assets_manager:Load_Image("img_reacteur", canvas_reacteur)

game.assets_manager:Load_Sound("snd_explode_large", "sons/bangLarge.wav")
game.assets_manager:Load_Sound("snd_explode_medium", "sons/bangMedium.wav")
game.assets_manager:Load_Sound("snd_explode_small", "sons/bangSmall.wav")
game.assets_manager:Load_Sound("snd_new_live", "sons/newlive.ogg")
game.assets_manager:Load_Sound("snd_ovni_big", "sons/saucerBig.wav")
game.assets_manager:Load_Sound("snd_ovni_small", "sons/saucerSmall.wav")
game.assets_manager:Load_Sound("snd_reacteur", "sons/thrust.wav")
game.assets_manager:Load_Sound("snd_select", "sons/select.mp3")
game.assets_manager:Load_Sound("snd_tir", "sons/fire.wav")

game.assets_manager:Load_Music("msc_music", "sons/music.mp3")

game.assets_manager:Load_Video("video_highscore", "videos/gameover.ogv")
game.assets_manager:Load_Video("video_intro", "videos/intro.ogv")
game.assets_manager:Load_Video("video_menu", "videos/menu.ogv")

--
asteroid_object = game.assets_manager:Get_Object("asteroid")
asteroid_img = game.assets_manager:Get_Image("img_asteroid")
--
background_object = game.assets_manager:Get_Object("background")
background_img = game.assets_manager:Get_Image("img_background")
--
bullet_object = game.assets_manager:Get_Object("bullet")
bullet_ovni_img = game.assets_manager:Get_Image("img_bullet_ovni")
bullet_plane_img = game.assets_manager:Get_Image("img_bullet_plane")
--
explode_object = game.assets_manager:Get_Object("explode")
explode_img = game.assets_manager:Get_Image("img_explode")
explode_large_sound = game.assets_manager:Get_Sound("snd_explode_large")
explode_medium_sound = game.assets_manager:Get_Sound("snd_explode_medium")
explode_small_sound = game.assets_manager:Get_Sound("snd_explode_small")
--
new_live_sound = game.assets_manager:Get_Sound("snd_new_live")
--
ovni_object = game.assets_manager:Get_Object("ovni")
ovni_img = game.assets_manager:Get_Image("img_ovni")
ovni_big_sound = game.assets_manager:Get_Sound("snd_ovni_big")
ovni_small_sound = game.assets_manager:Get_Sound("snd_ovni_small")
--
plane_object = game.assets_manager:Get_Object("plane")
plane_img = game.assets_manager:Get_Image("img_plane")
plane_reacteur_img = game.assets_manager:Get_Image("img_reacteur")
plane_reacteur_sound = game.assets_manager:Get_Sound("snd_reacteur")
--
selection_sound = game.assets_manager:Get_Sound("snd_select")
--
tir_sound = game.assets_manager:Get_Sound("snd_tir")

font_24 = game.assets_manager:Get_Font("font_24")
font_30 = game.assets_manager:Get_Font("font_30")
font_40 = game.assets_manager:Get_Font("font_40")
font_70 = game.assets_manager:Get_Font("font_70")

game_music = game.assets_manager:Get_Music("msc_music")

vdo_intro = game.assets_manager:Get_Video("video_intro")
vdo_menu = game.assets_manager:Get_Video("video_menu")
vdo_highscore = game.assets_manager:Get_Video("video_highscore")