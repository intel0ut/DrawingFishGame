/// @description Every 5 frames check if we finished all enemies and move to next room
// You can write your code in this editor
if !instance_find(obj_enemy_lvl1,0) and
   !instance_find(obj_enemy_lvl1_dead,0) and
   !instance_find(obj_enemy_lvl2,0) and
   !instance_find(obj_enemy_lvl2_dead,0) and
   !instance_find(obj_enemy_lvl3,0) and
   !instance_find(obj_boss,0) {
	   if room != MarianaTrench {
		   room_goto_next()
	   }
}

alarm[0]=5