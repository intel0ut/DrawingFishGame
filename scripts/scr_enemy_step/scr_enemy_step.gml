// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_enemy_step(){

	if !hit { // seek player 
		var _distance_to_player=point_distance(x,y,global._inst_player.x,global._inst_player.y)
		if _distance_to_player <= global.chase_distance {
			move_towards_point(global._inst_player.x,global._inst_player.y,spd)
		} else {
			move_towards_point(global._inst_player.x,global._inst_player.y,spd/2)
		}
	}
	else { // but if our level is lower, take hit and bounce back
		move_towards_point(global._inst_player.x,global._inst_player.y,-(spd*6))
		if (alarm[0] < 0) {
			alarm[0] = 15
		}
	}

	if (direction >=0 and direction <=90) or direction >= 270 {
		image_xscale = -(abs(image_xscale))
		
	} else {
		image_xscale= abs(image_xscale)
	}

	collided=false
}