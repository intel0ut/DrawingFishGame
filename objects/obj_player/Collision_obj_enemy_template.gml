
var _enemy_id=other.id
if can_take_hit {
	// calculates how much dmg player takes
	var _hit=0
	if global.player_level <= (_enemy_id.level/2) {
	    // takes 2x dmg
		_hit=_enemy_id.food*2
	} 
    else if global.player_level > (_enemy_id.level/2) and global.player_level < _enemy_id.level {
        _hit=_enemy_id.food
		// dmg enemy too by 1/2 their original fmg
		_enemy_id.enemy_hp-=_enemy_id.food/2
    }
	global.player_hp-=_hit
	can_take_hit=false
	alarm[0] = game_get_speed(gamespeed_fps)
	// bounce back
	move_towards_point(_enemy_id.x,_enemy_id.y,-2)
	if (alarm[0] < 0) {
		alarm[0] = 15
	}
}

if global.player_level >= _enemy_id.level { // player hits enemy 
		_enemy_id.enemy_hp-=_enemy_id.food * (max(1,global.player_level-_enemy_id.level))
}
