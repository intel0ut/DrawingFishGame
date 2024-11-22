/// @description Insert description here
// 

if state=="IDLE" {
	state="ATK"
	if not arm1.dead or not arm2.dead {
		can_take_hit=false
	}

	var _chance=irandom(100)
	if _chance <= 40 { //attack1
		if not arm1.dead {
			arm1.sprite_index=spr_arm1_attack
		}
		if not arm2.dead {
			arm2.sprite_index=spr_arm2_idle
		}

	} else if _chance >= 60 {
		if not arm2.dead {
			arm2.sprite_index=spr_arm2_attack
		}
		if not arm1.dead {
			arm1.sprite_index=spr_arm1_idle
		}
		
	} else { // attack with both arms
		if not arm2.dead {
			arm2.sprite_index=spr_arm2_attack
		}
		if not arm1.dead {
			arm1.sprite_index=spr_arm1_attack
		}
	}
}
	
alarm[0] = irandom_range(5,10) * game_get_speed(gamespeed_fps)