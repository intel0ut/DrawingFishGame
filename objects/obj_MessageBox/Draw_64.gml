/// @description Insert description here

expired += 1.0/game_get_speed(gamespeed_fps);
if ( expired > duration ) instance_destroy();
alpha = sin( expired/duration * 3.14159 );   // ramps up and down

// figure out the necessary scale to get to the font size
var _scale=font_size/font_get_size(draw_get_font())

// calculate the offset to center the message at the x,y coord
var _scaled_font = font_size * _scale
var _offset = string_width(msg)/2

draw_text_transformed_colour(x_pos -_offset , y_pos, msg, _scale, _scale, 0, c1, c2, c3, c4, alpha);

if scroll_x != 0
	x_pos+=scroll_x

if scroll_y !=0
	y_pos+=scroll_y

//image_alpha=alpha