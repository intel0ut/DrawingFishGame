/// @description Insert description here
// 

if global.debug {
	show_debug_message("player hit")
}

if can_take_hit and arm1.dead and arm2.dead {
	// both arms are dead and boss is vulnerable
	can_take_hit=false
	var _dmg = global.player_level * 5
	if global.player_level > level {
		_dmg *= 2
	}
	hp_boss -=_dmg
	alarm[2]=game_get_speed(gamespeed_fps) * 1
}

collided=true