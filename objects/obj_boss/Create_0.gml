/// @description Insert description here
// 

enemy_hp=400
dir=true
path_start(pth_boss, 1,path_action_continue,true)
path_x=-1
path_y=-1
path_pos=-1

alarm[0] = irandom_range(7,15) * game_get_speed(gamespeed_fps)
state="IDLE"
anim_count=0

hp_boss=400

arm1=instance_create_layer(x-8, y-38, layer, obj_boss_arm1)
arm2=instance_create_layer(x-5, y-23, layer, obj_boss_arm2)

var arm_xscale=image_xscale //* 0.6
var arm_yscale=image_yscale //* 0.6
arm1.image_xscale=arm_xscale
arm1.image_yscale= arm_yscale
arm2.image_xscale=arm_xscale
arm2.image_yscale= arm_yscale

can_take_hit=false
dmg_timer=5

global.attack_x = 0
global.attack_y = 0