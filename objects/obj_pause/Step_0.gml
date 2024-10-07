/// @description Insert description here
if keyboard_check_pressed(vk_escape) {
	global.unpause=true
	room_goto(global.fromroom)	
}