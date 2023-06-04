local Game = {}

Game.hero = require "hero"

Game.map = {}
Game.map.grid = {
            {8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8},
            {8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8},
            {8, 8, 8, 7, 7, 8, 7, 8, 7, 8, 8, 7, 7, 7, 8, 8, 7, 8, 7, 8, 8, 7, 7, 7, 8, 7, 8, 8, 7, 8, 8, 8},
            {8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8},
            {8, 8, 7, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7, 8, 8, 8},
            {8, 8, 7, 7, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 6, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 7, 7, 8, 8},
            {8, 8, 8, 7, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 6, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 1, 7, 8, 8, 8},
            {8, 8, 7, 7, 1, 2, 3, 3, 3, 3, 3, 3, 3, 6, 6, 6, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 1, 7, 8, 8, 8},
            {8, 8, 7, 7, 1, 2, 3, 3, 3, 3, 3, 3, 3, 6, 5, 5, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 1, 7, 7, 8, 8},
            {8, 8, 7, 7, 1, 2, 3, 3, 3, 3, 3, 3, 5, 5, 5, 5, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 1, 7, 7, 8, 8},
            {8, 8, 8, 7, 1, 2, 3, 3, 3, 3, 3, 3, 5, 5, 5, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 1, 7, 7, 8, 8},
            {8, 8, 7, 7, 1, 2, 3, 3, 3, 3, 3, 3, 3, 5, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 1, 7, 8, 8, 8},
            {8, 8, 8, 7, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 1, 7, 7, 8, 8},
            {8, 8, 8, 7, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 1, 7, 8, 8, 8},
            {8, 8, 8, 7, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 6, 6, 6, 3, 3, 3, 2, 1, 7, 8, 8, 8},
            {8, 8, 7, 7, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 6, 3, 5, 5, 2, 1, 7, 7, 8, 8},
            {8, 8, 8, 7, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 6, 6, 6, 5, 2, 1, 7, 8, 8, 8},
            {8, 8, 7, 7, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 5, 5, 6, 5, 2, 1, 7, 8, 8, 8},
            {8, 8, 7, 7, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 5, 6, 4, 2, 1, 7, 7, 8, 8},
            {8, 8, 8, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 6, 4, 1, 1, 7, 8, 8, 8},
            {8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8},
            {8, 8, 8, 7, 7, 8, 7, 8, 7, 8, 8, 7, 7, 7, 8, 8, 7, 8, 7, 8, 8, 7, 7, 7, 8, 7, 8, 8, 7, 8, 8, 8},
            {8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8},
            {8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8}
            }
    
Game.map.MAP_WIDTH = 32
Game.map.MAP_HEIGHT = 24
Game.map.TILE_WIDTH = 25
Game.map.TILE_HEIGHT = 25  

Game.tilesheet = {}
Game.tileTextures = {}
Game.tiletypes = {}

function Game.map.isSolid(pID)
  local tileType = Game.tiletypes[pID]
  if tileType == "cactus" or tileType == "tree" or tileType == "deep_water" then
    return true
  else
    return false
  end
end

function Game.Load()
  Game.tilesheet = love.graphics.newImage("tilesheet.png")
  local nbColumns = Game.tilesheet:getWidth() / Game.map.TILE_WIDTH
  local nbLines = Game.tilesheet:getHeight() / Game.map.TILE_HEIGHT
  local id = 1
  
  Game.tileTextures[0] = nil
  for l = 1, nbLines do
    for c = 1, nbColumns do
      Game.tileTextures[id] = love.graphics.newQuad(
        (c-1)*Game.map.TILE_WIDTH, (l-1)*Game.map.TILE_HEIGHT, 
        Game.map.TILE_WIDTH, Game.map.TILE_HEIGHT, 
        Game.tilesheet:getWidth(), Game.tilesheet:getHeight()
        )
      id = id + 1
    end
  end
    
  Game.tiletypes[1] = "sand"
  Game.tiletypes[2] = "earth"
  Game.tiletypes[3] = "grass"
  Game.tiletypes[4] = "cactus"
  Game.tiletypes[5] = "tree"
  Game.tiletypes[6] = "river"
  Game.tiletypes[7] = "beach_water"
  Game.tiletypes[8] = "deep_water"
  
  Game.map.fogGrid = {}
  for l = 1, Game.map.MAP_HEIGHT do
    Game.map.fogGrid[l] = {}
    for c = 1, Game.map.MAP_WIDTH do
      Game.map.fogGrid[l][c] = 1
    end
  end
  Game.map.clearFog2(Game.hero.line, Game.hero.column)
end

function Game.Update(dt)
Game.hero.Update(Game.map, dt)
end

function Game.map.clearFog2(pLine, pCol)
  for l = 1, Game.map.MAP_HEIGHT do
    for c = 1, Game.map.MAP_WIDTH do
      if c>0 and c<=Game.map.MAP_WIDTH and l>0 and l<=Game.map.MAP_HEIGHT then
        local dist = math.dist(c, l, pCol, pLine)
        if dist < 7 then
          local alpha = dist/7
          if Game.map.fogGrid[l][c]>alpha then
            Game.map.fogGrid[l][c]=alpha
          end
        end
      end
    end
  end
end

function Game.Draw()
  for l = 1,Game.map.MAP_HEIGHT do
    for c = 1,Game.map.MAP_WIDTH do
      local id = Game.map.grid[l][c]
      local texQuad = Game.tileTextures[id]
      if texQuad ~= nil then
        local x = (c-1)*Game.map.TILE_WIDTH
        local y = (l-1)*Game.map.TILE_HEIGHT
        love.graphics.draw(Game.tilesheet, texQuad, x, y)
        if Game.map.fogGrid[l][c] > 0 then
          love.graphics.setColor(0, 0, 0, Game.map.fogGrid[l][c])
          love.graphics.rectangle("fill", x, y, Game.map.TILE_WIDTH, Game.map.TILE_HEIGHT)
          love.graphics.setColor(1, 1, 1)
        end
      end
    end
  end
  
  Game.hero.Draw(Game.map)
end

return Game