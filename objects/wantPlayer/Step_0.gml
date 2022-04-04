/// @description Insert description here
// You can write your code in this editor

if instance_exists(Player) {
	Player.x = x
	Player.y = y
}
else instance_create_layer(x, y, "Instances", Player)
instance_destroy()
