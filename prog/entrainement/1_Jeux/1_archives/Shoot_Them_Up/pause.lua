--[[

    Ici est géré le menu pause, accessible en cours de jeu. D'ici on pourra retourner
    au menu, quitter ou reprendre le jeu et accéder à quelques options. Toute l'UI
    reste là-aussi à mettre en place.

]]

local Options_G = require("options_in_game")
local util = require("util")
local pause = {}

function pause.Update(dt)
  
end

function pause.Draw()
  util.Rect(0.85, 0.25, 0.77, "fill", 350, 200, 100, 200)
end

function pause.Keyboard(key)
  --[[if key == "escape" then
    current_scene = "GAME"
  end]]
end

function pause.Mouse(x, y, button)
  
end

return pause