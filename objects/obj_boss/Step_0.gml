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

if (arm1.dead and arm2.dead) {
	can_take_hit=true
}

// check if dead
if hp_boss <= 0 {
	// play dead animation 
	// blink screen
	// delay
	room_goto(GameWinRoom)
}


if collided {
	move_towards_point(global._inst_player.x,global._inst_player.y,-(speed * 10))
	show_debug_message("Bouncing...")
	if (alarm[3] < 0) {
		alarm[3]=15
	}
}

if state="SPECIAL" and image_index>= 30 and not collided {
	// special attack
	if path_x < 0 and path_y < 0 {
		path_x=path_get_x(path_index,path_position)
		path_y=path_get_y(path_index,path_position)
		path_pos=path_position
		path_end()
	}
	show_debug_message("moving towards {0} {1}", global.attack_x , global.attack_y)
	move_towards_point(global._inst_player.x, global._inst_player.y,5)
	return
}

// change direction when player move
if global._inst_player.x > (x+2) {
	image_xscale = -(abs(image_xscale))
	arm1.image_xscale = -(abs(arm1.image_xscale))
	arm2.image_xscale = -(abs(arm2.image_xscale))
	arm1.x=x+17
	arm1.y=y-35
	arm2.x=x+1
	arm2.y=y-32
} else if global._inst_player.x < (x-2) {
	image_xscale = abs(image_xscale)
	arm1.image_xscale = abs(arm1.image_xscale)
	arm2.image_xscale = abs(arm2.image_xscale)
	arm1.x=x-17
	arm1.y=y-35
	arm2.x=x-1
	arm2.y=y-32
}

// change sprite on attack
if state == "ATK" {
	path_speed=2
	sprite_index=kraken_attack1_body
	
} 

if _distance_to_player <= global.chase_distance and not collided{
	if path_x < 0 and path_y < 0 {
		path_x=path_get_x(path_index,path_position)
		path_y=path_get_y(path_index,path_position)
		path_pos=path_position
		path_end()
	}
	move_towards_point(global._inst_player.x,global._inst_player.y,2)
} else {
	if path_x >= 0 and path_y >= 0 {
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
	sprite_index=idle_body
	if not arm1.dead {
		arm1.sprite_index=idle_arm1
	} else {
		arm1.sprite_index=idle_arm1_dead
	}
	if not arm2.dead {
		arm2.sprite_index=idle_arm2
	} else {
		arm2.sprite_index=idle_arm2_dead
	}
	arm1.image_alpha=1
	arm2.image_alpha=1
}

