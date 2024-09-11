/// @description Insert description here
// You can write your code in this editor
if (x > room_width-34 or x < 34 or y > room_height-34 or y < 68) {
	instance_destroy(self)
	var inst_id=instance_create_layer(random_range(34,room_width-34),random_range(68,room_height-34),layer,obj_food)
	if (random_range(-1,1)) > 0
		inst_id.image_xscale=-image_xscale
	
}
else {
	collided=false
} 