/// @description Reactivate owner

instance_activate_object(owner)
if instance_exists(owner) {
	owner.z = camera_get_view_height(view_camera[0])
	owner.x = Player.x
	owner.y = Player.y
}

