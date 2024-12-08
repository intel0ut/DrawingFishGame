/// @description Reset hit flag for arms and boss
// 

arm1.can_take_hit=false
arm2.can_take_hit=false
if not (arm1.dead and arm2.dead) {
	can_take_hit=false
}