menu_button_size = {}
menu_button_size.w = 140
menu_button_size.h = 50
menu_button_size.space = 25

menu_to_options_button = {}
menu_to_options_button.x = 50
menu_to_options_button.y = 250
menu_to_options_button.cursor_on = false

menu_to_game_button = {}
menu_to_game_button.x = 50
menu_to_game_button.y = menu_to_options_button.y+menu_button_size.h+menu_button_size.space
menu_to_game_button.cursor_on = false

menu_to_quit_button = {}
menu_to_quit_button.x = 50
menu_to_quit_button.y = menu_to_game_button.y+menu_button_size.h+menu_button_size.space
menu_to_quit_button.cursor_on = false

function Update_Menu()
  menu_souris_x, menu_souris_y = love.mouse.getPosition()
  
  if menu_souris_x > menu_to_options_button.x and menu_souris_x < menu_to_options_button.x+menu_button_size.w and menu_souris_y > menu_to_options_button.y and menu_souris_y < menu_to_options_button.y+menu_button_size.h then
    menu_to_options_button.cursor_on = true
    menu_to_game_button.cursor_on = false
    menu_to_quit_button.cursor_on = false
  elseif menu_souris_x > menu_to_game_button.x and menu_souris_x < menu_to_game_button.x+menu_button_size.w and menu_souris_y > menu_to_game_button.y and menu_souris_y < menu_to_game_button.y+menu_button_size.h then
    menu_to_options_button.cursor_on = false
    menu_to_game_button.cursor_on = true
    menu_to_quit_button.cursor_on = false
  elseif menu_souris_x > menu_to_quit_button.x and menu_souris_x < menu_to_quit_button.x+menu_button_size.w and menu_souris_y > menu_to_quit_button.y and menu_souris_y < menu_to_quit_button.y+menu_button_size.h then
    menu_to_options_button.cursor_on = false
    menu_to_game_button.cursor_on = false
    menu_to_quit_button.cursor_on = true
  else
    menu_to_options_button.cursor_on = false
    menu_to_game_button.cursor_on = false
    menu_to_quit_button.cursor_on = false
  end
end

function Draw_Menu()
  love.graphics.print("MENU", 5, 5)
  
  love.graphics.rectangle("fill", menu_to_options_button.x, menu_to_options_button.y, menu_button_size.w, menu_button_size.h)
  love.graphics.rectangle("fill", menu_to_game_button.x, menu_to_game_button.y, menu_button_size.w, menu_button_size.h)
  love.graphics.rectangle("fill", menu_to_quit_button.x, menu_to_quit_button.y, menu_button_size.w, menu_button_size.h)
  
  if menu_to_options_button.cursor_on then
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", menu_to_options_button.x, menu_to_options_button.y, menu_button_size.w, menu_button_size.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", menu_to_game_button.x, menu_to_game_button.y, menu_button_size.w, menu_button_size.h)
    love.graphics.rectangle("fill", menu_to_quit_button.x, menu_to_quit_button.y, menu_button_size.w, menu_button_size.h)
  elseif menu_to_game_button.cursor_on then
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", menu_to_options_button.x, menu_to_options_button.y, menu_button_size.w, menu_button_size.h)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", menu_to_game_button.x, menu_to_game_button.y, menu_button_size.w, menu_button_size.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", menu_to_quit_button.x, menu_to_quit_button.y, menu_button_size.w, menu_button_size.h)
  elseif menu_to_quit_button.cursor_on then
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", menu_to_options_button.x, menu_to_options_button.y, menu_button_size.w, menu_button_size.h)
    love.graphics.rectangle("fill", menu_to_game_button.x, menu_to_game_button.y, menu_button_size.w, menu_button_size.h)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", menu_to_quit_button.x, menu_to_quit_button.y, menu_button_size.w, menu_button_size.h)
  end
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Options: touche o", menu_to_options_button.x+10, menu_to_options_button.y+16)
  love.graphics.print("Jouer: touche space", menu_to_game_button.x+10, menu_to_game_button.y+16)
  love.graphics.print("Quitter: touche esc", menu_to_quit_button.x+10, menu_to_quit_button.y+16)
  love.graphics.setColor(1, 1, 1)
end