/// @description Insert description here
// You can write your code in this editor
event_inherited();
if landed && speed > 0{
	sprite_index = sprBowlingBallRoll
	if !irandom(3) with instance_create_depth(x, y, depthBase + 2, choose(SmallDust, SmallDust, SmallDust, SmallDust, SmallDust, SmallDust, SmallSmoke)){motion_add(other.direction + 180 + random_range(-10, 10), random_range(2, 4))}
}
else {
	sprite_index = sprBowlingBall
}
