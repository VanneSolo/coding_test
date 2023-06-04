sprite = {}
sprite.frames = {}
sprite.frame = 1
sprite.sheet = 0
sprite.x = 0
sprite.y = 0
sprite.rotation = 0
sprite.scale_x = 1
sprite.scale_y = 1

function loadImages(pImgFile, pNbSprites, pLargeurSprite, pHauteurSprite, pCurrentSprite)
  sprite.sheet = love.graphics.newImage(pImgFile)
  currentFrame = 0
  for i=1, pNbSprites, 1 do
    
    pCurrentSprite.frames[i] = love.graphics.newQuad(currentFrame, 0, pLargeurSprite, pHauteurSprite, sprite.sheet:getWidth(), sprite.sheet:getHeight())
    currentFrame = currentFrame + pLargeurSprite
  end
end

function updateImages(dt, pSprite)
  pSprite.frame = pSprite.frame + 10*dt
  if pSprite.frame >= #pSprite.frames + 1 then
    pSprite.frame = 1
  end
end

function drawImages(pSprite)
  local frameArrondie = math.floor(pSprite.frame)
  love.graphics.draw(pSprite.sheet, pSprite.frames[frameArrondie], pSprite.x, pSprite.y, pSprite.rotation, pSprite.scale_x, pSprite.scale_y)
end