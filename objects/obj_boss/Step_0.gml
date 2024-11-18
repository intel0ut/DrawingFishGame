/// @description Insert description here
// 

// pause
if (global.pause) {
	path_speed=0
	speed=0
	exit
}

// attack when player is close
var _distance_to_player=point_distance(x,y,global._inst_player.x,global._inst_player.y)

if collided {
	move_towards_point(global._inst_player.x,global._inst_player.y,-(speed * 10))
	show_debug_message("Bouncing...")
	if (alarm[3] < 0) {
		alarm[3]=15
	}
}
// change direction when player move
if global._inst_player.x > (x+2) {
	image_xscale = -(abs(image_xscale))
	arm1.image_xscale = -(abs(arm1.image_xscale))
	arm2.image_xscale = -(abs(arm2.image_xscale))
	arm1.x=x+8
	arm1.y=y-48
	arm2.x=x-3
	arm2.y=y-35
} else if global._inst_player.x < (x-2) {
	image_xscale = abs(image_xscale)
	arm1.image_xscale = abs(arm1.image_xscale)
	arm2.image_xscale = abs(arm2.image_xscale)
	arm1.x=x-8
	arm1.y=y-48
	arm2.x=x+3
	arm2.y=y-35
}

// change sprite on attack
if state == "ATK" {
	path_speed=2
	sprite_index=spr_body_attack
	
} 

if _distance_to_player <= global.chase_distance and not collided{
	show_debug_message("{0} {1} {2} ", path_x, path_y, path_pos)
	if path_x < 0 and path_y < 0 {
		path_x=path_get_x(path_index,path_position)
		path_y=path_get_y(path_index,path_position)
		path_pos=path_position
		path_end()
	}
	move_towards_point(global._inst_player.x,global._inst_player.y,2)
} else {
	if path_x >= 0 and path_y >= 0 {
		show_debug_message("{0} {1} {2} ", path_x, path_y, path_pos)
		if point_distance(x,y,path_x,path_y) < 2 {
			path_start(pth_boss, 1,path_action_continue,true)
			path_position=path_pos
			path_y=-1
			path_x=-1
			path_pos=-1
		}
		move_towards_point(path_x, path_y, 1)
	}	
}


if state == "IDLE" { // change sprite on IDLE
	path_speed=3
	sprite_index=spr_body_idle
}

