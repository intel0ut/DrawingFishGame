/// @description Insert description here
// You can write your code in this editor

if (global.restart) {
	global.restart=false
	exit
}

if (global.pause) exit;


var _enemy_list = []
var _enemy_max_spd = 2
var _enemy_level=1
var _enemy_scale=1
var _hp=50
global._enemy_dmg=10
global._enemy_xp=10
global.boss_spawned=false
global.room_finished=false
global._boss_encounter=false

global._inst_player=instance_find(obj_player,0)
global.player_hp=global.player_max_hp

global._inst_player.x=room_width/2
global._inst_player.y=room_height/2

var _max_food=global.player_max_hp/3

var _music = pointer_null
global.level_music=pointer_null

// Room initialization
switch (room) {
	case SunlitZone: {
		_enemy_list = [[obj_puffer_var1, 2], [obj_puffer_var2, 1], [obj_grouper_var1, 2], [obj_bluering_octupus, 1]]
		//_enemy_list = [[obj_boss,1],[obj_grouper_var1, 1]]
		_enemy_max_spd = 2
		_enemy_level = 3
		_enemy_scale=0.6
		_hp=50
		global._enemy_dmg=10
		global._enemy_xp=10
		// enemy boss: name, min_level, spd, scale_multiplier]
		global._enemy_boss = [obj_lemon_shark, _enemy_level+2, _enemy_max_spd+1, 2]
		global.room_desc="The Sunlit Zone"
		_music=snd_level_music_slow_1
		break
	}
	case CoralReef: {
		_enemy_list = [[obj_puffer_var2, 2], [obj_grouper_var1, 2], [obj_grouper_var2, 2],[obj_morey_eel, 1], [obj_lemon_shark, 1]]
		_enemy_max_spd = 3
		_enemy_level = 8
		_enemy_scale=0.7
		_hp=60
		global._enemy_dmg=15
		global._enemy_xp=15
		// enemy boss: name, min_level, spd, scale_multiplier]
		global._enemy_boss = [obj_shark, _enemy_level+2, _enemy_max_spd+1, 2.5]
		global.room_desc="The Coral Reef Zone"
		_music=snd_level_music_slow_1
		break
	}

	case TwilightZone: {
		_enemy_list = [[obj_grouper_var2, 2],[obj_lemon_shark, 2], [obj_shark, 2], [obj_swordfish, 1]]
		_enemy_max_spd = 4
		_enemy_level = 12
		_enemy_scale=0.8
		_hp=70
		global._enemy_dmg=17
		global._enemy_xp=20
		// enemy boss: name, min_level, spd, scale_multiplier]
		global._enemy_boss = [obj_angler, _enemy_level+2, _enemy_max_spd+1, 2.5]
		global.room_desc="The Twilight Zone"
		_music=snd_level_music_slow_2
		break
	}

	case MidnightZone: {
		_enemy_list = [[obj_shark, 2], [obj_swordfish, 1], [obj_angler, 2], [obj_gulper, 1]]
		_enemy_max_spd = 4
		_enemy_level = 15
		_enemy_scale=0.9
		_hp=80
		global._enemy_dmg=20
		global._enemy_xp=25
		// enemy boss: name, min_level, spd, scale_multiplier]
		global._enemy_boss = [obj_dragonfish, _enemy_level+2, _enemy_max_spd+1, 2.5]
		global.room_desc="The Midnight Zone"
		_music=snd_level_music_slow_2
		break
	}

	case MarianaTrench: {
		_enemy_list = [[obj_angler, 2], [obj_gulper, 2], [obj_dragonfish, 2]]
		_enemy_max_spd = 4
		_enemy_level = 18
		_enemy_scale=1
		_hp=100
		global._enemy_dmg=25
		global._enemy_xp=30
		// enemy boss: name, min_level, spd, scale_multiplier]
		global._enemy_boss = [obj_boss, _enemy_level+3, _enemy_max_spd, 2.5]
		global.room_desc="The Mariana Trench"
		_music=snd_level_music_upbeating
		break
	}
}

// start playing music
if not audio_is_playing(_music) {
	audio_stop_all()
}
 
global.level_music=audio_play_sound(_music, 50, true)

// add wall to the scene x-axis
for (var _i=0; _i<=room_width-32; _i+=32) {
	instance_create_layer(_i+16, 48, layer, obj_wall)
	instance_create_layer(_i+16, room_height-16, layer, obj_wall)	
}

// add wall to the scene y-axis
for (var _i=32; _i<=room_height-32; _i+=32) {
	instance_create_layer(16, _i+16, layer, obj_wall)
	instance_create_layer(room_width-16, _i+16, layer, obj_wall)	
}


if array_length(_enemy_list) != 0 {
	for (var _idx=0; _idx < array_length(_enemy_list); _idx++) {
		for (var _count=0; _count < _enemy_list[_idx][1]; _count++) {
			var _enemy_id=instance_create_layer(random_range(64,room_width-64),random_range(128,room_height-64),layer,_enemy_list[_idx][0])
			if !place_empty(_enemy_id.x,_enemy_id.y) and 
			    point_distance(_enemy_id.x,_enemy_id.y, global._inst_player.x, global._inst_player.y) < 250 {
				instance_destroy(_enemy_id)
				_count--
			}
			_enemy_id.spd=max(_enemy_max_spd+random_range(-2,0),1)
			_enemy_id.level=_enemy_level
			_enemy_id.food=global._enemy_dmg*2 // gives 2x food
			_enemy_id.xp=global._enemy_xp*2 //gives 2x XP
			_enemy_id.enemy_hp=_hp //twice as much HP
			_enemy_id.image_xscale=_enemy_scale
			_enemy_id.image_yscale=_enemy_id.image_xscale
		}
	}
}

// add food to the scene
// initial X needxs to be biger than 64 to give space to HP bar
for(i=0; i<=_max_food; i++) {
	var inst_id=instance_create_layer(random_range(34,room_width-34),random_range(68,room_height-34),layer,obj_food)
	if (random_range(-1,1)) > 0
		inst_id.image_xscale=-inst_id.image_xscale
	if (random_range(-1,1)) > 0
		inst_id.image_angle=random_range(-90,90)
}

alarm[1]=600

// run the room start splash screen
instance_create_layer(0,0,layer,obj_splasher)