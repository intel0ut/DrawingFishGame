/// @description Insert description here
// You can write your code in this editor
if (instance_number(obj_food) < 2) {
	instance_deactivate_object(self)
} else {
	instance_destroy(self)
}