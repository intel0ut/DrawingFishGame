/// @description Insert description here
// 

var _player_dir = point_direction(x, y, global._inst_player.x, global._inst_player.y)
var _diff = angle_difference(_player_dir, image_angle)

if state="ATK" and image_index == 1 { // we're before the middle of anim
	if image_xscale < 0 {
		image_angle = clamp(_diff,-30,30)
	} else {
		image_angle = 360 - clamp(_diff,-30,30)
	}
} 

if state="ATK" and image_index == 80 {
	audio_play_sound(sfx_boss_slap, 50, false, 1, 0, choose(0.9,1.0,1,1))	
}


if state="IDLE" {
	image_angle=0	
}