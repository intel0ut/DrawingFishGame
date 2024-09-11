/// @description Insert description here
// You can write your code in this editor

random_set_seed(current_time)

alarm[0]=5

instance_create_layer(room_width/2, room_height/2,layer,obj_player)

var _max_food=obj_player.max_hp/3

// add wall to the scene x-axis
for (i=0; i<=room_width-32; i=i+32) {
	instance_create_layer(i+16, 48, layer, obj_wall)
	instance_create_layer(i+16, room_height-16, layer, obj_wall)	
}

// add wall to the scene y-axis
for (i=32; i<=room_height-32; i=i+32) {
	instance_create_layer(16, i+16, layer, obj_wall)
	instance_create_layer(room_width-16, i+16, layer, obj_wall)	
}

// add food to the scene
// initial X needxs to be biger than 64 to give space to HP bar
for(i=0; i<=_max_food; i++) {
	var inst_id=instance_create_layer(random_range(34,room_width-34),random_range(68,room_height-34),layer,obj_food)
	if (random_range(-1,1)) > 0 {
		inst_id.image_xscale=-inst_id.image_xscale

	}
}

alarm[1]=600