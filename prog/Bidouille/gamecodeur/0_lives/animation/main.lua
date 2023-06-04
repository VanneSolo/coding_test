io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  require "sprite"
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  barbare = Cree_Sprite()
  --img = love.graphics.newImage("v2_green_roger_1.png")
  --Set_Sprite(barbare, img)
  Ajoute_Image(barbare, "marche_1", love.graphics.newImage("v2_green_roger_1.png"))
  Ajoute_Image(barbare, "marche_2", love.graphics.newImage("v2_green_roger_2.png"))
  Ajoute_Image(barbare, "marche_3", love.graphics.newImage("v2_green_roger_3.png"))
  Ajoute_Image(barbare, "marche_4", love.graphics.newImage("v2_green_roger_4.png"))
  Ajoute_Image(barbare, "marche_5", love.graphics.newImage("v2_green_roger_5.png"))
  Ajoute_Image(barbare, "marche_6", love.graphics.newImage("v2_green_roger_6.png"))
  Ajoute_Image(barbare, "marche_7", love.graphics.newImage("v2_green_roger_7.png"))
  Ajoute_Image(barbare, "marche_8", love.graphics.newImage("v2_green_roger_8.png"))
  
  Ajoute_Animation(barbare, "Marche", {"marche_1", "marche_2", "marche_3", "marche_4", "marche_5", "marche_6", "marche_7", "marche_8"}, true)
  Start_Animation(barbare, "Marche")
  
  Ajoute_Image(barbare, "explosion_1", love.graphics.newImage("gros_boum_1.png"))
  Ajoute_Image(barbare, "explosion_2", love.graphics.newImage("gros_boum_2.png"))
  Ajoute_Image(barbare, "explosion_3", love.graphics.newImage("gros_boum_3.png"))
  Ajoute_Image(barbare, "explosion_4", love.graphics.newImage("gros_boum_4.png"))
  Ajoute_Image(barbare, "explosion_5", love.graphics.newImage("gros_boum_5.png"))
  
  Ajoute_Animation(barbare, "Explosion", {"explosion_1", "explosion_2", "explosion_3", "explosion_4", "explosion_5"}, false)
end

function love.update(dt)
  Update_Animation(barbare, dt)
  
  if love.keyboard.isDown("up") and barbare.current_animation == "Marche" then
    barbare.y = barbare.y - 2
  end
  if love.keyboard.isDown("right") and barbare.current_animation == "Marche" then
    barbare.x = barbare.x + 2
  end
  if love.keyboard.isDown("down") and barbare.current_animation == "Marche" then
    barbare.y = barbare.y + 2
  end
  if love.keyboard.isDown("left") and barbare.current_animation == "Marche" then
    barbare.x = barbare.x - 2
  end
  
  if barbare.current_animation == "Explosion" and barbare.animation_end["Explosion"] == true then
    Start_Animation(barbare, "Marche")
  end
end

function love.draw()
  love.graphics.setBackgroundColor(0.5, 0.5, 0.5)
  Draw_Sprite(barbare)
end

function love.keypressed(key)
  if key == "space" then
    Start_Animation(barbare, "Explosion")
  end
end