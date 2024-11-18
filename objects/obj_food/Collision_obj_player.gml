/// @description Insert description here
// You can write your code in this editor
audio_play_sound(sfx_food, 10, false)
if (instance_number(obj_food) < 2) {
	instance_deactivate_object(self)
} else {
	instance_destroy(self)
}