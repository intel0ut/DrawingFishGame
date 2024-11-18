/// @description Insert description here
// 

if state == "ATK" {
	anim_count+=1
	if anim_count==2 {
		anim_count=0
		state = "IDLE"
		arm1.sprite_index=spr_arm1_idle
		arm2.sprite_index=spr_arm2_idle
		arm1.can_take_hit=true
		arm2.can_take_hit=true
		if arm1.dead and arm2.dead {
			can_take_hit=true	
		}
		alarm[1]=game_get_speed(gamespeed_fps) * DMG_TIMER // can take damage for XX seconds 
	}
}