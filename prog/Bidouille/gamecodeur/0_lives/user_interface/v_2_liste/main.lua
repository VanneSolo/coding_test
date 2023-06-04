io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  liste_boutton = {}
  
  Ajoute_Boutton(10, 10, 100, 30, "Boutton 1", "butt_1")
  Ajoute_Boutton(10, 50, 100, 30, "Boutton 2", "butt_2")
  Ajoute_Boutton(10, 90, 100, 30, "Boutton 3", "butt_3")
  Ajoute_Boutton(10, 130, 100, 30, "Boutton 4", "butt_4")
  Ajoute_Boutton(120, 130, 100, 30, "Boutton 5", "butt_5")
end

function love.update(dt)
  for i=1,#liste_boutton do
    x, y = love.mouse.getPosition()
    if x>liste_boutton[i].x and x<liste_boutton[i].x+liste_boutton[i].w and y>liste_boutton[i].y and y<liste_boutton[i].y+liste_boutton[i].h then
      liste_boutton[i].over = true
    else
      liste_boutton[i].over = false
    end
  end
end

function love.draw()
  for i=1,#liste_boutton do
    if liste_boutton[i].over == true then
      love.graphics.setColor(0, 1, 0)
    else
      love.graphics.setColor(1, 1, 1)
    end
    love.graphics.rectangle("line", liste_boutton[i].x, liste_boutton[i].y, liste_boutton[i].w, liste_boutton[i].h)
    love.graphics.print(liste_boutton[i].text, liste_boutton[i].text_x, liste_boutton[i].text_y)
  end
end

function love.mousepressed(x, y, button)
  for i=1,#liste_boutton do
    if x>liste_boutton[i].x and x<liste_boutton[i].x+liste_boutton[i].w and y>liste_boutton[i].y and y<liste_boutton[i].y+liste_boutton[i].h then
      print(liste_boutton[i].id)
    end
  end
end

function Ajoute_Boutton(pX, pY, pW, pH, pText, pID)
  local boutton = {}
  boutton.x = pX
  boutton.y = pY
  boutton.w = pW
  boutton.h = pH
  boutton.text = pText
  boutton.text_x = pX + (pW/4)
  boutton.text_y = pY + (pH/4)
  boutton.id = pID
  boutton.over = false
  table.insert(liste_boutton, boutton)
end