/// @description Detect collision with player
// TEMPLATE: Copy code below and change destination sprite for each enemy

if collided==false {
	if (global._inst_player.player_level >= level) {
		mask_index=spr_empty
		StartAnimation(seq_enemy_dead, sprite_index);
	}
}
collided=true
hit=true
