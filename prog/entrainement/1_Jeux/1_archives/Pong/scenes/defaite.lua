--[[

	S'affiche en cas de défaite. De là on peut lancer
	une nouvelle partie, retourner au menu ou quitter
	le jeu.

]]

local Defaite = {}

function Defaite:Load()
  
end

function Defaite:Update(dt)
  
end

function Defaite:Draw()
  love.graphics.print("DEFAITE!", 5, 5)
  love.graphics.print("Menu: m", 5, 5+16)
  love.graphics.print("Rejouer: espace", 5, 5+16*2)
  love.graphics.print("Quitter: echap", 5, 5+16*3)
end

function Defaite:Keypressed(key)
  if key == "m" then
    Game.current_scene = "menu"
  elseif key == "space" then
    Game.current_scene = "jeu"
    --Game.Init()
  elseif key == "escape" then
    love.event.quit()
  end
end

function Defaite:Mousepressed(x, y, button)
  
end

return Defaite