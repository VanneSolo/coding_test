io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()
  
require("mod.modules")

function love.load()
  love.mouse.setVisible(false)
  game:Load()
  
  min_dt = 1/60
  next_time = love.timer.getTime()
end

function love.update(dt)
  next_time = next_time+min_dt
  
  game:Update(dt)
end

function love.draw()
  game:Draw()
  
  local cur_time = love.timer.getTime()
  if next_time <= cur_time then
    next_time = cur_time
    return
  end
  love.timer.sleep(next_time-cur_time)
end

function love.resize(w, h)
  if game.current_state == "intro" then intro:Resize(w, h)
  elseif game.current_state == "menu" then menu:Resize(w, h)
  elseif game.current_state == "play" then play:Resize(w, h)
  elseif game.current_state == "highscore" then highscore:Resize(w, h) end
end

function love.keypressed(key)
  if game.current_state == "intro" then intro:Keypressed(key)
  elseif game.current_state == "menu" then menu:Keypressed(key)
  elseif game.current_state == "play" then play:Keypressed(key)
  elseif game.current_state == "highscore" then highscore:Keypressed(key) end
  
  if key == "f" then
    love.window.setFullscreen(true)
  end
  if key == "d" then
    game.debugage = not game.debugage
  end
  if key == "q" then
    love.event.quit()
  end
end