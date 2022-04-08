/// @description Set sprites
switch direction {

	case 0:
	spr_idle = sprGunBlockRight;
	spr_fire = sprGunBlockRightFire;
	break;
	case 90:
	spr_idle = sprGunBlockUp;
	spr_fire = sprGunBlockUpFire;
	break;
	case 180:
	spr_idle = sprGunBlockLeft;
	spr_fire = sprGunBlockLeftFire;
	break;
	case 270:
	spr_idle = sprGunBlockDown;
	spr_fire = sprGunBlockDownFire;
	break;
}
gunangle = direction;
