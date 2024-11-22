/// @description Insert description here
// 
var _enemy_id=other.id
if can_take_hit {
	// calculates how much dmg player takes
	var _hit=0
	if global.player_level <= (_enemy_id.level/2) {
	    // takes 2x dmg
		_hit=_enemy_id.food*2
		audio_play_sound(sfx_damage,30,false,0.8,0,random_range(1.6, 1.9))
	} 
    else if global.player_level > (_enemy_id.level/2) and global.player_level < _enemy_id.level {
        _hit=_enemy_id.food
		// dmg enemy too by 1/2 their original dmg
		audio_play_sound(sfx_damage,30,false,0.8,0,random_range(1.6, 1.9))
		audio_play_sound(choose(sfx_bite_1, sfx_bite_2, sfx_bite_3),30,false,0.8,0,random_range(1.3, 1.9))
		_enemy_id.enemy_hp-=_enemy_id.food/2
    }
	global.player_hp-=_hit
	can_take_hit=false
	alarm[0] = game_get_speed(gamespeed_fps)
	
	// bounce back
	move_towards_point(_enemy_id.x,_enemy_id.y,-2)
	//if (alarm[0] < 0) {
	//	alarm[0] = 15
	//}
}
