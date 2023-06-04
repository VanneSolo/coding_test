io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

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

player = {}

function Init_Game()
  player = {}
  player.w = 10
  player.h = 10
  player.x = 400
  player.y = 300
end

function Update_Game()
  if love.keyboard.isDown("right") then
    player.x = player.x + 4
  end
  if love.keyboard.isDown("left") then
    player.x = player.x - 4
  end
end

function End_Game()
  if player.x >= 800 then
    current_scene = "VICTOIRE"
  end
  if player.x <= -10 then
    current_scene = "DEFAITE"
  end
end

function Draw_Game()
  love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
end

function Update_Menu()
  if in_menu then
    current_scene = "MENU"
  elseif in_game then
    current_scene = "JEU"
    End_Game()
  elseif in_options then
    current_scene = "OPTIONS"
  elseif victoire then
    current_scene = "VICTOIRE"
  elseif defaite then
    current_scene = "DEFAITE"
  end
end

function love.load()
  Init_Game()
end

function love.update(dt)
  Update_Game()
  Update_Menu()
  print(current_scene)
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
    love.graphics.print("Allez vers la droite pour gagner, ou vers la gauche pour perdre.", 10, 10+16)
    Draw_Game()
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
    in_menu = true
    in_game = false
    in_options = false
    victoire = false
    defaite = false
    if key == "n" then
      in_menu = false
      in_game = true
      in_options = false
      victoire = false
      defaite = false
      current_scene = "JEU"
      Init_Game()
    elseif key == "o" then
      in_menu = false
      in_game = false
      in_options = true
      victoire = false
      defaite = false
      current_scene = "OPTIONS"
    elseif key == "q" then
      love.event.quit()
    end
  elseif current_scene == "OPTIONS" then
    if key == "q" then
      in_menu = true
      in_game = false
      in_options = false
      victoire = false
      defaite = false
      current_scene = "MENU"
    end
  elseif current_scene == "JEU" then
    
  elseif current_scene == "VICTOIRE" then
    if key == "m" then
      in_menu = true
      in_game = false
      in_options = false
      victoire = false
      defaite = false
      current_scene = "MENU"
    elseif key == "n" then
      in_menu = false
      in_game = true
      in_options = false
      victoire = false
      defaite = false
      current_scene = "JEU"
      Init_Game()
    end
  elseif current_scene == "DEFAITE" then
    if key == "m" then
      in_menu = true
      in_game = false
      in_options = false
      victoire = false
      defaite = false
      current_scene = "MENU"
    elseif key == "n" then
      in_menu = false
      in_game = true
      in_options = false
      victoire = false
      defaite = false
      current_scene = "JEU"
      Init_Game()
    end
  end
end