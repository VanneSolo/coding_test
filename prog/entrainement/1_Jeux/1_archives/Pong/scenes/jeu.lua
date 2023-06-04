--[[

	Au lancement de la scène de jeu, on charge tous les game objects.
	Ensuite on les update et on les draw. Dans l'update on appelle
	aussi le collider.

]]

local Game_Scene = {}

function Game_Scene:Load()
  for _,v in pairs(game_objects) do
		v:Load()
	end
end

function Game_Scene:Update(dt)
  for _,v in pairs(game_objects) do
		v:Update(dt)
	end
end

function Game_Scene:Draw()
	for _,v in pairs(game_objects) do
		v:Draw()
	end
end

function Game_Scene:Keypressed(key)
  if key == "backspace" then
		Game.current_state = "menu"
	end
end

function Game_Scene:Mousepressed(x, y, button)
  
end

return Game_Scene