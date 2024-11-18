/// @description Insert description here
// 

if (device_mouse_check_button_released(0, mb_left)) { // Android/mouse support
	var x_in=device_mouse_x_to_gui(0)
	var y_in=device_mouse_y_to_gui(0)
	if x_in < room_width/2
		pitch -= 0.1
	else
		pitch += 0.1
	
	if global.audio!=pointer_invalid {
		if audio_is_playing(global.audio)
			return
	}
	audio_stop_all()
	global.audio=audio_play_sound(sfx_damage, 10, false, 1, 0, pitch)
	show_debug_message(pitch) 
	
}
