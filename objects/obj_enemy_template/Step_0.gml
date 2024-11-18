/// @description move enemy towards player and process hits

if (global.pause) exit;

CheckAnimation()

if (!enabled) exit

if (enemy_hp <=0 ) {
	global.player_hp+=food
	global.player_xp+=xp
	global.score+=enemy_max_score
	mask_index=spr_empty
	StartAnimation(seq_enemy_dead, sprite_index);
} else
	scr_enemy_step()