-- learn to love page 132/200
-- importer l'ui.
--[[

  Placer les niveaux dans un fichier spécial.
  Créer le scene manager.
  Créer des dossiers pour regrouper les fichiers.

]]
largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

world = require("world")
inputs = require("inputs")
state = require("state")
game_obj = require("game_objects")

local seconds = 0
local paused = false
local current_scene = "menu"

local key_map = {
  space = function()
    paused = not paused
  end,
  escape = function()
    love.event.quit()
  end
}

function love.load()
  bite = game_obj[10]
  
  old_level = state.current_level
end

function love.update(dt)
  if state.current_scene == "menu" then
    
  elseif state.current_scene == "game" then
    if state.game_over or state.paused then
      return
    elseif state.stage_cleared then
      
    end
    
    local index = 1
    while index <= #game_obj-1 do
      local obj = game_obj[index]
      
      if obj.update then
        obj:update(dt)
      end
      index = index+1
    end
    
    --bite:switch()
    bite:update(dt)
    world:update(dt)
  elseif state.current_scene == "pause" then
    
  elseif state.current_scene == "finished" then
    
  end
end

function love.draw()
  love.graphics.print(tostring(state.current_level), 5, 5)
  
  if state.current_scene == "menu" then
    love.graphics.print("MENU. Push Space to play.", 300, 292)
  elseif state.current_scene == "game" then
    for _,obj in ipairs(game_obj) do
      if obj.draw then obj:draw() end
    end
  elseif state.current_scene == "pause" then
    for _,obj in ipairs(game_obj) do
      if obj.draw then obj:draw() end
    end
    love.graphics.print("PAUSE. Press esc to play.", 300, 292)
  elseif state.current_scene == "finished" then
    
  end
end

function love.keypressed(key)
  inputs.press(key)
end

function love.keyreleased(key)
  inputs.release(key)
end

function love.focus(f)
  inputs.set_focus(f)
end