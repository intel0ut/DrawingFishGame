/// @description health bar drawing
// You can write your code in this editor

// Draw HP bar
draw_sprite(spr_hp_bar_bg,0,healthbar_x,healthbar_y)
draw_sprite_stretched(spr_hp,0,healthbar_x,healthbar_y,min((player_hp/max_hp) * healthbar_width, healthbar_width-5), healthbar_height)
draw_sprite(spr_hp_bar_border,0,healthbar_x,healthbar_y)

draw_text_transformed_colour(20, healthbar_y-13, "Level",1, 0.8, 0, c_aqua, c_aqua, c_blue, c_blue, 1);
draw_text_transformed_colour(150, healthbar_y-13, string(player_level), 1, 0.8, 0, c_aqua, c_aqua, c_blue, c_blue, 1);
