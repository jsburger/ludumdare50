/// @description Insert description here
// You can write your code in this editor

timer += 1

if timer >= 10 {
	image_angle += 45 + random(30)
	timer = 0
	if !irandom(6) instance_create_depth(x, y, depthBase, SmallDust)
}
