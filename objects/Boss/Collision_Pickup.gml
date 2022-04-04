/// @description Take Damage
// You can write your code in this editor

var damage = 5;
//Check for Bowling Ball. Increase damage
if other.object_index == BowlingBall damage *= 2

scrHurtBoss(damage)

with other {
	instance_create_depth(x, y - z, depth, DustTop)
	instance_destroy()
}
