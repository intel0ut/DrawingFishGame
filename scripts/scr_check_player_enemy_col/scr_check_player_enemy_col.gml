// @description check if player collided with enemy and process hit. 
//              If player level > enemy level, player eats enemy
function scr_check_player_enemy_col(){
	
	if instance_exists(other) {
		var enemy_id=other.id
		if player_level <= (enemy_id.level/2) {
			// game over
			global.lifes-=1
			if global.lifes < 0
			    // need to show a game over message 
				game_restart()
			else
				room_restart()
		}

		//player takes hit
		if can_take_hit {
			if player_level > (enemy_id.level/2) and player_level < enemy_id.level {
				var _hit=player_hp-(enemy_id.food*2)
				player_hp=max(_hit,0)
				can_take_hit=false
				alarm[0] = 20
				if player_hp==0 {
					player_hp=max_hp-abs(_hit)
					player_level-=1
					player_size=8/player_level
				}
			}
		}

		// player eats enemy
		if player_level >= enemy_id.level {
			player_hp=player_hp+enemy_id.food
			if (player_hp >= max_hp) {
				player_level+=1
				player_size=8/player_level
				player_hp=player_hp-max_hp
				instance_create_layer((room_width/2),(room_height/3),layer,obj_level_up)
			}
		}
	}
}