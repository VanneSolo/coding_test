io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

require "util"
require "pattern"

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  love.graphics.setPointSize(3)
  
  box = {}
  box.w = 20
  box.h = 20
  box.x = largeur/2 - box.w/2
  box.y = hauteur/2 - box.h/2
  box.vx = 0
  box.vy = 0
  box.speed = 5
  
  Test_Init(0, 14)
  test = false
  Grand_Huit_Init(0, 8)
  grand_huit = false
  
  current_pattern = "stop"
end

function love.update(dt)
  
  if test and grand_huit == false then
    Test_Update(dt)
    grand_huit = false
  elseif grand_huit and test == false then
    Grand_Huit_Update(dt)
    test = false
  end
  
  if current_pattern == "stop" then
    box.vx = 0
    box.vy = 0
  elseif current_pattern == "test" then
    chrono_test = stop_test.update(dt)
    if chrono_test <= 0 then
      box.x = largeur/2 - box.w/2
      box.y = hauteur/2 - box.h/2
      Test_Init(0, 14)
    end
  elseif current_pattern == "grand_huit" then
    chrono_grand_huit = gh_stop_gh.update(dt)
    if chrono_grand_huit <= 0 then
      box.x = largeur-50 - box.w/2
      box.y = hauteur/2 - box.h/2
      Grand_Huit_Init(0, 8)
    end
  end
  
  box.x = box.x + box.vx
  box.y = box.y + box.vy
end

function love.draw()
  love.graphics.rectangle("fill", box.x, box.y, box.w, box.h)
  
  love.graphics.setColor(1, 0, 0)
  love.graphics.points(largeur/2, hauteur/2)
  love.graphics.setColor(1, 1, 1)
  
  if chrono_test ~= nil then
    love.graphics.print("chrono_test: "..tostring(math.floor(chrono_test)+1), 5, 5)
  end
  if chrono_grand_huit ~= nil then
    love.graphics.print("chrono_grand_huit: "..tostring(math.floor(chrono_grand_huit)+1), 150, 5)
  end
  
  love.graphics.print("current pattern: "..tostring(current_pattern), 5, 5+16)
end

function love.keypressed(key)
  if key == "space" then
    if current_pattern == "stop" or current_pattern == "grand_huit" then
      Stop(box)
      current_pattern = "test"
      box.x = largeur/2 - box.w/2
      box.y = hauteur/2 - box.h/2
      Test_Init(0, 14)
      test = true
      grand_huit = false
    elseif current_pattern == "test" then
      Stop(box)
      current_pattern = "grand_huit"
      box.x = largeur-50 - box.w/2
      box.y = hauteur/2 - box.h/2
      Grand_Huit_Init(0, 8)
      test = false
      grand_huit = true
    end
  end
  if key == "s" then
    current_pattern = "stop"
  end
end