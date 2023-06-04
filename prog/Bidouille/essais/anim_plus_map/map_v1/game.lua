local Game = {}
local MAP_WIDTH = 32
local MAP_HEIGHT = 24
local TILE_WIDTH = 25
local TILE_HEIGHT = 25



Game.Map = {}
Game.Map = {{8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8},
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
            {8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8}}
  
Game.Tilesheet = {}
Game.TileTextures = {}
Game.Tiletypes = {}

function Game.Load()
  Game.Tilesheet = love.graphics.newImage("tilesheet.png")
  local nbColumns = Game.Tilesheet:getWidth() / TILE_WIDTH
  local nbLines = Game.Tilesheet:getHeight() / TILE_HEIGHT
  local id = 1
  
Game.TileTextures[0] = nil
  for l = 1, nbLines do
    for c = 1, nbColumns do
      Game.TileTextures[id] = love.graphics.newQuad((c-1)*TILE_WIDTH, (l-1)*TILE_HEIGHT, 
        TILE_WIDTH, TILE_HEIGHT, Game.Tilesheet:getWidth(), Game.Tilesheet:getHeight())
      id = id + 1
    end
  end
    
  Game.Tiletypes[1] = "sand"
  Game.Tiletypes[2] = "earth"
  Game.Tiletypes[3] = "grass"
  Game.Tiletypes[4] = "cactus"
  Game.Tiletypes[5] = "tree"
  Game.Tiletypes[6] = "river"
  Game.Tiletypes[7] = "beach_water"
  Game.Tiletypes[8] = "deep_water"
end
  
function Game.Draw()
  for l = 1, MAP_HEIGHT do
    for c = 1,  MAP_WIDTH do
      local id = Game.Map[l][c]
      local texQuad = Game.TileTextures[id]
      if texQuad ~= nil then
        love.graphics.draw(Game.Tilesheet, texQuad, (c-1)*TILE_WIDTH, (l-1)*TILE_HEIGHT)
      end
    end
  end
end

return Game