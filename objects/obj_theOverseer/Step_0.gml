/// @description Insert description here
// You can write your code in this editor

for (i=0; i< global.lifes; i++) {
	instance_create_layer(room_width-(global.lifes * 37)+(i*37) , 15,layer,obj_life)	
}