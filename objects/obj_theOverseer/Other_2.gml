/// @description Insert description here
// You can write your code in this editor
global._bubble_font=font_add("fonts/Lets Eat.otf", 48, false, false, 32, 128)
font_enable_sdf(global._bubble_font,true)
font_sdf_spread(global._bubble_font, 16)
draw_set_font(global._bubble_font);

font_enable_effects(global._bubble_font, true, {
    dropShadowEnable: true,
    dropShadowSoftness: 20,
    dropShadowOffsetX: 3,
    dropShadowOffsetY: 3,
    dropShadowAlpha: 0.5,
    outlineEnable: true,
    outlineDistance: 1,
    outlineColour: c_blue,
    glowEnable: true,
    glowEnd: 3,
    glowColour: c_blue,
    glowAlpha: 4
})

global.lifes=5
global.score=0

global.player_xp=0
global.next_level_xp=100
global.player_max_hp=100
global.player_hp=global.player_max_hp

global.chase_distance=350
global.pause=false
global.unpause=false


// debug stuff

global.debug=true