/// @description Insert description here
// 

var _menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)

menu_index += _menu_move

if menu_index < 0
	menu_index = buttons - 1

if menu_index > buttons - 1
	menu_index = 0
	
last_selected = menu_index

// mouse related movement

var _x_in=device_mouse_x_to_gui(0)
var _y_in=device_mouse_y_to_gui(0)
var _i = 0
if (_x_in >= menu_x-button_w and _x_in <= menu_x+button_w) and
   (_y_in >= menu_y) {
	repeat (buttons) {
		if (_y_in >= menu_y + button_h * _i) and 
			_y_in <= menu_y + button_h + button_h * _i{
			menu_index = _i
		}
		_i++
	}
}

if keyboard_check_pressed(vk_enter) or (device_mouse_check_button_released(0, mb_left) and (_x_in >= menu_x-button_w and _x_in <= menu_x+button_w) and
   (_y_in >= menu_y)) {
	switch(menu_index) {
		case 0:
			show_debug_message("Play")
			room_goto_next()
			break;
		case 1:
			show_debug_message("Help")
			break;
		case 2:
			show_debug_message("Credits")
			break;
		case 3:
			show_debug_message("Quit")
			game_end()
			break;
	}
}
