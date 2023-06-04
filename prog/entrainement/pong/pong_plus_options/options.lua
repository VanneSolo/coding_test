local button_dimensions = {}
button_dimensions.w = 250
button_dimensions.h = 50
local button_x = 50

nb_players_button = {}
nb_players_button.x = button_x
nb_players_button.y = 158
nb_players_button.cursor_on = false

orientation_button = {}
orientation_button.x = button_x
orientation_button.y = nb_players_button.y + button_dimensions.h + 10
orientation_button.cursor_on = false

difficuty_button = {}
difficuty_button.x = button_x
difficuty_button.y = orientation_button.y + button_dimensions.h + 10
difficuty_button.cursor_on = false

sound_button = {}
sound_button.x = button_x
sound_button.y = difficuty_button.y + button_dimensions.h + 10
sound_button.cursor_on = false

music_button = {}
music_button.x = button_x
music_button.y = sound_button.y + button_dimensions.h + 10
music_button.cursor_on = false

quit_option_button = {}
quit_option_button.x = button_x
quit_option_button.y = music_button.y + button_dimensions.h + 10
quit_option_button.cursor_on = false

function Options_Button()
  local mouse_x, mouse_y = love.mouse.getPosition()
  
  if mouse_x > nb_players_button.x and mouse_x < nb_players_button.x+button_dimensions.w and mouse_y > nb_players_button.y and mouse_y < nb_players_button.y + button_dimensions.h then
    nb_players_button.cursor_on = true
    orientation_button.cursor_on = false
    difficuty_button.cursor_on = false
    sound_button.cursor_on = false
    music_button.cursor_on = false
    quit_option_button.cursor_on = false
  elseif mouse_x > orientation_button.x and mouse_x < orientation_button.x+button_dimensions.w and mouse_y > orientation_button.y and mouse_y < orientation_button.y + button_dimensions.h then
    nb_players_button.cursor_on = false
    orientation_button.cursor_on = true
    difficuty_button.cursor_on = false
    sound_button.cursor_on = false
    music_button.cursor_on = false
    quit_option_button.cursor_on = false
  elseif mouse_x > difficuty_button.x and mouse_x < difficuty_button.x+button_dimensions.w and mouse_y > difficuty_button.y and mouse_y < difficuty_button.y + button_dimensions.h then
    nb_players_button.cursor_on = false
    orientation_button.cursor_on = false
    difficuty_button.cursor_on = true
    sound_button.cursor_on = false
    music_button.cursor_on = false
    quit_option_button.cursor_on = false
  elseif mouse_x > sound_button.x and mouse_x < sound_button.x+button_dimensions.w and mouse_y > sound_button.y and mouse_y < sound_button.y + button_dimensions.h then
    nb_players_button.cursor_on = false
    orientation_button.cursor_on = false
    difficuty_button.cursor_on = false
    sound_button.cursor_on = true
    music_button.cursor_on = false
    quit_option_button.cursor_on = false
  elseif mouse_x > music_button.x and mouse_x < music_button.x+button_dimensions.w and mouse_y > music_button.y and mouse_y < music_button.y + button_dimensions.h then
    nb_players_button.cursor_on = false
    orientation_button.cursor_on = false
    difficuty_button.cursor_on = false
    sound_button.cursor_on = false
    music_button.cursor_on = true
    quit_option_button.cursor_on = false
  elseif mouse_x > quit_option_button.x and mouse_x < quit_option_button.x+button_dimensions.w and mouse_y > quit_option_button.y and mouse_y < quit_option_button.y + button_dimensions.h then
    nb_players_button.cursor_on = false
    orientation_button.cursor_on = false
    difficuty_button.cursor_on = false
    sound_button.cursor_on = false
    music_button.cursor_on = false
    quit_option_button.cursor_on = true
  else
    nb_players_button.cursor_on = false
    orientation_button.cursor_on = false
    difficuty_button.cursor_on = false
    sound_button.cursor_on = false
    music_button.cursor_on = false
    quit_option_button.cursor_on = false
  end
  
end

function Draw_Options()
  love.graphics.print("Bienvenue dans les options", 50, 40)
  love.graphics.print("Choisissez ce que vous voulez faire:", 50, 120)
  
  love.graphics.rectangle("fill", nb_players_button.x, nb_players_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
  love.graphics.rectangle("fill", nb_players_button.x+button_dimensions.w+25, nb_players_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", nb_players_button.x+button_dimensions.w+85, nb_players_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", orientation_button.x, orientation_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
  love.graphics.rectangle("fill", orientation_button.x+button_dimensions.w+25, orientation_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", orientation_button.x+button_dimensions.w+85, orientation_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", difficuty_button.x, difficuty_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
  love.graphics.rectangle("fill", difficuty_button.x+button_dimensions.w+25, difficuty_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", difficuty_button.x+button_dimensions.w+85, difficuty_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", difficuty_button.x+button_dimensions.w+145, difficuty_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", sound_button.x, sound_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
  love.graphics.rectangle("fill", sound_button.x+button_dimensions.w+25, sound_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", sound_button.x+button_dimensions.w+85, sound_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", sound_button.x+button_dimensions.w+145, sound_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", sound_button.x+button_dimensions.w+205, sound_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", music_button.x, music_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
  love.graphics.rectangle("fill", music_button.x+button_dimensions.w+25, music_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", music_button.x+button_dimensions.w+85, music_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", music_button.x+button_dimensions.w+145, music_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", music_button.x+button_dimensions.w+205, music_button.y, 50, 50, 5, 5, 5)
  love.graphics.rectangle("fill", quit_option_button.x, quit_option_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
  
  if nb_players_button.cursor_on then
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", nb_players_button.x, nb_players_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
    love.graphics.rectangle("fill", nb_players_button.x+button_dimensions.w+25, nb_players_button.y, 50, 50, 5, 5, 5)
    love.graphics.rectangle("fill", nb_players_button.x+button_dimensions.w+85, nb_players_button.y, 50, 50, 5, 5, 5)
  elseif orientation_button.cursor_on then
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", orientation_button.x, orientation_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
    love.graphics.rectangle("fill", orientation_button.x+button_dimensions.w+25, orientation_button.y, 50, 50, 5, 5, 5)
    love.graphics.rectangle("fill", orientation_button.x+button_dimensions.w+85, orientation_button.y, 50, 50, 5, 5, 5)
  elseif difficuty_button.cursor_on then
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", difficuty_button.x, difficuty_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
    love.graphics.rectangle("fill", difficuty_button.x+button_dimensions.w+25, difficuty_button.y, 50, 50, 5, 5, 5)
    love.graphics.rectangle("fill", difficuty_button.x+button_dimensions.w+85, difficuty_button.y, 50, 50, 5, 5, 5)
    love.graphics.rectangle("fill", difficuty_button.x+button_dimensions.w+145, difficuty_button.y, 50, 50, 5, 5, 5)
  elseif sound_button.cursor_on then
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", sound_button.x, sound_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
    love.graphics.rectangle("fill", sound_button.x+button_dimensions.w+25, sound_button.y, 50, 50, 5, 5, 5)
    love.graphics.rectangle("fill", sound_button.x+button_dimensions.w+85, sound_button.y, 50, 50, 5, 5, 5)
    love.graphics.rectangle("fill", sound_button.x+button_dimensions.w+145, sound_button.y, 50, 50, 5, 5, 5)
    love.graphics.rectangle("fill", sound_button.x+button_dimensions.w+205, sound_button.y, 50, 50, 5, 5, 5)
  elseif music_button.cursor_on then
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", music_button.x, music_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
    love.graphics.rectangle("fill", music_button.x+button_dimensions.w+25, music_button.y, 50, 50, 5, 5, 5)
    love.graphics.rectangle("fill", music_button.x+button_dimensions.w+85, music_button.y, 50, 50, 5, 5, 5)
    love.graphics.rectangle("fill", music_button.x+button_dimensions.w+145, music_button.y, 50, 50, 5, 5, 5)
    love.graphics.rectangle("fill", music_button.x+button_dimensions.w+205, music_button.y, 50, 50, 5, 5, 5)
  elseif quit_option_button.cursor_on then
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", quit_option_button.x, quit_option_button.y, button_dimensions.w, button_dimensions.h, 5, 5, 5)
  end
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Nombre de joueurs: ", 72, nb_players_button.y+16)
  love.graphics.print("Orientation de la zone de jeu: ", 72, orientation_button.y+16)
  love.graphics.print("Niveau de difficulté: ", 72, difficuty_button.y+16)
  love.graphics.print("Volume des effets sonores: ", 72, sound_button.y+16)
  love.graphics.print("Volume de la musique: ", 72, music_button.y+16)
  love.graphics.print("Quitter les options (Q)", 72, quit_option_button.y+16)
  love.graphics.setColor(1, 1, 1)
end