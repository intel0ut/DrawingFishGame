/// @description Insert description here
// You can write your code in this editor

random_set_seed(current_time)
randomize()

global.player_level=1

global._inst_player=instance_create_layer(room_width/2, room_height/2,layer,obj_player)

global.MessageBox = function (_x, _y, _text="", _color1=c_aqua, _color2=c_aqua, _color3=c_aqua, _color4=c_aqua, _font_size=48,_timeout=0, _scroll_x=0, _scroll_y=0) {
	if _x == NaN or _y == NaN {
		return
	}
	if _text == "" or _text == pointer_null {
		return
	}
	
	global.message_layer=layer_create(-250)
	
	instance_create_layer(_x,_y,global.message_layer,obj_MessageBox, 
	{
		x_pos : _x,
		y_pos : _y,
		msg : _text,
		c1 : _color1,
		c2 : _color2,
		c3 : _color3,
		c4 : _color4,
		font_size : _font_size,
		duration : _timeout,
		scroll_x : _scroll_x,
		scroll_y : _scroll_y
	})
	
}