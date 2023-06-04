--[[

	Dans le main on gère les callbacks pour chaque scène. On gère aussi
	dans le keypressed global les touches pour mettre en fullscreen, 
	afficher ou non le debug ou quitter le jeu.

]]
largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

require("modules.modules_manager")
-- LOAD
function love.load()
  if Game.current_state == "menu" then
    --menu:Load()
  elseif Game.current_state == "options_in_menu" then
    --options_in_menu:Load()
  elseif Game.current_state == "jeu" then
    jeu:Load()
  elseif Game.current_state == "options_in_jeu" then
    options_in_jeu:Load()
  elseif Game.current_state == "pause" then
    pause:Load()
  elseif Game.current_state == "victoire" then
    victoire:Load()
  elseif Game.current_state == "defaite" then
    defaite:Load()
  end
end

 -- UPDATE
function love.update(dt)
  if Game.current_state == "menu" then
    menu:Update(dt)
  elseif Game.current_state == "options_in_menu" then
    options_in_menu:Update(dt)
  elseif Game.current_state == "jeu" then
    jeu:Update(dt)
  elseif Game.current_state == "options_in_jeu" then
    options_in_jeu:Update(dt)
  elseif Game.current_state == "pause" then
    pause:Update(dt)
  elseif Game.current_state == "victoire" then
    victoire:Update(dt)
  elseif Game.current_state == "defaite" then
    defaite:Update(dt)
  end
end

-- DRAW
function love.draw()
  if Game.current_state == "menu" then
    menu:Draw()
  elseif Game.current_state == "options_in_menu" then
    options_in_menu:Draw()
  elseif Game.current_state == "jeu" then
    jeu:Draw()
  elseif Game.current_state == "options_in_jeu" then
    options_in_jeu:Draw()
  elseif Game.current_state == "pause" then
    pause:Draw()
  elseif Game.current_state == "victoire" then
    victoire:Draw()
  elseif Game.current_state == "defaite" then
    defaite:Draw()
  end
end

-- KEYPRESSED
function love.keypressed(key)
  if Game.current_state == "menu" then
    menu:Keypressed(key)
  elseif Game.current_state == "options_in_menu" then
    options_in_menu:Keypressed(key)
  elseif Game.current_state == "jeu" then
    jeu:Keypressed(key)
  elseif Game.current_state == "options_in_jeu" then
    options_in_jeu:Keypressed(key)
  elseif Game.current_state == "pause" then
    pause:Keypressed(key)
  elseif Game.current_state == "victoire" then
    victoire:Keypressed(key)
  elseif Game.current_state == "defaite" then
    defaite:Keypressed(key)
  end
end

-- MOUSEPRESSED
function love.mousepressed(x, y, button)
  if Game.current_state == "menu" then
    menu:Mousepressed(x, y, button)
  elseif Game.current_state == "options_in_menu" then
    options_in_menu:Mousepressed(x, y, button)
  elseif Game.current_state == "jeu" then
    jeu:Mousepressed(x, y, button)
  elseif Game.current_state == "options_in_jeu" then
    options_in_jeu:Mousepressed(x, y, button)
  elseif Game.current_state == "pause" then
    pause:Mousepressed(x, y, button)
  elseif Game.current_state == "victoire" then
    victoire:Mousepressed(x, y, button)
  elseif Game.current_state == "defaite" then
    defaite:Mousepressed(x, y, button)
  end
end