io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

utf8 = require("utf8")

iteration = {}
iteration[1] = "premier"
iteration[2] = "deuxième"
iteration[3] = "troisième"
iteration[4] = "quatrième"
-- Triggers qui permettent de vérifier le type et la valeur du nombre
-- entré dans la première partie du programme.
general_error = false
type_error = false
amount_error = false

-- Triggers qui permet vérifier le type du nombre entré à chaque itération
-- de l'étape qui consiste à entrer les nombres à additionner.

step_2_type_error = false

-- Fonction qui permet d'entrer plusieurs valeurs dans text_input.
function Enter_Something(string, t)
  string = string..t
  return string
end

-- Converti une string en nombre
function Convert_To_Number(var)
  return tonumber(var)
end

-- Renvoie true si une variable est de type numérique.
function Verify_Number(var)
  if type(var) == "number" then
    return true
  end
end

-- LOAD
function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  love.keyboard.setKeyRepeat(true)
  
  step_combien_nombre = true
  demande_nombre = "Combien voulez-vous additionner de nombres (2 à 4)?"
  input_nombre = ""
  inp_n = 0
  
  step_entrer_nombres = false
  input_i = ""
  iter = 1
  nombres_stockes = {}
  
  step_add = false
end

-- UPDATE
function love.update(dt)
  for i=1,#nombres_stockes do
    --print(#nombres_stockes, nombres_stockes[i])
  end
end

-- DRAW
function love.draw()
  if step_combien_nombre then
    if general_error == false then
      love.graphics.print(demande_nombre, 5, 5)
      love.graphics.print(input_nombre, 350, 5)
    else
      if type_error then
        love.graphics.print("Erreur. Veuillez entrer un nombre valide (2 à 4): ", 5, 5)
        love.graphics.print(input_nombre, 350, 5)
      elseif amount_error then
        love.graphics.print("Erreur. Veuillez entrer un nombre compris entre 2 et 4: ", 5, 5)
        love.graphics.print(input_nombre, 350, 5)
      end
    end
  elseif step_entrer_nombres then
    love.graphics.print("iter: "..tostring(iter), 700, 5)
    love.graphics.print("inp_n: "..tostring(inp_n), 700, 5+16)
    love.graphics.print(tostring(#nombres_stockes), 700, 5+16*2)
    
    if inp_n == 2 then
      if iter == 1 then
        love.graphics.print("Entrez votre premier nombre: "..tostring(input_i), 5, 5)
      elseif iter == 2 then
        love.graphics.print("Entrez votre premier nombre: "..tostring(nombres_stockes[1]), 5, 5)
        love.graphics.print("Entrez votre deuxième nombre: "..tostring(input_i), 5, 5+16)
      elseif iter > 2 then
        love.graphics.print("Entrez votre premier nombre: "..tostring(nombres_stockes[1]), 5, 5)
        love.graphics.print("Entrez votre deuxième nombre: "..tostring(nombres_stockes[2]), 5, 5+16)
      end    
    elseif inp_n == 3 then
      if iter == 1 then
        love.graphics.print("Entrez votre premier nombre: "..tostring(input_i), 5, 5)
      elseif iter == 2 then
        love.graphics.print("Entrez votre premier nombre: "..tostring(nombres_stockes[1]), 5, 5)
        love.graphics.print("Entrez votre deuxième nombre: "..tostring(input_i), 5, 5+16)
      elseif iter == 3 then
        love.graphics.print("Entrez votre premier nombre: "..tostring(nombres_stockes[1]), 5, 5)
        love.graphics.print("Entrez votre deuxième nombre: "..tostring(nombres_stockes[2]), 5, 5+16)
        love.graphics.print("Entrez votre troisième nombre: "..tostring(input_i), 5, 5+16*2)
      elseif iter > 3 then
        love.graphics.print("Entrez votre premier nombre: "..tostring(nombres_stockes[1]), 5, 5)
        love.graphics.print("Entrez votre deuxième nombre: "..tostring(nombres_stockes[2]), 5, 5+16)
        love.graphics.print("Entrez votre troisième nombre: "..tostring(nombres_stockes[3]), 5, 5+16*2)
      end
    elseif inp_n == 4 then
      if iter == 1 then
        love.graphics.print("Entrez votre premier nombre: "..tostring(input_i), 5, 5)
      elseif iter == 2 then
        love.graphics.print("Entrez votre premier nombre: "..tostring(nombres_stockes[1]), 5, 5)
        love.graphics.print("Entrez votre deuxième nombre: "..tostring(input_i), 5, 5+16)
      elseif iter == 3 then
        love.graphics.print("Entrez votre premier nombre: "..tostring(nombres_stockes[1]), 5, 5)
        love.graphics.print("Entrez votre deuxième nombre: "..tostring(nombres_stockes[2]), 5, 5+16)
        love.graphics.print("Entrez votre troisième nombre: "..tostring(input_i), 5, 5+16*2)
      elseif iter == 4 then
        love.graphics.print("Entrez votre premier nombre: "..tostring(nombres_stockes[1]), 5, 5)
        love.graphics.print("Entrez votre deuxième nombre: "..tostring(nombres_stockes[2]), 5, 5+16)
        love.graphics.print("Entrez votre troisième nombre: "..tostring(nombres_stockes[3]), 5, 5+16*2)
        love.graphics.print("Entrez votre quatrième nombre: "..tostring(input_i), 5, 5+16*3)
      elseif iter > 4 then
        love.graphics.print("Entrez votre premier nombre: "..tostring(nombres_stockes[1]), 5, 5)
        love.graphics.print("Entrez votre deuxième nombre: "..tostring(nombres_stockes[2]), 5, 5+16)
        love.graphics.print("Entrez votre troisième nombre: "..tostring(nombres_stockes[3]), 5, 5+16*2)
        love.graphics.print("Entrez votre quatrième nombre: "..tostring(nombres_stockes[4]), 5, 5+16*3)
      end
    end
  elseif step_add then
    love.graphics.print("add bite mdr", 5, 5)
  end
end

-- TEXT INPUT
function love.textinput(t)
  if step_combien_nombre then
    input_nombre = Enter_Something(input_nombre, t)
  elseif step_entrer_nombres then
    --if iter == 1 then
      input_i = Enter_Something(input_i, t)
    --end
  end
end

-- KEYRPESSED
function love.keypressed(key)
  if key == "return" or key == "kpenter" then
    if step_combien_nombre then
      inp_n = Convert_To_Number(input_nombre)
      v = Verify_Number(inp_n)
      if v then
        if inp_n < 2 or inp_n > 4 then
          general_error = true
          type_error = false
          amount_error = true
          input_nombre = ""
          step_combien_nombre = true
          else
            step_combien_nombre = false
            step_entrer_nombres = true
          end
      else
        general_error = true
        type_error = true
        amount_error = false
        input_nombre = ""
        step_combien_nombre = true
      end
    elseif step_entrer_nombres then
      current = Convert_To_Number(input_i)
      v2 = Verify_Number(current)
      if v2 then
        table.insert(nombres_stockes, current)
        if iter >= inp_n then
          --step_entrer_nombres = false
          --step_add = true
        end
        iter = iter+1
        input_i = ""
      end
    end
  end
  
  --[[if key == "backspace" then
    local byteoffset = utf8.offset(text, -1)
    if byteoffset then
      text = string.sub(text, 1, byteoffset - 1)
    end
  end]]
end

-- MOUSSEPRESSED
function love.mousepressed(x, y, button)
  
end