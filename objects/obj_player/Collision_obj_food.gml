/// @description Insert description here
// You can write your code in this editor
player_hp=player_hp+obj_food.food

if (player_hp >= max_hp) {
	player_level+=1
	player_size=8/player_level
	player_hp=player_hp-max_hp
	global.MessageBox(x, bbox_top-20, "Level Up!", c_aqua, c_aqua, c_teal, c_teal, 36, 1.5, 0, -1)
}