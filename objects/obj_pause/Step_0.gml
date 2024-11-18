/// @description Insert description here
if keyboard_check_released(vk_escape) {
	room_persistent=false
	global.pause=false
	global.restart=true
	room_goto(global.fromroom)	
}