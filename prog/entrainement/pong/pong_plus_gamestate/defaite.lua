largeur = love.graphics.getWidth()
hauteur = love.graphics.getHeight()

local button_dimensions = {}
button_dimensions.w = 400
button_dimensions.h = 75

new_button = {}
new_button.x = largeur/2-button_dimensions.w/2
new_button.y = 300
on_n_d_button = false

menu_button = {}
menu_button.x = largeur/2-button_dimensions.w/2
menu_button.y = new_button.y+button_dimensions.h+50
on_m_d_button = false

function On_Local_Button_D()
  local souris_x, souris_y = love.mouse.getPosition()
  if souris_x > new_button.x and souris_x < new_button.x+button_dimensions.w and souris_y > new_button.y and souris_y < new_button.y+button_dimensions.h then
    on_n_d_button = true
  elseif souris_x > menu_button.x and souris_x < menu_button.x+button_dimensions.w and souris_y > menu_button.y and souris_y < menu_button.y+button_dimensions.h then
    on_m_d_button = true
  else
    on_n_d_button = false
    on_m_d_button = false
  end
end

function Draw_Defaite()
  love.graphics.print("Vous avez perdu!", 10, 10)
  love.graphics.print("Appuyez sur M pour retourner au menu, ou sur N pour une nouvelle partie.",10, 10+16)
  
  love.graphics.rectangle("fill", new_button.x, new_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
  love.graphics.rectangle("fill", menu_button.x, menu_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
  
  if on_n_d_button then
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", new_button.x, new_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
  elseif on_m_d_button then
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", menu_button.x, menu_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
  end
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("NOUVELLE PARTIE (N)", new_button.x + 10, new_button.y + 10)
  love.graphics.print("RETOUR AU MENU (M)", menu_button.x + 10, menu_button.y + 10)
  love.graphics.setColor(1, 1, 1)
end