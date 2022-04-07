/// @description Insert description here
// You can write your code in this editor

if (my_health <= 0) {
	dead = true
}

if dead {
	deadTime++
	if deadTime == 10 {
		instance_create_depth(0, 0, 0, FadeToGameOverScreen)
		instance_create_layer(x, y , "Instances", Explosion)
		audio_stop_sound(walkSound)
		instance_destroy()
	}
	exit
}

if !(throwing) {
	playerMovement()
}

if (speed > 0) {
	// Save last direction to throw with
	throwDir = direction
	
	if !audio_is_playing(walkSound) {
		walkSound = audio_play_sound(sndPlayerMove, 2, true)
	}
	audio_sound_pitch(walkSound, .5 + (speed/maxSpeed)/2)
	
	if dustTime >= 30 {
		repeat(random_range(3, 6)) {
			with instance_create_depth(x, bbox_bottom, depth + 1, SmallDust) {
				depthBase = other.depthBase + 1
				motion_set(other.direction + 180, random_range(1, 2.6))
			}
		}
	}
	if dustTime > 0 {
		dustTime -= 1
	}
	
	var dustChance = dustTime > 0 ? 20 : 10;
	if random(100) <= dustChance {
		with instance_create_depth(x, bbox_bottom, depth + 1, SmallDust) {
			depthBase = other.depthBase + 1
			motion_set(other.direction + 180, random_range(.6, 2))
		}
	}
}
else {
	dustTime = 30
	audio_stop_sound(walkSound)
}

var canUse = true;

//Pick up objects
if !(instance_exists(carrying)) {
	var picking = false
	if instance_exists(Pickup) && canUse {
		var n = instance_nearest(x, y, Pickup);
		if distance_to_object(n) <= interactRange && n.z <= 12{
			if button_pressed(inputs.use) {
				canUse = false
				picking = true
				sound_play(choose(sndPickup1, sndPickup2, sndPickup3))
				carrying = n
				n.carrier = self
				n.z = 0
				n.zspeed = 0
			}
		}
	}
	//Pick up Boards
	if !picking && canUse {
		var tilemap = layer_tilemap_get_id("Collision"),
			boardCheckX = x + lengthdir_x(20, throwDir),
			boardCheckY = (bbox_top + bbox_bottom)/2 + lengthdir_y(20, throwDir);
			
		if (tilemap_get_at_pixel(tilemap, boardCheckX, boardCheckY) == TILETYPE.BOARDS) {
			var boardCount = 0,
				boardDir = 0,
				floorCount = 0;
			for (var i = 0; i <= 3; i ++) {
				var offX = lengthdir_x(1, i * 90),
					offY = lengthdir_y(1, i * 90);
				var tile = tilemap_get_at_pixel(tilemap, boardCheckX + 32 * offX, boardCheckY + 32 * offY)
				if tile == TILETYPE.NONE {
					floorCount++
				}
				if tile == TILETYPE.BOARDS {
					boardDir = i * 90
					boardCount++
				}
				if boardCount > 1 break
			}
			
			var passed = ((boardCount == 1 && floorCount == 0) || boardCount == 0);
			if (boardCount == 1 && floorCount > 0) {
				var c = 1;
				while (c <= 10) {
					var tile = tilemap_get_at_pixel(tilemap, boardCheckX + lengthdir_x(32 * c, boardDir), boardCheckY + lengthdir_y(32 * c, boardDir));
					if (tile == TILETYPE.BOARDS && isBoardSupported(tilemap, boardCheckX + lengthdir_x(32 * c, boardDir), boardCheckY + lengthdir_y(32 * c, boardDir))) {
						passed = true
						break
					}
					else {
						if tile != TILETYPE.BOARDS {
							break
						}
					}
					c++
				}
			}
			
			if passed with instance_nearest(boardCheckX - boardCheckX mod TileWidth, boardCheckY - boardCheckY mod TileWidth, BoardPlaced) {
				sprite_index = sprBoardsYellow
			}
			
			if button_pressed(inputs.use) && passed {
				canUse = false
				tilemap_set_at_pixel(tilemap, TILETYPE.PIT, boardCheckX, boardCheckY)
				with instance_create_layer(x, y, "Instances", Board) {
					sound_play(choose(sndPickup1, sndPickup2, sndPickup3))
					other.carrying = self
					carrier = other
					z = 0
					zspeed = 0
				}
				with instance_nearest(boardCheckX - boardCheckX mod TileWidth, boardCheckY - boardCheckY mod TileWidth, BoardPlaced) {
					instance_destroy()
				}
			}
		}
	}
}

//Advance Text
if (canUse && instance_exists(GameCont) && GameCont.textProgress != -1) {
	if button_pressed(inputs.use) {
		canUse = false
		advanceTextPrompt()
	}
}
//Use Interactables
if (canUse && instance_exists(Interactable) && distance_to_object(Interactable) <= interactRange) {
	if button_pressed(inputs.use) {
		canUse = false
		with instance_nearest(x, y, Interactable) {
			alarm[0] = 1
		}
	}
}


//Throw Objects
if (instance_exists(carrying)) {
	if button_pressed(inputs.use) && canUse {
		var cancel = false
		//Place Boards
		if (carrying.object_index == Board) {
			var tilemap = layer_tilemap_get_id("Collision"),
				boardCheckX = x + lengthdir_x(20, throwDir),
				boardCheckY = (bbox_top + bbox_bottom)/2 + lengthdir_y(20, throwDir);

			if (tilemap_get_at_pixel(tilemap, boardCheckX, boardCheckY) == TILETYPE.PIT) && canPlaceBoard(tilemap, boardCheckX, boardCheckY) {
				canUse = false
				with carrying instance_destroy()
				tilemap_set_at_pixel(tilemap, TILETYPE.BOARDS, boardCheckX, boardCheckY)
				instance_create_depth(boardCheckX - boardCheckX mod TileWidth, boardCheckY - boardCheckY mod TileWidth, depthBase + 30, BoardPlaced)
			}
			else {
				cancel = tilemap_get_at_pixel(tilemap, boardCheckX, boardCheckY) == TILETYPE.PIT
			}
		}
		if !cancel && canUse {
			canUse = false
			with carrying {
				motion_set(other.throwDir, 8)
				on_throw(other)
			}
			carrying = noone
			throwing = true
			setPlayerSprites()
			sound_play(choose(sndThrow1, sndThrow2, sndThrow3))
		}
	}
}

//Blink if has iframes
if hurtFrames > 0 && sprite_index != spr_hurt {
	var _wait = hurtFrames > 30 ? 6 : 4;
	image_alpha = hurtFrames mod _wait > 1;
}else image_alpha = 1;

//Highlight nearest interactable or Pickup
var _int = noone,
    _pic = noone;
if instance_exists(Interactable) _int = instance_nearest(x, y, Interactable);
if instance_exists(Pickup) _pic = instance_nearest(x, y, Pickup);

if distance_to_object(_pic) < distance_to_object(_int){
	
	if distance_to_object(_pic)< interactRange && _pic.z <= interactRange && _pic != carrying _pic.nearest = true;
}else if distance_to_object(_int)< interactRange _int.nearest = true;

//Set Sprites
if !(throwing) {
	setPlayerSprites()
}
