/// @description Insert description here
// You can write your code in this editor

var _enemy_list = []
var _enemy_max_spd = 2
var _enemy_level
global.boss_spawned=false

global._inst_player=instance_find(obj_player,0)
global._inst_player.player_level=global.player_level
global._inst_player.player_xp=global.player_xp

// Room initialization
switch (room) {
	case SunlitZone: {
		_enemy_list = [[obj_puffer, 2], [obj_grouper, 1]]
		_enemy_max_spd = 2
		_enemy_level = 4
		// enemy boss: name, min_level, spd, scale_multiplier]
		global._enemy_boss = [obj_shark, _enemy_level+1, _enemy_max_spd+1, 2]
		global.room_desc="The Sunlit Zone"
		break
	}
	case CoralReef: {
		_enemy_list = [[obj_puffer, 2], [obj_grouper, 2],[obj_shark, 1]]
		_enemy_max_spd = 3
		_enemy_level = 7
		// enemy boss: name, min_level, spd, scale_multiplier]
		global._enemy_boss = [obj_swordfish, _enemy_level+1, _enemy_max_spd+1, 2.5]
		global.room_desc="The Coral Reef Zone"
		break
	}

	case TwilightZone: {
		_enemy_list = [[obj_grouper, 2],[obj_shark, 2], [obj_swordfish, 1]]
		_enemy_max_spd = 4
		_enemy_level = 10
		// enemy boss: name, min_level, spd, scale_multiplier]
		global._enemy_boss = [obj_angler, _enemy_level+1, _enemy_max_spd+1, 2.5]
		global.room_desc="The Twilight Zone"
		break
	}

	case MidnightZone: {
		_enemy_list = [[obj_shark, 2], [obj_swordfish, 1], [obj_angler, 1], [obj_gulper, 1]]
		_enemy_max_spd = 5
		_enemy_level = 13
		// enemy boss: name, min_level, spd, scale_multiplier]
		global._enemy_boss = [obj_dragonfish, _enemy_level+1, _enemy_max_spd+1, 2.5]
		global.room_desc="The Midnight Zone"
		break
	}

	case MarianaTrench: {
		_enemy_list = [[obj_angler, 2], [obj_gulper, 2], [obj_dragonfish, 2]]
		_enemy_max_spd = 5
		_enemy_level = 16
		// enemy boss: name, min_level, spd, scale_multiplier]
		global._enemy_boss = [obj_boss, _enemy_level+1, _enemy_max_spd+1, 2.5]
		global.room_desc="The Mariana Trench"
		break
	}
}

if array_length(_enemy_list) != 0 {
	for (var _idx=0; _idx < array_length(_enemy_list); _idx++) {
		for (var _count=0; _count < _enemy_list[_idx][1]; _count++) {
			var _enemy_id=instance_create_layer(random_range(64,room_width-64),random_range(128,room_height-64),layer,_enemy_list[_idx][0])
			if !place_empty(_enemy_id.x,_enemy_id.y) and 
			    point_distance(_enemy_id.x,_enemy_id.y, global._inst_player.x, global._inst_player.y) < 150 {
				instance_destroy(_enemy_id)
				_count--
			}
			_enemy_id.spd=max(_enemy_max_spd+random_range(-2,0),1)
			_enemy_id.level=_enemy_level
		}
	}
}


// run the room start splash screen
instance_create_layer(0,0,layer,obj_splasher)