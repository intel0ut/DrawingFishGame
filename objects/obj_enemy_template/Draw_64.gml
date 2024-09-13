/// @description draw HP bar above enemy

if (!enabled) exit

var _player_inst = instance_find(obj_player,0)

if  _player_inst {
	
	if  _player_inst.player_level <= (level/2) 
	   draw_sprite_stretched(spr_hp, 0,x-20,y-20,40,4)

	if _player_inst.player_level > (level/2) and _player_inst.player_level < (level)
	   draw_sprite_stretched(spr_hp, 1,x-20,y-20,40,4)
   
	if  _player_inst.player_level >= level 
	   draw_sprite_stretched(spr_hp, 2,x-20,y-20,40,4)
	   
}