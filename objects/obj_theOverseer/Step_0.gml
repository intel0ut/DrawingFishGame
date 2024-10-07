/// @description Insert description here

if keyboard_check_pressed(vk_escape) {
	global.ret=sprite_create_from_surface(application_surface,0,0,room_width,room_height,false,true,0,0)
	global.fromroom=room
	room_persistent=true
	room_goto(pauseroom)
}