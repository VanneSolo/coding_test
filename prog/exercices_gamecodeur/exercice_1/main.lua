io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

liste_sprite = {}

function CreateHero(pImgFile, x_pos, y_pos, s)
  pHeroName = {}
  pHeroName.img = love.graphics.newImage(pImgFile)
  pHeroName.x = x_pos
  pHeroName.y = y_pos
  pHeroName.width = pHeroName.img:getWidth()
  pHeroName.height = pHeroName.img:getHeight()
  pHeroName.speed = s
  table.insert(liste_sprite, pHeroName)
  return pHeroName
end
  
function UpdateHero(pSprite)
  pSprite.x = pSprite.x + pSprite.speed
  
  if pSprite.x-pSprite.width <= 0 or pSprite.x >= WIDTH-pSprite.width then
    franchir_bord = true
  else
    franchir_bord = false
  end
  
  if franchir_bord == true then
    pSprite.speed = pSprite.speed*(-1)
  end
end
  
function DrawHero(pHero)
  if pHero.speed >= 0 then
    love.graphics.draw(pHero.img, pHero.x, pHero.y)
  else
    love.graphics.draw(pHero.img, pHero.x, pHero.y, 0, -1, 1)
  end
end

function love.load()
  WIDTH = love.graphics.getWidth()
  HEIGHT = love.graphics.getHeight()
  
  franchir_bord = false
  vitesse = love.math.random(1, 4)
  
  heros = CreateHero("prout.png", 80, 280, 4)
  heros_1 = CreateHero("prout.png", 150, 450, 2)
  heros_2 = CreateHero("prout.png", 100, 150, 3)
  heros_3 = CreateHero("prout.png", 250, 10, vitesse)
end

function love.update(dt)
  vitesse = love.math.random(1, 4)
  UpdateHero(heros)
  UpdateHero(heros_1)
  UpdateHero(heros_2)
  UpdateHero(heros_3)
end

function love.draw()
  DrawHero(heros)
  DrawHero(heros_1)
  DrawHero(heros_2)
  DrawHero(heros_3)
end