// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pause_everyone(){
	player=instance_find(obj_player,0)
	player.speed=0
	for (var _i = 0; _i < instance_number(obj_enemy_template); ++_i;)
	{
	    enemy=instance_find(obj_enemy_template,_i);
		enemy.speed=0
	}
}