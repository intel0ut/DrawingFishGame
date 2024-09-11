/// @description drawing elements that are not in the application surface at the time of pause
// You can write your code in this editor
healthbar_width=512
healthbar_height=24
healthbar_x=(room_width/2)-(healthbar_width/2)
healthbar_y=16

draw_sprite(spr_hp_bar_bg,0,healthbar_x,healthbar_y)
draw_sprite_stretched(spr_hp,0,healthbar_x,healthbar_y,0, healthbar_height)
draw_sprite(spr_hp_bar_border,0,healthbar_x,healthbar_y)

draw_text_transformed_colour(20, healthbar_y-13, "Level",1, 0.8, 0, c_aqua, c_aqua, c_blue, c_blue, 1);
draw_text_transformed_colour(150, healthbar_y-13, "1", 1, 0.8, 0, c_aqua, c_aqua, c_blue, c_blue, 1);

if SPLASH {
	expired += 1.0/room_speed;
	if ( expired > duration ) {
		SPLASH=false
		duration = 3.5;  // seconds
		expired = 0.0;
		alpha = 0.0;
	}
	alpha = sin( expired/duration * 3.14159 );   // ramps up and down
	y-=1; 
	var _lvl="L E V E L  " + string(global.level)
	var offset = (string_length(_lvl) * font_get_size(draw_get_font())/2)+font_get_size(draw_get_font())
	draw_text_ext_transformed_color((room_width/2)-offset, room_height/2-50, _lvl,0,room_width,3,2,0, c_teal, c_teal, c_blue, c_blue, alpha)
}

if !SPLASH {
	expired += 1.0/room_speed;
	if ( expired > duration ) {
		instance_activate_all()
		instance_destroy(self,true)
		STARTED=true
	}
	alpha = sin( expired/duration * 3.14159 );   // ramps up and down
	y-=1; 
	var msg = "S T A R T"
	var offset = (string_length(msg) * font_get_size(draw_get_font())/2)+font_get_size(draw_get_font())
	draw_text_ext_transformed_color((room_width/2)-offset, room_height/2-50, msg,0,room_width,3,2,0, c_teal, c_teal, c_blue, c_blue, alpha)
}