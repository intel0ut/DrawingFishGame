/// @description health bar drawing
// You can write your code in this editor

// Draw HP bar
draw_sprite_stretched(spr_hp_bar_bg,0,healthbar_x-2,healthbar_y-2, healthbar_width, healthbar_height+4)
draw_sprite_stretched(spr_hp,0,healthbar_x,healthbar_y,min((global.player_hp/global.player_max_hp) * healthbar_width, healthbar_width-5), healthbar_height)
draw_sprite_stretched(spr_hp_bar_border,0,healthbar_x-2,healthbar_y-2, healthbar_width, healthbar_height+4)

// Draw XP bar
draw_sprite_stretched(spr_hp,3,xpbar_x,xpbar_y,min((global.player_xp/global.next_level_xp) * xpbar_width, xpbar_width-5), xpbar_height)


// Score (shows level for now)
draw_text_transformed_colour(20, healthbar_y-13, "Level",1, 0.8, 0, c_aqua, c_aqua, c_blue, c_blue, 1);
draw_text_transformed_colour(150, healthbar_y-13, string(global.player_level), 1, 0.8, 0, c_aqua, c_aqua, c_blue, c_blue, 1);


// DEBUG
if global.debug {
	draw_set_font(fnt_debug_font)
	draw_text(20, room_height-60,"Player HP: " + string(global.player_hp))
	draw_text(20, room_height-40,"Player XP: " + string(global.player_xp))
	draw_text(20, room_height-20, "Player Level: " + string(global.player_level))
	draw_set_font(global._bubble_font);
}