sprite = {}
sprite.frames = {}
sprite.frame = 1
sprite.sheet = 0

function loadImages(pImgFile, pNbSprites, pLargeurSprite, pHauteurSprite, pCurrentSprite)
  sprite.sheet = love.graphics.newImage(pImgFile)
  currentFrame = 0
  for i=1, pNbSprites, 1 do
    
    pCurrentSprite.frames[i] = love.graphics.newQuad(currentFrame, 0, pLargeurSprite, pHauteurSprite, sprite.sheet:getWidth(), sprite.sheet:getHeight())
    currentFrame = currentFrame + pLargeurSprite
  end
end

