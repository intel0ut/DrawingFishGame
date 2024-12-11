/// @description Insert description here
// 

if instance_find(obj_intro_video,0) {
	return	
}

var _i = 0 

repeat (buttons) {
	draw_set_font(fnt_menu)
	draw_set_halign(fa_center)
	draw_set_color(c_navy)
	if menu_index == _i
		draw_set_color(c_aqua)
	draw_text(menu_x, menu_y + button_h * _i, button[_i])
	_i++
	draw_set_halign(fa_left)
}