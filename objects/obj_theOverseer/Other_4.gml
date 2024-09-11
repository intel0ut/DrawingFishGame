/// @description Insert description here
// You can write your code in this editor

var lvl1_enemies
var lvl2_enemies
var lvl3_enemies
var boss_enemy

var _inst_player=instance_find(obj_player,0)

if room==SunlitZone {
	lvl1_enemies=1
	lvl2_enemies=0
	lvl3_enemies=0
	boss_enemy=0
	global.level=1
}

if room==CoralReef {
	_inst_player.player_level=3
	_inst_player.player_size=8/_inst_player.player_level
	lvl1_enemies=2
	lvl2_enemies=1
	lvl3_enemies=0
	boss_enemy=0
	global.level=2
}

if room==TwilightZone {
	_inst_player.player_level=5
	_inst_player.player_size=8/_inst_player.player_level
	lvl1_enemies=4
	lvl2_enemies=2
	lvl3_enemies=0
	boss_enemy=0
	global.level=3
}

if room==MidnightZone {
	_inst_player.player_level=7
	_inst_player.player_size=8/_inst_player.player_level
	lvl1_enemies=4
	lvl2_enemies=2
	lvl3_enemies=1
	boss_enemy=0
	global.level=4
}

if room=MarianaTrench {
	_inst_player.player_level=10
	_inst_player.player_size=8/_inst_player.player_level
	lvl1_enemies=4
	lvl2_enemies=2
	lvl3_enemies=1
	boss_enemy=1
	global.level=5
}

if boss_enemy!= 0 {
	for (i=0;i<boss_enemy;i++) {
		instance_create_layer((room_width/4)*3, room_height/2,layer,obj_boss)
	}
	
}

if lvl1_enemies!= 0 {
	for (i=0;i<lvl1_enemies;i++) {
		var enemy_id=instance_create_layer(random_range(64,room_width-64),random_range(128,room_height-64),layer,obj_enemy_lvl1)
		if !place_empty(enemy_id.x,enemy_id.y) {
			instance_destroy(enemy_id)
			i--
		}
		enemy_id.spd=max(enemy_id.spd+random_range(-2,0),1)
	}
}

if lvl2_enemies!= 0 {
	for (i=0;i<lvl2_enemies;i++) {
		var enemy_id=instance_create_layer(random_range(64,room_width-64),random_range(128,room_height-64),layer,obj_enemy_lvl2)
		if !place_empty(enemy_id.x,enemy_id.y) {
			instance_destroy(enemy_id)
			i--
		}
		enemy_id.spd=enemy_id.spd+random_range(-1,0)
	}
}


if lvl3_enemies!= 0 {
	for (i=0;i<lvl3_enemies;i++) {
		var enemy_id=instance_create_layer(random_range(64,room_width-64),random_range(128,room_height-64),layer,obj_enemy_lvl3)
		if !place_empty(enemy_id.x,enemy_id.y) {
			instance_destroy(enemy_id)
			i--
		}
		enemy_id.spd=enemy_id.spd+random_range(-1,0)
	}
}


if boss_enemy!= 0 {
	for (i=0;i<boss_enemy;i++) {
		var enemy_id=instance_create_layer(random_range(64,room_width-64),random_range(128,room_height-64),layer,obj_boss)
		if !place_empty(enemy_id.x,enemy_id.y) {
			instance_destroy(enemy_id)
			i--
		}
	}
}

instance_create_layer(0,0,layer,obj_splasher)