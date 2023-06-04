io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

require("vecteurs")

largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

draw_test = {}
draw_test.w = largeur
draw_test.h = hauteur
draw_test.x = 0
draw_test.y = 0
draw_test.img = love.graphics.newCanvas(draw_test.w, draw_test.h)
draw_test.Load = function()
  love.graphics.setCanvas(draw_test.img)
  love.graphics.setColor(0.08, 0.45, 0.78)
  love.graphics.rectangle("fill", 0, 0, 800, 600)
  love.graphics.setColor(0, 1, 1)
  love.graphics.rectangle("fill", 10, 20, 80, 60)
  love.graphics.rectangle("fill", 250, 50, 50, 75)
  love.graphics.rectangle("fill", 680, 35, 45, 45)
  love.graphics.rectangle("fill", 450, 255, 90, 90)
  love.graphics.rectangle("fill", 50, 350, 100, 95)
  love.graphics.rectangle("fill", 550, 450, 85, 85)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

shader_lampe = [[ 
  extern vec2 mouse;
  extern int rayon;
  extern float light;
  
  float Tween_Power(float k, float t0, float t1, float pStart, float pEnd)
  {
    float C = pEnd - pStart;
    return C * pow(t0/t1, k) + pStart;
  }
  
  vec4 effect(vec4 color, Image tex, vec2 tex_coords, vec2 screen_coords)
  {
    vec4 tex_color = Texel(tex, tex_coords);
    float dist = length(mouse - screen_coords);
    if (dist < rayon)
    {
      float alpha = Tween_Power(light, dist, rayon, 1, 0);
      color = vec4(1, 1, 1, alpha);
    }
    else
    {
      color = vec4(0, 0, 0, 0);
    }
    return tex_color * color;
  }

]]

shader_load = love.graphics.newShader(shader_lampe)

lampe = {}
lampe.r = 150
lampe.x = nil
lampe.y = nil
lampe.light = 1

function love.load()
  draw_test.Load()
  --chambre = love.graphics.newImage("chambre.jpg")
end

function love.update(dt)
  lampe.x, lampe.y = love.mouse.getPosition()
  shader_load:send("rayon", lampe.r)
  shader_load:send("mouse", {lampe.x, lampe.y})
  shader_load:send("light", lampe.light)
end

function love.draw()
  love.graphics.setShader(shader_load)
  love.graphics.draw(draw_test.img, draw_test.x, draw_test.y)
  --love.graphics.draw(chambre, 0, 0)
  love.graphics.setShader()
end

function love.keypressed(key)
  if key == "up" then
    lampe.light = lampe.light + 0.2
  end
  if key == "down" and lampe.light > 0 then
    lampe.light = lampe.light - 0.2
  end
end