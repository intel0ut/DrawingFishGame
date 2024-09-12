/// @description move and collide player, flip sprite depending on direction
var _xinput = 0
var _yinput = 0

if (device_mouse_check_button(0, mb_left)) { // Android.mouse support
	var x_in=device_mouse_x_to_gui(0)
	var y_in=device_mouse_y_to_gui(0)
	
	// check X coords 
	if x_in > x + 5
		_xinput = 1
	else  if x_in < x - 5
	    _xinput = -1
	
	// check Y coords 
	if y_in > y + 5 
		_yinput = 1 
	else if  y_in < y - 5
		_yinput = -1
		
} else {  // Windows keyboard support
	_xinput = keyboard_check(vk_right) - keyboard_check(vk_left);
	_yinput = keyboard_check(vk_down) - keyboard_check(vk_up);
}

// scale player sprite in Y
image_yscale=1/player_size

// scale and flip player sprite in X
if _xinput <> 0 {
	image_xscale*=-_xinput
	_last=-_xinput // keep player direction
}
	
image_xscale=_last/player_size

move_and_collide(_xinput * player_speed, _yinput * player_speed, obj_wall, 4, 0, 0, player_speed, player_speed)


