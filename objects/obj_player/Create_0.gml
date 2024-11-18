/// @description initialize available food and player stats
// You can write your code in this editor

player_size=4/global.player_level
image_xscale=1/player_size
image_yscale=1/player_size

//setup HP bar
healthbar_width=512
healthbar_height=16
healthbar_x=(room_width/2)-(healthbar_width/2)
healthbar_y=16

xpbar_width=healthbar_width
xpbar_height=4
xpbar_x=healthbar_x
xpbar_y=38

blink_duration=6
blink_timer=blink_duration
