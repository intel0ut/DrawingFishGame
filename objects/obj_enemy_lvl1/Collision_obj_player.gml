/// @description Insert description here
// You can write your code in this editor
if collided==false {
	if ( obj_player.player_level >= level) {
		instance_create_layer(x,y,layer,obj_enemy_lvl1_dead)
		instance_destroy(self)
	}
}
collided=true
hit=true

