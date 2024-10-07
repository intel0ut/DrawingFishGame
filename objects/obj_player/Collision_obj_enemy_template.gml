if instance_exists(other) {
    var enemy_id=other.id
    if player_level <= (enemy_id.level/2) and can_take_hit {
        // game over
		can_take_hit=false
		global.pause=true
        global.lifes-=1
        if global.lifes < 0 {
            global.MessageBox(room_width/2, room_height/2, "Game Over!", c_red, c_red, c_maroon, c_maroon, 84, 3, 0, 0)
			alarm[1]=game_get_speed(gamespeed_fps)*3
		}
        else {
			global.MessageBox(room_width/2, room_height/2, "You Died!", c_red, c_red, c_maroon, c_maroon, 84, 2, 0, 0)
            alarm[2]=game_get_speed(gamespeed_fps)*2
		}
    }

    //player takes hit
    if can_take_hit {
        if player_level > (enemy_id.level/2) and player_level < enemy_id.level {
            var _hit=player_hp-(enemy_id.food*2)
            player_hp=max(_hit,0)
            can_take_hit=false
            alarm[0] = game_get_speed(gamespeed_fps)
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
            global.MessageBox(x, bbox_top-20, "Level Up!", c_aqua, c_aqua, c_teal, c_teal, 36, 1.5, 0, -1)
        }
    }
}