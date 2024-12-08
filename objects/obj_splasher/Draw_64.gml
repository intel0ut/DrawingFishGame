/// @description drawing elements that are not in the application surface at the time of pause
// You can write your code in this editor

if global.pause exit

// Draw the UI before freezing
var healthbar_width=512
var healthbar_height=16
var healthbar_x=(room_width/2)-(healthbar_width/2)
var healthbar_y=16
var xpbar_width=healthbar_width
var xpbar_height=4
var xpbar_x=healthbar_x
var xpbar_y=38

// Draw HP bar
draw_sprite_stretched(spr_hp_bar_bg,0,healthbar_x-2,healthbar_y-2, healthbar_width, healthbar_height+4)
draw_sprite_stretched(spr_hp,0,healthbar_x,healthbar_y,1, healthbar_height)
draw_sprite_stretched(spr_hp_bar_border,0,healthbar_x-2,healthbar_y-2, healthbar_width, healthbar_height+4)

// Draw XP bar
draw_sprite_stretched(spr_hp,3,xpbar_x,xpbar_y,(global.player_xp/global.next_level_xp) * xpbar_width, xpbar_height)


draw_text_transformed_colour(20, healthbar_y-13, "Score",1, 0.8, 0, c_aqua, c_aqua, c_blue, c_blue, 1);
draw_text_transformed_colour(150, healthbar_y-13, string(global.score), 1, 0.8, 0, c_aqua, c_aqua, c_blue, c_blue, 1);

for (var i=0; i< global.lifes; i++) {
	draw_sprite_part(spr_life,-1,0,0,32,32,room_width-50-(global.lifes * 37)+(i*37) , 15)	
}


if SPLASH {
	expired += 1.0/game_get_speed(gamespeed_fps);
	if ( expired > duration ) {
		SPLASH=false
		duration = 3;  // seconds
		expired = 0.0;
		alpha = 0.0;
	}
	alpha = sin( expired/duration * 3.14159 );   // ramps up and down
	y-=1; 
	var _msg=global.room_desc
	var _x_scale=2
	var _y_scale=2
	var _offset = (string_width(_msg)*_x_scale)/2
	draw_text_ext_transformed_color((room_width/2)-_offset, room_height/2-50, _msg,0,room_width,_x_scale,_y_scale,0, c_teal, c_teal, c_blue, c_blue, alpha)
}

if !SPLASH {
	expired += 1.0/game_get_speed(gamespeed_fps);
	if ( expired > duration ) {
		instance_activate_all()
		instance_destroy(self,true)
	}
	alpha = sin( expired/duration * 3.14159 );   // ramps up and down
	y-=1; 
	var _msg = "S  T  A  R  T"
	var _x_scale=2
	var _y_scale=1
	var _offset = (string_width(_msg)*_x_scale)/2
	draw_text_ext_transformed_color((room_width/2)-_offset, room_height/2-50, _msg,0,room_width,_x_scale,_y_scale,0, c_teal, c_teal, c_blue, c_blue, alpha)
}