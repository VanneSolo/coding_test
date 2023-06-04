io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  font_normal = love.graphics.getFont()
  font_game = love.graphics.newFont("Alien Remix.ttf", 16)
  
  liste_pop_score = {}
  liste_particules = {}
  
  pop_lifetime = 1
  explosion_lifetime = 1
end

function love.update(dt)
  Update_Pop_Score(dt)
  Update_Particules(dt)
end

function love.draw()
  love.graphics.setFont(font_game)
  Affiche_Pop_Score()
  Affiche_Particules()
  --love.graphics.setFont(font_normal)
end

function love.keypressed(key)
  
end

function love.mousepressed(x, y)
  Ajoute_Pop_Score(1000, x, y-30)
  for i=1,50 do
    Ajoute_Particule(x, y, 3)
  end
end

function Init_Game()
  liste_pop_score = {}
end

function Ajoute_Pop_Score(pScore, pX, pY)
  local score = {}
  score.valeur = pScore
  local largeur_text = font_game:getWidth(tostring(score.valeur))
  score.x = pX - (largeur_text/2)
  score.y = pY
  score.lifetime = 0
  table.insert(liste_pop_score, score)
end

function Update_Pop_Score(dt)
  for i=#liste_pop_score,1,-1 do
    local pop = liste_pop_score[i]
    pop.y = pop.y - 1
    pop.lifetime = pop.lifetime + dt
    if pop.lifetime > pop_lifetime then
      table.remove(liste_pop_score, i)
    end
  end
end

function Affiche_Pop_Score()
  for i=1,#liste_pop_score do
    local pop = liste_pop_score[i]
    local alpha = 1 - (pop.lifetime/pop_lifetime)
    love.graphics.setColor(1, 1, 1, alpha)
    love.graphics.print(pop.valeur, pop.x, pop.y)
    love.graphics.setColor(1, 1, 1, 1)
  end
end

function Ajoute_Particule(pX, pY, pR)
  local particule = {}
  particule.x = pX
  particule.y = pY
  particule.r = pR
  particule.lifetime = 0
  particule.vx = love.math.random(-100, 100)
  particule.vy = love.math.random(-100, 100)
  table.insert(liste_particules, particule)
end

function Update_Particules(dt)
  for i=#liste_particules,1,-1 do
    local particule = liste_particules[i]
    particule.x = particule.x + particule.vx*dt
    particule.y = particule.y - particule.vy*dt
    particule.lifetime = particule.lifetime + dt
    if particule.lifetime > explosion_lifetime then
      table.remove(liste_particules, i)
    end
  end
end

function Affiche_Particules()
  for i=1,#liste_particules do
    local particule = liste_particules[i]
    local alpha = 1 - (particule.lifetime/explosion_lifetime)
    love.graphics.setColor(0.8, 0.2, 0, alpha)
    love.graphics.circle("fill", particule.x, particule.y, particule.r)
    love.graphics.setColor(0.8, 0.2, 0, alpha)
  end
end
