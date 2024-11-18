/// @description Insert description here
// You can write your code in this editor
if global.pause exit

var w = surface_get_width(application_surface)
var h = surface_get_height(application_surface)

_surf = surface_create(w,h)

alarm[1]=3

duration = 3.5;  // seconds
expired = 0.0;
alpha = 0.0;
SPLASH=true