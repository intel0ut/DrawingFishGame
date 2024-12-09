/// @description Insert description here
// 

menu_x=x
menu_y=y
button_h=55
button_w=100 // offset from center so button will be 2x button_w

// button names
button[0]="P l a y  G a m e"
button[1]="H e l p"
button[2]="C r e d i t s"
button[3]="Q u i t  G a m e"
buttons=array_length(button)

menu_index=0
last_selected=0

// start playing music
if not audio_is_playing(snd_menu_music) {
	audio_stop_all()
}
 
global.level_music=audio_play_sound(snd_menu_music, 50, true)