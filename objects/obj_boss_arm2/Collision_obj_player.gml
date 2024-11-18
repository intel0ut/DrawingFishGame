/// @description Insert description here
// 

if can_take_hit and hp > 0 {
	hp -= (global.player_level/obj_boss.level) * 20
	can_take_hit=false
	alarm[0]=game_get_speed(gamespeed_fps) * 1
}

if hp <=0 {
	dead=true	
}