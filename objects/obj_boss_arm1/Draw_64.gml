/// @description Insert description here
// 


if global.debug {
	draw_set_font(fnt_debug_font)
	draw_text(bbox_right-10,bbox_top-20, "HP: " + string(hp))
	draw_set_font(global._bubble_font);
}