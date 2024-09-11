/// @description Insert description here
// You can write your code in this editor
player_hp=player_hp+obj_food.food

if (player_hp >= max_hp) {
	player_level+=1
	player_size=8/player_level
	player_hp=player_hp-max_hp
	instance_create_layer((room_width/2),(room_height/3),layer,obj_level_up)
}