// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Hits a given target:
function hitmeHit(target){
	
	if (target.team != team && damage > 0){
		
		target.my_health -= target.object_index == Player ? 1 : damage;
		target.hurtFrames = target.object_index == Player ? 120 : 40;
		
		target.sprite_index = target.my_health <= 0 ? target.spr_dead : target.spr_hurt;
		target.image_index = 0;

		with instance_create_depth(target.x, target.y, target.depthBase + 4, HitmeHit) {self.target = target; sprite_index = target.spr_hit}
		sound_play(target.my_health <= 0 ? target.snd_die : target.snd_hurt, random_range(.9, 1.1), 1);
		if target.object_index == Player {
			screenShake(8, 3, 8);
			sleep(70);
		}else{

			screenShake(4, 2, 4);
		}
		
		return true;
	}
	return false;
}

// Optional check whether or not a target can be hit:
function hitmeCanHit(target){

	if target.hurtFrames <= 0 return true;
	return false;
}

// Creates an appropriate Corpse:
function corpseCreate(target){
	switch target.object_index{
		case EnemyTank:
			with instance_create_depth(x, y, depthBase, Corpse){

				damage = 2;
				sprite_index = other.spr_dead;
				right = other.image_xscale;
		
				zChange = -.3
				on_throw = function (thrower) {
	
				carrier = noone
					z = -carryOffset
					y -= carryOffset
					zSpeed = 3
					friction = airFriction
				}
				collisionType = COLLISIONS.LOW
			}
			repeat (4 + irandom(2)) with instance_create_depth(x, y, depthBase, CorpseMoaiDebris) {
		
				zspeed = 12 + irandom(8);
				z = 40;

				motion_set(random(360), random_range(7, 9))
			}
			break;
			
		case EnemyTurret:
			break;
		default:
			with instance_create_depth(x, y, depthBase, Corpse){ 
				
				sprite_index = other.spr_dead;
				right = other.image_xscale;
			}
			break;
	}
}
