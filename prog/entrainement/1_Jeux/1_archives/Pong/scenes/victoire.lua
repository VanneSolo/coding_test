--[[

	S'affiche en cas de victoire. De là on peut lancer
	une nouvelle partie, retourner au menu ou quitter
	le jeu.

]]

local Victoire = {}

function Victoire:Load()
  
end

function Victoire:Update(dt)
  
end

function Victoire:Draw()
  love.graphics.print("VICTOIRE!", 5, 5)
  love.graphics.print("Menu: m", 5, 5+16)
  love.graphics.print("Rejouer: espace", 5, 5+16*2)
  love.graphics.print("Quitter: echap", 5, 5+16*3)
end

function Victoire:Keypressed(key)
  if key == "m" then
    Game.current_scene = "menu"
  elseif key == "space" then
    Game.current_scene = "jeu"
    --Game.Init()
  elseif key == "escape" then
    love.event.quit()
  end
end

function Victoire:Mousepressed(x, y, button)
  
end

return Victoire