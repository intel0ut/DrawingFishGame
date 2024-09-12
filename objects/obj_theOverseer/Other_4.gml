/// @description Insert description here
// You can write your code in this editor

var lvl1_enemies
var lvl2_enemies
var lvl3_enemies
var boss_enemy

global._inst_player=instance_find(obj_player,0)


// Room initialization
switch (room) {
	case SunlitZone: {
		lvl1_enemies=1
		lvl2_enemies=0
		lvl3_enemies=0
		boss_enemy=0
		global.room_desc="The Sunlit Zone"
		break
	}
	case CoralReef: {
		global._inst_player.player_level=3
		global._inst_player.player_size=8/global._inst_player.player_level
		lvl1_enemies=2
		lvl2_enemies=1
		lvl3_enemies=0
		boss_enemy=0
		global.room_desc="The Coral Reef Zone"
		break
	}

	case TwilightZone: {
		global._inst_player.player_level=5
		global._inst_player.player_size=8/global._inst_player.player_level
		lvl1_enemies=4
		lvl2_enemies=2
		lvl3_enemies=0
		boss_enemy=0
		global.room_desc="The Twilight Zone"
		break
	}

	case MidnightZone: {
		global._inst_player.player_level=7
		global._inst_player.player_size=8/global._inst_player.player_level
		lvl1_enemies=4
		lvl2_enemies=2
		lvl3_enemies=1
		boss_enemy=0
		global.room_desc="The Midnight Zone"
		break
	}

	case MarianaTrench: {
		global._inst_player.player_level=10
		global._inst_player.player_size=8/global._inst_player.player_level
		lvl1_enemies=4
		lvl2_enemies=2
		lvl3_enemies=1
		boss_enemy=1
		global.room_desc="The Mariana Trench"
		break
	}
}


if boss_enemy!= 0 {
	for (i=0;i<boss_enemy;i++) {
		instance_create_layer((room_width/4)*3, room_height/2,layer,obj_boss)
	}
	
}

if lvl1_enemies!= 0 {
	for (i=0;i<lvl1_enemies;i++) {
		var enemy_id=instance_create_layer(random_range(64,room_width-64),random_range(128,room_height-64),layer,obj_enemy_lvl1)
		if !place_empty(enemy_id.x,enemy_id.y) and point_distance(enemy_id.x,enemy_id.y, global._inst_player.x, global._inst_player.y) < 150 {
			instance_destroy(enemy_id)
			i--
		}
		enemy_id.spd=max(enemy_id.spd+random_range(-2,0),1)
	}
}

if lvl2_enemies!= 0 {
	for (i=0;i<lvl2_enemies;i++) {
		var enemy_id=instance_create_layer(random_range(64,room_width-64),random_range(128,room_height-64),layer,obj_enemy_lvl2)
		if !place_empty(enemy_id.x,enemy_id.y) and point_distance(enemy_id.x,enemy_id.y, global._inst_player.x, global._inst_player.y) < 150 {
			instance_destroy(enemy_id)
			i--
		}
		enemy_id.spd=enemy_id.spd+random_range(-1,0)
	}
}


if lvl3_enemies!= 0 {
	for (i=0;i<lvl3_enemies;i++) {
		var enemy_id=instance_create_layer(random_range(64,room_width-64),random_range(128,room_height-64),layer,obj_enemy_lvl3)
		if !place_empty(enemy_id.x,enemy_id.y) and point_distance(enemy_id.x,enemy_id.y, global._inst_player.x, global._inst_player.y) < 150 {
			instance_destroy(enemy_id)
			i--
		}
		enemy_id.spd=enemy_id.spd+random_range(-1,0)
	}
}


if boss_enemy!= 0 {
	for (i=0;i<boss_enemy;i++) {
		var enemy_id=instance_create_layer(random_range(64,room_width-64),random_range(128,room_height-64),layer,obj_boss)
		if !place_empty(enemy_id.x,enemy_id.y) and point_distance(enemy_id.x,enemy_id.y, global._inst_player.x, global._inst_player.y) < 150 {
			instance_destroy(enemy_id)
			i--
		}
	}
}

// run the room start splash screen
instance_create_layer(0,0,layer,obj_splasher)