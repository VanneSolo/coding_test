io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

utf_8 = require("utf8")

function love.load()
  texte = ""
  message = ""
  input_pseudo = false
end

function love.update(dt)
  
end

function love.draw()
  if input_pseudo then
    love.graphics.print("Entrez votre pseudo > "..texte, 10, 10)
    love.graphics.print(message, 10, 25)
  end
end

function love.keypressed(key)
  if key == "backspace" then
    message = ""
    local p = utf_8.offset(texte, -1)
    if p then
      texte = string.sub(texte, 1, p-1)
    end
  end
  if key == "return" and input_pseudo then
    if string.len(texte) >= 5 then
      if string.len(texte) <=10 then
        print("Le pseudo est: "..texte)
        input_pseudo = false
      else
      message = "Le pesudo est trop long"
      end
    else
      message = "Pas assez de caractères."
    end
  end
end

function love.textinput(t)
  if input_pseudo == false then
    return
  end
  texte = texte..t
  --message = ""
end

function love.mousepressed(x, y, button)
  if button == 1 then
    Ajoute_Pseudo()
    message = ""
  end
end

function Ajoute_Pseudo()
  texte = ""
  message = ""
  input_pseudo = true
end