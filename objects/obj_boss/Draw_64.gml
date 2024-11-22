/// @description Insert description here
// 

if (arm1.dead and arm2.dead) or can_take_hit {
	var _y_off = bbox_top - 20	
	var _hp_draw=(hp_boss/enemy_hp)*40 // size of hp bar
	if  global.player_level <= (level/2) 
	   draw_sprite_stretched(spr_hp, 0,x-20,_y_off,_hp_draw,4)

	if global.player_level > (level/2) and global.player_level < (level)
	   draw_sprite_stretched(spr_hp, 1,x-20,_y_off,_hp_draw,4)
   
	if  global.player_level >= level 
	   draw_sprite_stretched(spr_hp, 2,x-20,_y_off,_hp_draw,4)		
	
}


if global.debug {
	draw_set_font(fnt_debug_font)
	draw_text(bbox_right+10,bbox_top+20, "HP: " + string(hp_boss))
	draw_set_font(global._bubble_font);
}