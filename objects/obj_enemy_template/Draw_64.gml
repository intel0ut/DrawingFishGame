/// @description draw HP bar above enemy

if (!enabled) exit

var _player_inst = instance_find(obj_player,0)

if  _player_inst {

	var _y_off = bbox_top - 20	
	var _hp_draw=(enemy_hp/max_hp)*40 // size of hp bar
	if  global.player_level <= (level/2) 
	   draw_sprite_stretched(spr_hp, 0,x-20,_y_off,_hp_draw,4)

	if global.player_level > (level/2) and global.player_level < (level)
	   draw_sprite_stretched(spr_hp, 1,x-20,_y_off,_hp_draw,4)
   
	if  global.player_level >= level 
	   draw_sprite_stretched(spr_hp, 2,x-20,_y_off,_hp_draw,4)
	   
}