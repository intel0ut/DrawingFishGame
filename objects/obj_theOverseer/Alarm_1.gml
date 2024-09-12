/// @description Periodically add food to the room so player won't starve
// You can write your code in this editor

var _max_food=global._inst_player.max_hp/3

// add food to the scene
// initial X needxs to be biger than 64 to give space to HP bar
for(i=0; i<=_max_food/4; i++) {
	var inst_id=instance_create_layer(random_range(34,room_width-34),random_range(68,room_height-34),layer,obj_food)
	if (random_range(-1,1)) > 0
		inst_id.image_xscale=-inst_id.image_xscale
}

alarm[1]=300
