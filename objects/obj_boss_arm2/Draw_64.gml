/// @description Insert description here
// 
if can_take_hit {
	if  global._inst_player {
		var _y_off = bbox_top + 20	
		var _x_off = bbox_right -10
		var _hp_draw=(hp/max_hp)*40 // size of hp bar
		draw_sprite_stretched(spr_hp, 0,_x_off,_y_off,_hp_draw,4)
	}
	
}

if global.debug {
	draw_set_font(fnt_debug_font)
	draw_text(bbox_left-10,bbox_bottom-20, "HP: " + string(hp))
	draw_set_font(global._bubble_font);
	//draw_set_colour(c_red);
	//draw_set_alpha(0.2);
	//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	//draw_set_alpha(1);
}