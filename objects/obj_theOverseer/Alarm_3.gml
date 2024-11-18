/// @description Spawn boss
// spawn boss
var _enemy_id=instance_create_layer(random_range(64,room_width-64),random_range(128,room_height-64),layer,global._enemy_boss[0])
_enemy_id.spd=global._enemy_boss[2]
_enemy_id.level=global._enemy_boss[1]+1
_enemy_id.food=global._enemy_dmg*global._enemy_boss[3] // gives 2x food
_enemy_id.xp=global._enemy_xp*global._enemy_boss[3] //gives 2x XP
_enemy_id.enemy_hp*=2 //twice as much HP
_enemy_id.enemy_max_score*=2 // twice as much score

_enemy_id.image_xscale=global._enemy_boss[3]
_enemy_id.image_yscale=_enemy_id.image_xscale
global.boss_spawned=true