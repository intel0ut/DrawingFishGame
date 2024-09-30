/// @description Every 5 frames check if we finished all enemies and move to next room
// You can write your code in this editor

// enemy boss: name, min_level, spd, scale_multiplier]
if !global.boss_spawned and global._inst_player.player_level == global._enemy_boss[1] {
	// splash the message "A big fish from the deep is coming!"
	
	// spawn boss
	var _enemy_id=instance_create_layer(random_range(64,room_width-64),random_range(128,room_height-64),layer,global._enemy_boss[0])
	_enemy_id.spd=global._enemy_boss[2]
	_enemy_id.level=global._enemy_boss[1]+1
	_enemy_id.image_xscale=global._enemy_boss[3]
	_enemy_id.image_yscale=_enemy_id.image_xscale
	global.boss_spawned=true
}

if global.boss_spawned and !instance_find(global._enemy_boss[0],0) {
	// player killed boss
	// splash the message "You Win! Diving deeper!"
	global.player_level = global._inst_player.player_level
	global.player_xp = global._inst_player.player_xp
	if room != MarianaTrench {
		room_goto_next()
	}
}

alarm[0]=5