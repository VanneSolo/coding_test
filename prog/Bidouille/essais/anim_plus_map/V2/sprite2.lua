require "loadimage"

truc = {}
truc.frames = {}
truc.frame = 1
truc.sheet = love.graphics.newImage("spritesheet2.png")
truc.x = 350
truc.y = 150

loadImages("spritesheet2.png", 3, 50, 82, truc)