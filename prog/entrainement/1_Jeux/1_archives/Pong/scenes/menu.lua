--[[

	Scène par défaut au lancement du jeu. PONG affiché
	en gros en haut au milieu. Un bouton pour lancer une
	partie, un autre bouton pour aller dans les options
	et un dernier bouton pour quitter le jeu. Les trois
	bouton sont affichés l'un en dessous de l'autre plutôt
	sur la moitié gauche de l'écran.
	Au niveau des boutons verticalement mais sur la droite
	de l'écran horizontalement, présence d'un cadre qui
	contiendra des informations textuelles correspondant
	au bouton sélectionné.
	
	Dans le keypressed, gérer les flèches haut et bas pour
	naviguer entre les boutons et touche entrée pour changer
	de scène.
	
	Dans l'update, détecter la collision entre le curseur de
	la souris et les boutons.
	
	Dans le mousepressed, si un clique est détecté sur un
	bouton, on change de scène.
	
	Dans le draw, on affiche le titre, les trois boutons avec
	un changement de couleur si un bouton est survolé par la
	souris ou sélectionné avec une flèche et le cadre
	d'informations.
	
]]
local option_bouton
local play_bouton
local quit_bouton
local info_texte
local info_options
local info_jeu
local info_quit

Load_Bouton_Menu_Idle()
Load_Bouton_Menu_Survole()
Load_Bouton_Menu_Clique()

menu_bouton_idle = sprite_bouton_menu_idle.img
menu_bouton_survole = sprite_bouton_menu_survole.img
menu_bouton_clique = sprite_bouton_menu_clique.img

local function On_Menu_Panel_Hover(p_state)
  if p_state == "begin" then
    if option_bouton.is_hover then
      info_options:Set_Visible(true)
    elseif play_bouton.is_hover then
      info_jeu:Set_Visible(true)
    elseif quit_bouton.is_hover then
      info_quit:Set_Visible(true)
    end
  elseif p_state == "end" then
    info_options:Set_Visible(false)
    info_jeu:Set_Visible(false)
    info_quit:Set_Visible(false)
  end
end

local function On_Menu_Button_Clicked(p_state)
  if p_state == "begin" then
    --[[if play_bouton.is_pressed then
      Game.current_state = "jeu"
    end]]
  elseif p_state == "end" then
    if option_bouton.is_hover and option_bouton.is_pressed == false then
      Game.current_state = "options_in_menu"
    elseif play_bouton.is_hover and play_bouton.is_pressed == false then
      Game.current_state = "jeu"
    elseif quit_bouton.is_hover and quit_bouton.is_pressed == false then
      love.event.quit()
    end
  end
end

local Menu = {}

info_texte = gui.New_Panel(400, 100, 200, 200, vert)

option_bouton = gui.New_Button(100, 100, 250, 50, "OPTION", font_1, bleu)
option_bouton:Set_Event("pressed", On_Menu_Button_Clicked)
option_bouton:Set_Event("hover", On_Menu_Panel_Hover)
info_options = gui.New_Text(info_texte.x, info_texte.y, info_texte.w, info_texte.h, "menu des options", font_1, "center", "center", rouge)
info_options:Set_Visible(false)

play_bouton = gui.New_Button(100, 175, 250, 50, "JOUER", font_1, jaune)
play_bouton:Set_Event("pressed", On_Menu_Button_Clicked)
play_bouton:Set_Event("hover", On_Menu_Panel_Hover)
info_jeu = gui.New_Text(info_texte.x, info_texte.y, info_texte.w, info_texte.h, "lancer une partie", font_1, "center", "center", rouge)
info_jeu:Set_Visible(false)

quit_bouton = gui.New_Button(100, 250, 250, 50, "QUITTER", font_1, vert)
quit_bouton:Set_Event("pressed", On_Menu_Button_Clicked)
quit_bouton:Set_Event("hover", On_Menu_Panel_Hover)
info_quit = gui.New_Text(info_texte.x, info_texte.y, info_texte.w, info_texte.h, "quitter le jeu", font_1, "center", "center", rouge)
info_quit:Set_Visible(false)

menu_ui = gui.New()
menu_ui:Add_Element(option_bouton)
menu_ui:Add_Element(play_bouton)
menu_ui:Add_Element(quit_bouton)
menu_ui:Add_Element(info_texte)
menu_ui:Add_Element(info_options)
menu_ui:Add_Element(info_jeu)
menu_ui:Add_Element(info_quit)

function Menu:Update(dt)
  menu_ui:Update(dt)
end

function Menu:Draw()
	love.graphics.print("current_state: "..tostring(Game.current_state), 5, 5)
  menu_ui:Draw()
end

function Menu:Keypressed(key)
  if key == "return" then
    if option_bouton.is_hover then
      Game.current_state = "options_in_menu"
    elseif play_bouton.is_hover then
      Game.current_state = "jeu"
    elseif quit_bouton.is_hover then
      love.event.quit()
    end
  end
  
  if key == "space" then
    Game.current_state = "jeu"
  elseif key == "o" then
    Game.current_state = "options_in_menu"
  elseif key == "escape" then
    love.event.quit()
  end
end

function Menu:Mousepressed(x, y, button)
  
end

return Menu