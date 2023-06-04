io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

scenes = {}
scenes.menu = "MENU"
scenes.options = "OPTIONS"
scenes.jeu = "JEU"
scenes.victoire = "VICTOIRE"
scenes.defaite = "DEFAITE"

current_scene = "MENU"

function love.load()
  
end

function love.update(dt)
  
end

function love.draw()
  if current_scene == "MENU" then
    love.graphics.print("Bienvenue dans le menu de mon pong!", 10, 10)
    love.graphics.print("Choisissez ce que vous voulez faire:", 10, 10+16)
    love.graphics.print("Nouvelle partie: N", 10, 10+16*2)
    love.graphics.print("Options: O", 10, 10+16*3)
    love.graphics.print("Quitter le jeu: Q", 10, 10+16*4)
  elseif current_scene == "OPTIONS" then
    love.graphics.print("Bienvenue dans les options", 10, 10)
    love.graphics.print("Choisissez ce que vous voulez faire:", 10, 10+16)
    love.graphics.print("Orientation du terrain de jeu: HORIZONTAL / VERTICAL", 10, 10+16*2)
    love.graphics.print("Niveau de difficulté: 1 / 2 / 3", 10, 10+16*3)
    love.graphics.print("Volume des effets sonores: 0 / 1 / 2 / 3", 10, 10+16*4)
    love.graphics.print("Volume de la musique: 0 / 1 / 2 / 3", 10, 10+16*5)
    love.graphics.print("Quitter les options: Q", 10, 10+16*6)
  elseif current_scene == "JEU" then
    love.graphics.print("Voici l'écran de jeu!", 10, 10)
    love.graphics.print("Appuyez sur V pour la victoire, ou sur D pour la défaite.", 10, 10+16)
  elseif current_scene == "VICTOIRE" then
    love.graphics.print("Vous avez gagné!", 10, 10)
    love.graphics.print("Appuyez sur M pour retourner au menu, ou sur N pour une nouvelle partie.",10, 10+16)
  elseif current_scene == "DEFAITE" then
    love.graphics.print("Vous avez perdu!", 10, 10)
    love.graphics.print("Appuyez sur M pour retourner au menu, ou sur N pour une nouvelle partie.",10, 10+16)
  end
  
end

function love.keypressed(key)
  if current_scene == "MENU" then
    if key == "n" then
      current_scene = "JEU"
    elseif key == "o" then
      current_scene = "OPTIONS"
    elseif key == "q" then
      
    end
  elseif current_scene == "OPTIONS" then
    if key == "q" then
      current_scene = "MENU"
    end
  elseif current_scene == "JEU" then
    if key == "d" then
      current_scene = "DEFAITE"
    elseif key == "v" then
      current_scene = "VICTOIRE"
    end
  elseif current_scene == "VICTOIRE" then
    if key == "m" then
      current_scene = "MENU"
    elseif key == "n" then
      current_scene = "JEU"
    end
  elseif current_scene == "DEFAITE" then
    if key == "m" then
      current_scene = "MENU"
    elseif key == "n" then
      current_scene = "JEU"
    end
  end
end