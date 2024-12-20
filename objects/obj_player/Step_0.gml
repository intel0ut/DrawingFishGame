/// @description move and collide player, flip sprite depending on direction

if (global.pause) exit;

var _xinput = 0
var _yinput = 0

// check if we're inside wall
if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_wall,false,false) {
	var _wall=instance_nearest(x,y,obj_wall)
	var _dir=point_direction(_wall.x,_wall.y,x,y)
	x+=lengthdir_x(10,-_dir)
	y+=lengthdir_y(10,_dir)	
}

if global.player_hp <=0 {
	can_take_hit=false
	global.pause=true
    global.lifes-=1
	if not audio_is_playing(snd_game_over) {
		audio_stop_all()
		global.level_music=audio_play_sound(snd_game_over, 50, true)
	}
	
    if global.lifes < 0 {
        global.MessageBox(room_width/2, room_height/2, "Game Over!", c_red, c_red, c_maroon, c_maroon, 84, 3, 0, 0)
		alarm[1]=game_get_speed(gamespeed_fps)*3
	}
    else {
		global.MessageBox(room_width/2, room_height/2, "You Died!", c_red, c_red, c_maroon, c_maroon, 84, 2, 0, 0)
        alarm[2]=game_get_speed(gamespeed_fps)*2
	}
}

if (device_mouse_check_button(0, mb_left)) { // Android/mouse support
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

// level up and set player size
if (global.player_xp >= global.next_level_xp) {
	global.player_level+=1
	global.player_scale*=1.05
	global.player_xp=global.player_xp-global.next_level_xp
	global.next_level_xp=global.next_level_xp*1.04
	global.MessageBox(x, bbox_top-20, "Level Up!", c_aqua, c_aqua, c_teal, c_teal, 36, 1.5, 0, -1)
}

// scale player sprite in Y
image_yscale=global.player_scale

// scale and flip player sprite in X
if _xinput <> 0 {
	image_xscale*=-_xinput
	_last=-_xinput // keep player direction
}
	
image_xscale=_last * global.player_scale

// blink while invincible
if !can_take_hit {
	blink_timer--
	if blink_timer==0 {
		blink_timer=blink_duration
		switch image_blend {
			case c_white:image_blend = c_red; break; 
			case c_red:image_blend = c_white; break;
		}
	}
}


move_and_collide(_xinput * player_speed, _yinput * player_speed, obj_wall, 4, 0, 0, player_speed, player_speed)


