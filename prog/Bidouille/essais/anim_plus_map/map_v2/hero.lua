require "loadimages"

hero = {}
hero.frames = {}
hero.frame = 1
hero.sheet = love.graphics.newImage("v2_green_roger_spritesheet.png")
hero.line = 8
hero.column = 8
hero.keyPressed = false

loadImages("v2_green_roger_spritesheet.png", 8, 14, 32, hero)

function hero.Update(pMap, dt)
  hero.frame = hero.frame + 10*dt
  if hero.frame >= #hero.frames + 1 then
    hero.frame = 1
  end
  
  if love.keyboard.isDown("up", "right", "down", "left") then
    if hero.keyPressed == false then
      local old_column = hero.column
      local old_line = hero.line
      
      if love.keyboard.isDown("up") and hero.line > 1 then
        hero.line = hero.line - 1
      end
      if love.keyboard.isDown("right") and hero.column < pMap.MAP_WIDTH then
        hero.column = hero.column + 1
      end
      if love.keyboard.isDown("down") and hero.line < pMap.MAP_HEIGHT then
        hero.line = hero.line + 1
      end
      if love.keyboard.isDown("left") and hero.column > 1 then
        hero.column = hero.column - 1
      end
      
      local id = pMap.grid[hero.line][hero.column]
      if pMap.isSolid(id) then
        hero.column = old_column
        hero.line = old_line
      else
        pMap.clearFog2(hero.line, hero.column)
      end
      hero.keyPressed = true
    end
  else
    hero.keyPressed = false
  end

end

function hero.Draw(pMap)
  local frameArrondie = math.floor(hero.frame)
  local x = (hero.column-1)*pMap.TILE_WIDTH
  local y = (hero.line-1)*pMap.TILE_HEIGHT
  love.graphics.draw(hero.sheet, hero.frames[frameArrondie], x, y)
end

return hero