/// @description Insert description here

if (global.pause) {
	exit
}

if keyboard_check_released(vk_escape) {
	global.ret=sprite_create_from_surface(application_surface,0,0,room_width,room_height,false,true,0,0)
	global.fromroom=room
	global.pause=true
	room_persistent=true
	room_goto(pauseroom)
}

// enemy boss: name, min_level, spd, scale_multiplier]
if !instance_find(obj_enemy_template,0) and !global._boss_encounter {
	// splash the message "A big fish from the deep is coming!"
	global.MessageBox(room_width/2, room_height/2, "A big fish from the deep is coming!", c_red, c_red, c_maroon, c_maroon, 48, 2.0, 0, 0.2)
	alarm[3]=game_get_speed(gamespeed_fps)*2
	global._boss_encounter=true
	audio_stop_all()
	global.level_music=audio_play_sound(snd_boss_music, 50, true)
}

if !global.room_finished and global.boss_spawned and !instance_find(global._enemy_boss[0],0) {
	
	// player killed boss
	if room != MarianaTrench {
		// splash the message "You Won! Diving deeper!"
		global.room_finished=true
		global.MessageBox(room_width/2, room_height/2, "You won! Diving deeper...", c_aqua, c_aqua, c_teal, c_teal, 64, 2.0, 0, -0.2)
		alarm[2] = 180
		//audio_stop_all()
		global.level_music=audio_play_sound(snd_boss_win_2, 50, false)
	}
}