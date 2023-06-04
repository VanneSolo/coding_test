option_button_size = {}
option_button_size.w = 250
option_button_size.h = 35
option_button_size.space = 10

option_difficulty_button = {}
option_difficulty_button.x = 50
option_difficulty_button.y = 50
option_difficulty_button.cursor_on = false

option_time_or_point_victory_button = {}
option_time_or_point_victory_button.x = 50
option_time_or_point_victory_button.y = option_difficulty_button.y+option_button_size.h+option_button_size.space
option_time_or_point_victory_button.cursor_on = false

option_one_or_two_players_button = {}
option_one_or_two_players_button.x = 50
option_one_or_two_players_button.y = option_time_or_point_victory_button.y+option_button_size.h+option_button_size.space
option_one_or_two_players_button.cursor_on = false

option_horizontal_or_vertical_display_button = {}
option_horizontal_or_vertical_display_button.x = 50
option_horizontal_or_vertical_display_button.y = option_one_or_two_players_button.y+option_button_size.h+option_button_size.space
option_horizontal_or_vertical_display_button.cursor_on = false

option_left_right_button = {}
option_left_right_button.x = 50
option_left_right_button.y = option_horizontal_or_vertical_display_button.y+option_button_size.h+option_button_size.space
option_left_right_button.cursor_on = false

option_top_bottom_button = {}
option_top_bottom_button.x = 50
option_top_bottom_button.y = option_left_right_button.y+option_button_size.h+option_button_size.space
option_top_bottom_button.cursor_on = false

option_menu_sounds_voulme_button = {}
option_menu_sounds_voulme_button.x = 50
option_menu_sounds_voulme_button.y = option_top_bottom_button.y+option_button_size.h+option_button_size.space
option_menu_sounds_voulme_button.cursor_on = false

option_ball_sounds_volume_button = {}
option_ball_sounds_volume_button.x = 50
option_ball_sounds_volume_button.y = option_menu_sounds_voulme_button.y+option_button_size.h+option_button_size.space
option_ball_sounds_volume_button.cursor_on = false

option_crowd_sound_volume_button = {}
option_crowd_sound_volume_button.x = 50
option_crowd_sound_volume_button.y = option_ball_sounds_volume_button.y+option_button_size.h+option_button_size.space
option_crowd_sound_volume_button.cursor_on = false

option_music_volume_button = {}
option_music_volume_button.x = 50
option_music_volume_button.y = option_crowd_sound_volume_button.y+option_button_size.h+option_button_size.space
option_music_volume_button.cursor_on = false

option_quit_button = {}
option_quit_button.x = 50
option_quit_button.y = option_music_volume_button.y+option_button_size.h+option_button_size.space
option_quit_button.cursor_on = false

function Update_Options()
  option_souris_x, option_souris_y = love.mouse.getPosition()
  
  if option_souris_x > option_difficulty_button.x and option_souris_x < option_difficulty_button.x+option_button_size.w and option_souris_y > option_difficulty_button.y and option_souris_y < option_difficulty_button.y+option_button_size.h then
    option_difficulty_button.cursor_on = true
    option_time_or_point_victory_button.cursor_on = false
    option_one_or_two_players_button.cursor_on = false
    option_horizontal_or_vertical_display_button.cursor_on = false
    option_left_right_button.cursor_on = false
    option_top_bottom_button.cursor_on = false
    option_menu_sounds_voulme_button.cursor_on = false
    option_ball_sounds_volume_button.cursor_on = false
    option_crowd_sound_volume_button.cursor_on = false
    option_music_volume_button.cursor_on = false
    option_quit_button.cursor_on = false
  elseif option_souris_x > option_time_or_point_victory_button.x and option_souris_x < option_time_or_point_victory_button.x+option_button_size.w and option_souris_y > option_time_or_point_victory_button.y and option_souris_y < option_time_or_point_victory_button.y+option_button_size.h then
    option_difficulty_button.cursor_on = false
    option_time_or_point_victory_button.cursor_on = true
    option_one_or_two_players_button.cursor_on = false
    option_horizontal_or_vertical_display_button.cursor_on = false
    option_left_right_button.cursor_on = false
    option_top_bottom_button.cursor_on = false
    option_menu_sounds_voulme_button.cursor_on = false
    option_ball_sounds_volume_button.cursor_on = false
    option_crowd_sound_volume_button.cursor_on = false
    option_music_volume_button.cursor_on = false
    option_quit_button.cursor_on = false
  elseif option_souris_x > option_one_or_two_players_button.x and option_souris_x < option_one_or_two_players_button.x+option_button_size.w and option_souris_y > option_one_or_two_players_button.y and option_souris_y < option_one_or_two_players_button.y+option_button_size.h then
    option_difficulty_button.cursor_on = false
    option_time_or_point_victory_button.cursor_on = false
    option_one_or_two_players_button.cursor_on = true
    option_horizontal_or_vertical_display_button.cursor_on = false
    option_left_right_button.cursor_on = false
    option_top_bottom_button.cursor_on = false
    option_menu_sounds_voulme_button.cursor_on = false
    option_ball_sounds_volume_button.cursor_on = false
    option_crowd_sound_volume_button.cursor_on = false
    option_music_volume_button.cursor_on = false
    option_quit_button.cursor_on = false
  elseif option_souris_x > option_horizontal_or_vertical_display_button.x and option_souris_x < option_horizontal_or_vertical_display_button.x+option_button_size.w and option_souris_y > option_horizontal_or_vertical_display_button.y and option_souris_y < option_horizontal_or_vertical_display_button.y+option_button_size.h then
    option_difficulty_button.cursor_on = false
    option_time_or_point_victory_button.cursor_on = false
    option_one_or_two_players_button.cursor_on = false
    option_horizontal_or_vertical_display_button.cursor_on = true
    option_left_right_button.cursor_on = false
    option_top_bottom_button.cursor_on = false
    option_menu_sounds_voulme_button.cursor_on = false
    option_ball_sounds_volume_button.cursor_on = false
    option_crowd_sound_volume_button.cursor_on = false
    option_music_volume_button.cursor_on = false
    option_quit_button.cursor_on = false
  elseif option_souris_x > option_left_right_button.x and option_souris_x < option_left_right_button.x+option_button_size.w and option_souris_y > option_left_right_button.y and option_souris_y < option_left_right_button.y+option_button_size.h then
    option_difficulty_button.cursor_on = false
    option_time_or_point_victory_button.cursor_on = false
    option_one_or_two_players_button.cursor_on = false
    option_horizontal_or_vertical_display_button.cursor_on = false
    option_left_right_button.cursor_on = true
    option_top_bottom_button.cursor_on = false
    option_menu_sounds_voulme_button.cursor_on = false
    option_ball_sounds_volume_button.cursor_on = false
    option_crowd_sound_volume_button.cursor_on = false
    option_music_volume_button.cursor_on = false
    option_quit_button.cursor_on = false
  elseif option_souris_x > option_top_bottom_button.x and option_souris_x < option_top_bottom_button.x+option_button_size.w and option_souris_y > option_top_bottom_button.y and option_souris_y < option_top_bottom_button.y+option_button_size.h then
    option_difficulty_button.cursor_on = false
    option_time_or_point_victory_button.cursor_on = false
    option_one_or_two_players_button.cursor_on = false
    option_horizontal_or_vertical_display_button.cursor_on = false
    option_left_right_button.cursor_on = false
    option_top_bottom_button.cursor_on = true
    option_menu_sounds_voulme_button.cursor_on = false
    option_ball_sounds_volume_button.cursor_on = false
    option_crowd_sound_volume_button.cursor_on = false
    option_music_volume_button.cursor_on = false
    option_quit_button.cursor_on = false
  elseif option_souris_x > option_menu_sounds_voulme_button.x and option_souris_x < option_menu_sounds_voulme_button.x+option_button_size.w and option_souris_y > option_menu_sounds_voulme_button.y and option_souris_y < option_menu_sounds_voulme_button.y+option_button_size.h then
    option_difficulty_button.cursor_on = false
    option_time_or_point_victory_button.cursor_on = false
    option_one_or_two_players_button.cursor_on = false
    option_horizontal_or_vertical_display_button.cursor_on = false
    option_left_right_button.cursor_on = false
    option_top_bottom_button.cursor_on = false
    option_menu_sounds_voulme_button.cursor_on = true
    option_ball_sounds_volume_button.cursor_on = false
    option_crowd_sound_volume_button.cursor_on = false
    option_music_volume_button.cursor_on = false
    option_quit_button.cursor_on = false
  elseif option_souris_x > option_ball_sounds_volume_button.x and option_souris_x < option_ball_sounds_volume_button.x+option_button_size.w and option_souris_y > option_ball_sounds_volume_button.y and option_souris_y < option_ball_sounds_volume_button.y+option_button_size.h then
    option_difficulty_button.cursor_on = false
    option_time_or_point_victory_button.cursor_on = false
    option_one_or_two_players_button.cursor_on = false
    option_horizontal_or_vertical_display_button.cursor_on = false
    option_left_right_button.cursor_on = false
    option_top_bottom_button.cursor_on = false
    option_menu_sounds_voulme_button.cursor_on = false
    option_ball_sounds_volume_button.cursor_on = true
    option_crowd_sound_volume_button.cursor_on = false
    option_music_volume_button.cursor_on = false
    option_quit_button.cursor_on = false
  elseif option_souris_x > option_crowd_sound_volume_button.x and option_souris_x < option_crowd_sound_volume_button.x+option_button_size.w and option_souris_y > option_crowd_sound_volume_button.y and option_souris_y < option_crowd_sound_volume_button.y+option_button_size.h then
    option_difficulty_button.cursor_on = false
    option_time_or_point_victory_button.cursor_on = false
    option_one_or_two_players_button.cursor_on = false
    option_horizontal_or_vertical_display_button.cursor_on = false
    option_left_right_button.cursor_on = false
    option_top_bottom_button.cursor_on = false
    option_menu_sounds_voulme_button.cursor_on = false
    option_ball_sounds_volume_button.cursor_on = false
    option_crowd_sound_volume_button.cursor_on = true
    option_music_volume_button.cursor_on = false
    option_quit_button.cursor_on = false
  elseif option_souris_x > option_music_volume_button.x and option_souris_x < option_music_volume_button.x+option_button_size.w and option_souris_y > option_music_volume_button.y and option_souris_y < option_music_volume_button.y+option_button_size.h then
    option_difficulty_button.cursor_on = false
    option_time_or_point_victory_button.cursor_on = false
    option_one_or_two_players_button.cursor_on = false
    option_horizontal_or_vertical_display_button.cursor_on = false
    option_left_right_button.cursor_on = false
    option_top_bottom_button.cursor_on = false
    option_menu_sounds_voulme_button.cursor_on = false
    option_ball_sounds_volume_button.cursor_on = false
    option_crowd_sound_volume_button.cursor_on = false
    option_music_volume_button.cursor_on = true
    option_quit_button.cursor_on = false
  elseif option_souris_x > option_quit_button.x and option_souris_x < option_quit_button.x+option_button_size.w and option_souris_y > option_quit_button.y and option_souris_y < option_quit_button.y+option_button_size.h then
    option_difficulty_button.cursor_on = false
    option_time_or_point_victory_button.cursor_on = false
    option_one_or_two_players_button.cursor_on = false
    option_horizontal_or_vertical_display_button.cursor_on = false
    option_left_right_button.cursor_on = false
    option_top_bottom_button.cursor_on = false
    option_menu_sounds_voulme_button.cursor_on = false
    option_ball_sounds_volume_button.cursor_on = false
    option_crowd_sound_volume_button.cursor_on = false
    option_music_volume_button.cursor_on = false
    option_quit_button.cursor_on = true
  else
    option_difficulty_button.cursor_on = false
    option_time_or_point_victory_button.cursor_on = false
    option_one_or_two_players_button.cursor_on = false
    option_horizontal_or_vertical_display_button.cursor_on = false
    option_left_right_button.cursor_on = false
    option_top_bottom_button.cursor_on = false
    option_menu_sounds_voulme_button.cursor_on = false
    option_ball_sounds_volume_button.cursor_on = false
    option_crowd_sound_volume_button.cursor_on = false
    option_music_volume_button.cursor_on = false
    option_quit_button.cursor_on = false
  end
end

function Draw_Options()
  love.graphics.rectangle("fill", option_difficulty_button.x, option_difficulty_button.y, option_button_size.w, option_button_size.h)
  love.graphics.rectangle("fill", option_time_or_point_victory_button.x, option_time_or_point_victory_button.y, option_button_size.w, option_button_size.h)
  love.graphics.rectangle("fill", option_one_or_two_players_button.x, option_one_or_two_players_button.y, option_button_size.w, option_button_size.h)
  love.graphics.rectangle("fill", option_horizontal_or_vertical_display_button.x, option_horizontal_or_vertical_display_button.y, option_button_size.w, option_button_size.h)
  love.graphics.rectangle("fill", option_left_right_button.x, option_left_right_button.y, option_button_size.w, option_button_size.h)
  love.graphics.rectangle("fill", option_top_bottom_button.x, option_top_bottom_button.y, option_button_size.w, option_button_size.h)
  love.graphics.rectangle("fill", option_menu_sounds_voulme_button.x, option_menu_sounds_voulme_button.y, option_button_size.w, option_button_size.h)
  love.graphics.rectangle("fill", option_ball_sounds_volume_button.x, option_ball_sounds_volume_button.y, option_button_size.w, option_button_size.h)
  love.graphics.rectangle("fill", option_crowd_sound_volume_button.x, option_crowd_sound_volume_button.y, option_button_size.w, option_button_size.h)
  love.graphics.rectangle("fill", option_music_volume_button.x, option_music_volume_button.y, option_button_size.w, option_button_size.h)
  love.graphics.rectangle("fill", option_quit_button.x, option_quit_button.y, option_button_size.w, option_button_size.h)
  
  if option_difficulty_button.cursor_on then
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", option_difficulty_button.x, option_difficulty_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", option_time_or_point_victory_button.x, option_time_or_point_victory_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_one_or_two_players_button.x, option_one_or_two_players_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_horizontal_or_vertical_display_button.x, option_horizontal_or_vertical_display_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_left_right_button.x, option_left_right_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_top_bottom_button.x, option_top_bottom_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_menu_sounds_voulme_button.x, option_menu_sounds_voulme_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_ball_sounds_volume_button.x, option_ball_sounds_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_crowd_sound_volume_button.x, option_crowd_sound_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_music_volume_button.x, option_music_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_quit_button.x, option_quit_button.y, option_button_size.w, option_button_size.h)
  elseif option_time_or_point_victory_button.cursor_on then
    love.graphics.rectangle("fill", option_difficulty_button.x, option_difficulty_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", option_time_or_point_victory_button.x, option_time_or_point_victory_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", option_one_or_two_players_button.x, option_one_or_two_players_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_horizontal_or_vertical_display_button.x, option_horizontal_or_vertical_display_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_left_right_button.x, option_left_right_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_top_bottom_button.x, option_top_bottom_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_menu_sounds_voulme_button.x, option_menu_sounds_voulme_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_ball_sounds_volume_button.x, option_ball_sounds_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_crowd_sound_volume_button.x, option_crowd_sound_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_music_volume_button.x, option_music_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_quit_button.x, option_quit_button.y, option_button_size.w, option_button_size.h)
  elseif option_one_or_two_players_button.cursor_on then
    love.graphics.rectangle("fill", option_difficulty_button.x, option_difficulty_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_time_or_point_victory_button.x, option_time_or_point_victory_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", option_one_or_two_players_button.x, option_one_or_two_players_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", option_horizontal_or_vertical_display_button.x, option_horizontal_or_vertical_display_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_left_right_button.x, option_left_right_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_top_bottom_button.x, option_top_bottom_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_menu_sounds_voulme_button.x, option_menu_sounds_voulme_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_ball_sounds_volume_button.x, option_ball_sounds_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_crowd_sound_volume_button.x, option_crowd_sound_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_music_volume_button.x, option_music_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_quit_button.x, option_quit_button.y, option_button_size.w, option_button_size.h)
  elseif option_horizontal_or_vertical_display_button.cursor_on then
    love.graphics.rectangle("fill", option_difficulty_button.x, option_difficulty_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_time_or_point_victory_button.x, option_time_or_point_victory_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_one_or_two_players_button.x, option_one_or_two_players_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", option_horizontal_or_vertical_display_button.x, option_horizontal_or_vertical_display_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", option_left_right_button.x, option_left_right_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_top_bottom_button.x, option_top_bottom_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_menu_sounds_voulme_button.x, option_menu_sounds_voulme_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_ball_sounds_volume_button.x, option_ball_sounds_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_crowd_sound_volume_button.x, option_crowd_sound_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_music_volume_button.x, option_music_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_quit_button.x, option_quit_button.y, option_button_size.w, option_button_size.h)
  elseif option_left_right_button.cursor_on then
    love.graphics.rectangle("fill", option_difficulty_button.x, option_difficulty_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_time_or_point_victory_button.x, option_time_or_point_victory_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_one_or_two_players_button.x, option_one_or_two_players_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_horizontal_or_vertical_display_button.x, option_horizontal_or_vertical_display_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", option_left_right_button.x, option_left_right_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", option_top_bottom_button.x, option_top_bottom_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_menu_sounds_voulme_button.x, option_menu_sounds_voulme_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_ball_sounds_volume_button.x, option_ball_sounds_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_crowd_sound_volume_button.x, option_crowd_sound_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_music_volume_button.x, option_music_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_quit_button.x, option_quit_button.y, option_button_size.w, option_button_size.h)
  elseif option_top_bottom_button.cursor_on then
    love.graphics.rectangle("fill", option_difficulty_button.x, option_difficulty_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_time_or_point_victory_button.x, option_time_or_point_victory_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_one_or_two_players_button.x, option_one_or_two_players_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_horizontal_or_vertical_display_button.x, option_horizontal_or_vertical_display_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_left_right_button.x, option_left_right_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", option_top_bottom_button.x, option_top_bottom_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", option_menu_sounds_voulme_button.x, option_menu_sounds_voulme_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_ball_sounds_volume_button.x, option_ball_sounds_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_crowd_sound_volume_button.x, option_crowd_sound_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_music_volume_button.x, option_music_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_quit_button.x, option_quit_button.y, option_button_size.w, option_button_size.h)
  elseif option_menu_sounds_voulme_button.cursor_on then
    love.graphics.rectangle("fill", option_difficulty_button.x, option_difficulty_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_time_or_point_victory_button.x, option_time_or_point_victory_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_one_or_two_players_button.x, option_one_or_two_players_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_horizontal_or_vertical_display_button.x, option_horizontal_or_vertical_display_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_left_right_button.x, option_left_right_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_top_bottom_button.x, option_top_bottom_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", option_menu_sounds_voulme_button.x, option_menu_sounds_voulme_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", option_ball_sounds_volume_button.x, option_ball_sounds_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_crowd_sound_volume_button.x, option_crowd_sound_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_music_volume_button.x, option_music_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_quit_button.x, option_quit_button.y, option_button_size.w, option_button_size.h)
  elseif option_ball_sounds_volume_button.cursor_on then
    love.graphics.rectangle("fill", option_difficulty_button.x, option_difficulty_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_time_or_point_victory_button.x, option_time_or_point_victory_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_one_or_two_players_button.x, option_one_or_two_players_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_horizontal_or_vertical_display_button.x, option_horizontal_or_vertical_display_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_left_right_button.x, option_left_right_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_top_bottom_button.x, option_top_bottom_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_menu_sounds_voulme_button.x, option_menu_sounds_voulme_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", option_ball_sounds_volume_button.x, option_ball_sounds_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", option_crowd_sound_volume_button.x, option_crowd_sound_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_music_volume_button.x, option_music_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_quit_button.x, option_quit_button.y, option_button_size.w, option_button_size.h)
  elseif option_crowd_sound_volume_button.cursor_on then
    love.graphics.rectangle("fill", option_difficulty_button.x, option_difficulty_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_time_or_point_victory_button.x, option_time_or_point_victory_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_one_or_two_players_button.x, option_one_or_two_players_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_horizontal_or_vertical_display_button.x, option_horizontal_or_vertical_display_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_left_right_button.x, option_left_right_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_top_bottom_button.x, option_top_bottom_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_menu_sounds_voulme_button.x, option_menu_sounds_voulme_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_ball_sounds_volume_button.x, option_ball_sounds_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", option_crowd_sound_volume_button.x, option_crowd_sound_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", option_music_volume_button.x, option_music_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_quit_button.x, option_quit_button.y, option_button_size.w, option_button_size.h)
  elseif option_music_volume_button.cursor_on then
    love.graphics.rectangle("fill", option_difficulty_button.x, option_difficulty_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_time_or_point_victory_button.x, option_time_or_point_victory_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_one_or_two_players_button.x, option_one_or_two_players_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_horizontal_or_vertical_display_button.x, option_horizontal_or_vertical_display_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_left_right_button.x, option_left_right_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_top_bottom_button.x, option_top_bottom_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_menu_sounds_voulme_button.x, option_menu_sounds_voulme_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_ball_sounds_volume_button.x, option_ball_sounds_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_crowd_sound_volume_button.x, option_crowd_sound_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", option_music_volume_button.x, option_music_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", option_quit_button.x, option_quit_button.y, option_button_size.w, option_button_size.h)
  elseif option_quit_button.cursor_on then
    love.graphics.rectangle("fill", option_difficulty_button.x, option_difficulty_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_time_or_point_victory_button.x, option_time_or_point_victory_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_one_or_two_players_button.x, option_one_or_two_players_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_horizontal_or_vertical_display_button.x, option_horizontal_or_vertical_display_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_left_right_button.x, option_left_right_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_top_bottom_button.x, option_top_bottom_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_menu_sounds_voulme_button.x, option_menu_sounds_voulme_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_ball_sounds_volume_button.x, option_ball_sounds_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_crowd_sound_volume_button.x, option_crowd_sound_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.rectangle("fill", option_music_volume_button.x, option_music_volume_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", option_quit_button.x, option_quit_button.y, option_button_size.w, option_button_size.h)
    love.graphics.setColor(1, 1, 1)
  end
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Choisir la difficulté: ", option_difficulty_button.x+10, option_difficulty_button.y+10)
  love.graphics.print("Type de partie: ", option_time_or_point_victory_button.x+10, option_time_or_point_victory_button.y+10)
  love.graphics.print("Nombre de joueurs: ", option_one_or_two_players_button.x+10, option_one_or_two_players_button.y+10)
  love.graphics.print("Orientation du terrain de jeu: ", option_horizontal_or_vertical_display_button.x+10, option_horizontal_or_vertical_display_button.y+10)
  love.graphics.print("Choisir le but à défendre (horizontal): ", option_left_right_button.x+10, option_left_right_button.y+10)
  love.graphics.print("Choisir le but à défendre (vertical): ", option_top_bottom_button.x+10, option_top_bottom_button.y+10)
  love.graphics.print("Volume des effets sonores: ", option_menu_sounds_voulme_button.x+10, option_menu_sounds_voulme_button.y+10)
  love.graphics.print("Volume des sons de la balle: ", option_ball_sounds_volume_button.x+10, option_ball_sounds_volume_button.y+10)
  love.graphics.print("Volume des sons de la foule: ", option_crowd_sound_volume_button.x+10, option_crowd_sound_volume_button.y+10)
  love.graphics.print("Volume de la musique: ", option_music_volume_button.x+10, option_music_volume_button.y+10)
  love.graphics.print("Quitter les options(touche esc) ", option_quit_button.x+10, option_quit_button.y+10)
  love.graphics.setColor(1, 1, 1)
end
