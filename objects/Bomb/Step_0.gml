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
if lit {
	
	if !irandom(2) repeat(choose(1, 1, 2)) with instance_create_depth(x + smoke_x * right, y + smoke_y - z, depthBase - 5, SmallSmoke){
	
		motion_add(90 + random_range(-20, 20), random_range(2, 4));
	}
	if timer <= room_speed * 1{
	
		sprite_index = sprBombAboutToExplode
	}

	if timer-- <= 0{
	
		instance_destroy(self, true);
	}
}
