io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  logo = {}
  logo.img = love.graphics.newImage("ul_paper.jpg")
  logo.img_w = logo.img:getWidth()
  logo.img_h = logo.img:getHeight()
  logo.x = largeur/2
  logo.y = hauteur/2
  logo.ox = logo.img_w/2
  logo.oy = logo.img_h/2
  
  splash_alpha = 1
  splash_alpha_vitesse = 1
  splash_alpha_pause = 2
  
  splash_state = {"vers_image", "pause", "vers_noir"}
  current_state = "vers_image"
end

function love.update(dt)
  if current_state == "vers_image" then
    splash_alpha = splash_alpha - (dt/4 * splash_alpha_vitesse)
    if splash_alpha <= 0 then
      current_state = "pause"
    end
  elseif current_state == "pause" then
    splash_alpha_pause = splash_alpha_pause - dt
    if splash_alpha_pause <= 0 then
      current_state = "vers_noir"
    end
  elseif current_state == "vers_noir" then
    splash_alpha_vitesse = -1
    splash_alpha = splash_alpha - (dt/4 * splash_alpha_vitesse)
    if splash_alpha >= 1 then
      splash_alpha = 1
    end
  end
end

function love.draw()
  love.graphics.draw(logo.img, logo.x, logo.y, 0, 1, 1, logo.ox, logo.oy)
  
  love.graphics.setColor(0, 0, 0, splash_alpha)
  love.graphics.rectangle("fill", 1, 1, largeur, hauteur)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print(splash_alpha, 10, 10)
  love.graphics.print(splash_alpha_pause, 10, 20)
end