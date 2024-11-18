/// @description Insert description here
// You can write your code in this editor
global.player_hp=min(global.player_hp+other.food, global.player_max_hp)
global.player_xp=min(global.player_xp+other.xp, global.next_level_xp)
