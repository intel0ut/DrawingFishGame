/// @description Insert description here
// You can write your code in this editor
if !hit
	move_towards_point(obj_player.x,obj_player.y,spd)
else {
	move_towards_point(obj_player.x,obj_player.y,-(spd*2))
	if (alarm[0] < 0) {
		alarm[0] = 30
}
}

if (direction >=0 and direction <=90) or direction >= 270 {
	image_xscale=-1
} else {
	image_xscale=1
}
sprite_index = spr_enemy_lvl2_gulper

collided=false

