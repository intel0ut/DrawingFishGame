/// @description drawing elements that are not in the application surface at the time of pause
// You can write your code in this editor

// Draw the UI before freezing
healthbar_width=512
healthbar_height=24
healthbar_x=(room_width/2)-(healthbar_width/2)
healthbar_y=16

draw_sprite(spr_hp_bar_bg,0,healthbar_x,healthbar_y)
draw_sprite_stretched(spr_hp,0,healthbar_x,healthbar_y,0, healthbar_height)
draw_sprite(spr_hp_bar_border,0,healthbar_x,healthbar_y)
draw_text_transformed_colour(20, healthbar_y-13, "Level",1, 0.8, 0, c_aqua, c_aqua, c_blue, c_blue, 1);
draw_text_transformed_colour(150, healthbar_y-13, string(global._inst_player.player_level), 1, 0.8, 0, c_aqua, c_aqua, c_blue, c_blue, 1);

for (i=0; i< global.lifes; i++) {
	draw_sprite_part(spr_life,-1,0,0,32,32,room_width-50-(global.lifes * 37)+(i*37) , 15)	
}

if SPLASH {
	expired += 1.0/room_speed;
	if ( expired > duration ) {
		SPLASH=false
		duration = 3;  // seconds
		expired = 0.0;
		alpha = 0.0;
	}
	alpha = sin( expired/duration * 3.14159 );   // ramps up and down
	y-=1; 
	var msg=global.room_desc
	var offset = (string_length(msg) * font_get_size(draw_get_font())/2)+font_get_size(draw_get_font())*3
	draw_text_ext_transformed_color((room_width/2)-offset, room_height/2-50, msg,0,room_width,3,2,0, c_teal, c_teal, c_blue, c_blue, alpha)
}

if !SPLASH {
	expired += 1.0/room_speed;
	if ( expired > duration ) {
		instance_activate_all()
		instance_destroy(self,true)
	}
	alpha = sin( expired/duration * 3.14159 );   // ramps up and down
	y-=1; 
	var msg = "S  T  A  R  T"
	var offset = (string_length(msg) * font_get_size(draw_get_font())/2)+font_get_size(draw_get_font())
	draw_text_ext_transformed_color((room_width/2)-offset, room_height/2-50, msg,0,room_width,3,2,0, c_teal, c_teal, c_blue, c_blue, alpha)
}