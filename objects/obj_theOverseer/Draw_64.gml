/// @description draw sprites for remaining lifes
// You can write your code in this editor

for (i=0; i< global.lifes; i++) {
	draw_sprite_part(spr_life,-1,0,0,32,32,room_width-50-(global.lifes * 37)+(i*37) , 15)	
}
