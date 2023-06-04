io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

require "dist"

function love.load()
  love.window.setMode(1000, 800)
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  game = {}
  game.map = {}
  
  game.map.MAP_WIDTH = 20
  game.map.MAP_HEIGHT = 16
  game.map.TILE_WIDTH = 50
  game.map.TILE_HEIGHT = 50
  
  game.map.grid = {
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 3, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 4, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 4, 0},
      {0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    }
  
  game.tile_type = {}
  game.tile_type[0] = "black"
  game.tile_type[1] = "white"
  game.tile_type[2] = "red"
  game.tile_type[3] = "green"
  game.tile_type[4] = "blue"
  
  camera = {}
  camera.x = 410
  camera.y = 210
  camera.width = 300
  camera.height = 250
  
end

function love.update(dt)
  if love.keyboard.isDown("up") and camera.y >= 0 then
    camera.y = camera.y - 10
  end
  if love.keyboard.isDown("right") and camera.x <= largeur-camera.width then
    camera.x = camera.x + 10
  end
  if love.keyboard.isDown("down") and camera.y <= hauteur-camera.height then
    camera.y = camera.y + 10
  end
  if love.keyboard.isDown("left") and camera.x >= 0 then
    camera.x = camera.x - 10
  end
end

function love.draw()
  
  for i = 1, game.map.MAP_HEIGHT do
    for j = 1, game.map.MAP_WIDTH do
      
      id = game.map.grid[i][j]
      
      if game.tile_type[id] == "black" then
        love.graphics.setColor(0.8, 0.8, 0.8)
        love.graphics.rectangle("fill", (j-1)*game.map.TILE_WIDTH, (i-1)*game.map.TILE_HEIGHT, game.map.TILE_WIDTH, game.map.TILE_HEIGHT)
      elseif game.tile_type[id] == "white" then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", (j-1)*game.map.TILE_WIDTH, (i-1)*game.map.TILE_HEIGHT, game.map.TILE_WIDTH, game.map.TILE_HEIGHT)
      elseif game.tile_type[id] == "red" then
        love.graphics.setColor(1, 0, 0)
        love.graphics.rectangle("fill", (j-1)*game.map.TILE_WIDTH, (i-1)*game.map.TILE_HEIGHT, game.map.TILE_WIDTH, game.map.TILE_HEIGHT)
      elseif game.tile_type[id] == "green" then
        love.graphics.setColor(0, 1, 0)
        love.graphics.rectangle("fill", (j-1)*game.map.TILE_WIDTH, (i-1)*game.map.TILE_HEIGHT, game.map.TILE_WIDTH, game.map.TILE_HEIGHT)
      elseif game.tile_type[id] == "blue" then
        love.graphics.setColor(0, 0, 1)
        love.graphics.rectangle("fill", (j-1)*game.map.TILE_WIDTH, (i-1)*game.map.TILE_HEIGHT, game.map.TILE_WIDTH, game.map.TILE_HEIGHT)
      end
      
      love.graphics.setColor(0.5, 0.5, 0.5)
      love.graphics.rectangle("line", (j-1)*game.map.TILE_WIDTH, (i-1)*game.map.TILE_HEIGHT, game.map.TILE_WIDTH, game.map.TILE_HEIGHT)
      
      love.graphics.setColor(1, 1, 0)
      love.graphics.rectangle("line", camera.x, camera.y, camera.width, camera.height)
      
      love.graphics.print(love.timer.getFPS(), 10, 10)
    end
  end
  
end