/// @description Insert description here
// You can write your code in this editor

if (!surface_exists(_surf)) {
	var w = surface_get_width(application_surface)
	var h = surface_get_height(application_surface)
	_surf = surface_create(w,h)
}

surface_set_target(_surf)
draw_clear_alpha(c_black,0)
surface_reset_target()
surface_copy(_surf, 0, 0, application_surface);

instance_deactivate_all(true)