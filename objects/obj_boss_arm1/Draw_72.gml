/// @description Insert description here
// 
var _player_dir = point_direction(x, y, global._inst_player.x, global._inst_player.y)
var _diff = angle_difference(_player_dir, image_angle)

if sprite_index=spr_arm1_attack and image_index == 1 { // we're before the middle of anim
	if image_xscale < 0 {
		image_angle = clamp(_diff,-30,30)
	} else {
		image_angle = 360 - clamp(_diff,-30,30)
	}
} 

if sprite_index=spr_arm1_attack and image_index == 7 {
	audio_play_sound(sfx_boss_slap, 50, false, 1, 0, choose(1,1.2,1,3))	
}

if sprite_index=spr_arm1_idle {
	image_angle=0	
}