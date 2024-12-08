/// @description Attack State Machine
// 


if (arm1.dead and arm2.dead) {
	return // both arms are dead so we can't attack anymore	
}

if state=="IDLE" {
	can_take_hit=false
	// choose type of attack
	var _chance=irandom(100)
	if _chance <=100 {
		state="SPECIAL"
		arm1.state="SPECIAL"
		arm2.state="SPECIAL"
		arm1.image_alpha=0
		arm2.image_alpha=0	
		sprite_index=kraken_whirlpool
		image_index=0
		global.attack_x = global._inst_player.x
		global.attack_y = global._inst_player.y
	}
	else if _chance <= 40 { //attack1
		if not arm1.dead {
			state="ATK"
			arm1.state="ATK"
			arm2.state="IDLE"
			arm1.sprite_index=kraken_attack1_arm1
		}
	} else if _chance > 40 and _chance <=80 { // attack2
		if not arm2.dead {
			state="ATK"
			arm1.state="IDLE"
			arm2.state="ATK"
			arm2.sprite_index=kraken_attack2_arm2
		}		
	} else if _chance > 80 and _chance <=95 { // attack3
		state="ATK"
		arm1.state="ATK"
		arm2.state="ATK"
		arm1.sprite_index=kraken_attack3_arm1
		arm2.sprite_index=kraken_attack3_arm2		
	} else { //attack4
		state="SPECIAL"
		arm1.state="SPECIAL"
		arm2.state="SPECIAL"
		arm1.image_alpha=0
		arm2.image_alpha=0	
		sprite_index=kraken_whirlpool
		image_index=0
	}
	
}

alarm[0] = irandom_range(5,10) * game_get_speed(gamespeed_fps)
