/// @description Insert description here
// You can write your code in this editor
expired += 1.0/room_speed;
if ( expired > duration ) instance_destroy();
alpha = sin( expired/duration * 3.14159 );   // ramps up and down
y-=1; 
image_alpha=alpha