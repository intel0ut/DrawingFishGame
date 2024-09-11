/// @description move and collide player, flip sprite depending on direction

var _xinput = keyboard_check(vk_right) - keyboard_check(vk_left);
var _yinput = keyboard_check(vk_down) - keyboard_check(vk_up);

image_yscale=1/player_size

if _xinput <> 0 {
	image_xscale*=-_xinput
	_last=-_xinput // keep player direction
}
	
image_xscale=_last/player_size

move_bounce_solid(false)

move_and_collide(_xinput * player_speed, _yinput * player_speed, obj_wall, 4, 0, 0, player_speed, player_speed);

