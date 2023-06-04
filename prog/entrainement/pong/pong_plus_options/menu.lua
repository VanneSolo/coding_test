local button_dimensions = {}
button_dimensions.w = 250
button_dimensions.h = 60

but_dec_hor = 22
but_dec_vert = 22

game_button = {}
game_button.x = 50
game_button.y = 250
on_game_button = false

options_button = {}
options_button.x = 50
options_button.y = game_button.y + button_dimensions.h + 50
on_options_button = false

quit_button = {}
quit_button.x = 50
quit_button.y = options_button.y + button_dimensions.h + 50
on_quit_button = false

info_display = {}
info_display.w = 350
info_display.h = 200
info_display.x = 400
info_display.y = 250

function On_Menu_Button()
  local mouse_x, mouse_y = love.mouse.getPosition()
  if mouse_x > game_button.x and mouse_x < game_button.x+button_dimensions.w and mouse_y > game_button.y and mouse_y < game_button.y+button_dimensions.h then
    on_game_button = true
    on_options_button = false
    on_quit_button = false
  elseif mouse_x > options_button.x and mouse_x < options_button.x+button_dimensions.w and mouse_y > options_button.y and mouse_y < options_button.y+button_dimensions.h then
    on_game_button = false
    on_options_button = true
    on_quit_button = false
  elseif mouse_x > quit_button.x and mouse_x < quit_button.x+button_dimensions.w and mouse_y > quit_button.y and mouse_y < quit_button.y+button_dimensions.h then
    on_game_button = false
    on_options_button = false
    on_quit_button = true
  else
    on_game_button = false
    on_options_button = false
    on_quit_button = false
  end
end

function Draw_Menu()
  love.graphics.print("Bienvenue dans le menu de mon pong!", 50, 40)
  love.graphics.print("Choisissez ce que vous voulez faire:", 50, 170)
  
  love.graphics.rectangle("fill", game_button.x, game_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
  love.graphics.rectangle("fill", options_button.x, options_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
  love.graphics.rectangle("fill", quit_button.x, quit_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
  
  love.graphics.rectangle("fill", info_display.x, info_display.y, info_display.w, info_display.h, 5, 5, 5)
  
  if on_game_button then
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", game_button.x, game_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Lance une nouvelle partie.", info_display.x + but_dec_hor, info_display.y + but_dec_vert)
  elseif on_options_button then
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", options_button.x, options_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Permet de modifier différents réglages, comme la", info_display.x + but_dec_hor, info_display.y + but_dec_vert)
    love.graphics.print("difficulté ou le nombre de joueurs.", info_display.x + but_dec_hor, info_display.y + but_dec_vert + 18)
  elseif on_quit_button then
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", quit_button.x, quit_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Quitte le jeu et revient au bureau.", info_display.x + but_dec_hor, info_display.y + but_dec_vert)
  end
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("JOUER (N)", game_button.x + but_dec_hor, game_button.y + but_dec_vert)
  love.graphics.print("OPTIONS (O)", options_button.x + but_dec_hor, options_button.y + but_dec_vert)
  love.graphics.print("QUITTER (Q)", quit_button.x + but_dec_hor, quit_button.y + but_dec_vert)
  
  love.graphics.setColor(1, 1, 1)
end