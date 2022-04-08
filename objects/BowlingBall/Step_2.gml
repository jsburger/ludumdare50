/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// make it drop into pits:
var _x = x - hspeed * 4,
    _y = y - vspeed * 4;
var hole = place_meeting(_x, _y, Hole);
	if (hole || getTileAt(_x, _y) == TILETYPE.PIT) && z <= 0 {
		if ((object_index != ScrapPickup && object_index != ComdeyPickup) || !hole) {
			with instance_create_depth(x, y, depthBase, PitFall) {
				sprite_index = other.sprite_index
				image_index = other.image_index;
				
				motion_add(other.direction, other.speed);
				owner = other
				if hole {
					goalX = Hole.x
					goalY = Hole.y
				}
			}
			speed = 0;
			instance_deactivate_object(self)
		}
	}

