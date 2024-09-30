/// @description Insert description here
// You can write your code in this editor
var _bubble_font=font_add("fonts/Lets Eat.otf", 48, false, false, 32, 128)
font_enable_sdf(_bubble_font,true)
font_sdf_spread(_bubble_font, 16)
draw_set_font(_bubble_font);

font_enable_effects(_bubble_font, true, {
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
global.player_level=1
global.player_xp=0
