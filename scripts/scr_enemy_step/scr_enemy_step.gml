// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_step(){

	if !hit // seek player
		move_towards_point(global._inst_player.x,global._inst_player.y,spd)
		
	else { // but if our level is lower, take hit and bounce back
		move_towards_point(global._inst_player.x,global._inst_player.y,-(spd*4))
		if (alarm[0] < 0) {
			alarm[0] = 20
		}
	}

	if (direction >=0 and direction <=90) or direction >= 270 {
		image_xscale=-1
	} else {
		image_xscale=1
	}

	collided=false
}