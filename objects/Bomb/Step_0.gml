/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_xscale = 1.2
image_yscale = 1.2

if carrier != -4{
	
	lit = true
	sprite_index = sprBombLit
}
if lit && timer <= room_speed * 1{
	
	sprite_index = sprBombAboutToExplode
}

if lit && timer-- <= 0{
	
	instance_destroy(self, true);
}
