/// @description Insert description here
// You can write your code in this editor
global.player_hp=min(global.player_hp+other.food, global.player_max_hp)
global.player_xp=min(global.player_xp+other.xp, global.next_level_xp)

if (global.player_xp >= global.next_level_xp) {
	global.player_level+=1
	player_size=8/global.player_level
	global.player_xp=global.player_xp-global.next_level_xp
	global.next_level_xp=global.next_level_xp*1.04
	global.MessageBox(x, bbox_top-20, "Level Up!", c_aqua, c_aqua, c_teal, c_teal, 36, 1.5, 0, -1)
}