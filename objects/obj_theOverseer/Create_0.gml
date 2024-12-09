/// @description Insert description here
// You can write your code in this editor

random_set_seed(current_time)
randomize()

// debug stuff
global.debug=false

// player init
if global.debug {
	global.player_level=20
} else {
	global.player_level=1
}
global.player_scale=0.5

global._inst_player=instance_create_layer(room_width/2, room_height/2,layer,obj_player)

global.lifes=5
global.score=0

global.player_xp=0
global.next_level_xp=100
global.player_max_hp=100
global.player_hp=global.player_max_hp

global.chase_distance=350
global.pause=false
global.restart=false

global._bubble_font=font_add("fonts/Lets Eat.otf", 48, false, false, 32, 128)
font_enable_sdf(global._bubble_font,true)
font_sdf_spread(global._bubble_font, 16)
draw_set_font(global._bubble_font);

font_enable_effects(global._bubble_font, true, {
    dropShadowEnable: true,
    dropShadowSoftness: 20,
    dropShadowOffsetX: 3,
    dropShadowOffsetY: 3,
    dropShadowAlpha: 0.5,
    outlineEnable: true,
    outlineDistance: 1,
    outlineColour: c_blue,
    glowEnable: true,
    glowEnd: 3,
    glowColour: c_blue,
    glowAlpha: 4
})

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
