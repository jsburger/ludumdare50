/// @description Randomize sprite
event_inherited()
active = false;
image_speed = 0

switch irandom(2) {

	case 0: 
		spr_up = sprToggleWallA;
		spr_down = sprToggleWallAReverse;
		break;
	case 1: 
		spr_up = sprToggleWallB;
		spr_down = sprToggleWallBReverse;
		break;
	case 2: 
		spr_up = sprToggleWallC;
		spr_down = sprToggleWallCReverse;
		break;
}
