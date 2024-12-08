/// @description Insert description here
// 

if state == "ATK" {
	anim_count+=1
	if anim_count==2 {
		anim_count=0
		state="IDLE"
		arm1.state="IDLE"
		arm2.state="IDLE"
		if arm1.dead and arm2.dead {
			can_take_hit=true
			arm1.sprite_index=idle_arm1_dead
			arm2.sprite_index=idle_arm2_dead
			arm1.can_take_hit=false
			arm2.can_take_hit=false
		} else {
			arm1.sprite_index=idle_arm1
			arm2.sprite_index=idle_arm2
			arm1.can_take_hit=true
			arm2.can_take_hit=true
		}
		alarm[1]=game_get_speed(gamespeed_fps) * dmg_timer // can take damage for XX seconds 
	}
}

if state == "SPECIAL"
	state = "IDLE"