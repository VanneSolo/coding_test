require "loadimage"

munitions = {}
munitions.frames = {}
munitions.frame = 1
munitions.sheet = love.graphics.newImage("vaisseau_rouge_mun.png")

loadImages("vaisseau_rouge_mun.png", 3, 30, 30, munitions)