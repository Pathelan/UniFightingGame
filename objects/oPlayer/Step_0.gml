/// @description Step


// Smooth Player Damage
if (smoothHealth == true) {
	if (playerLastHealth > playerHealth) {
		playerLastHealth = floor(lerp(playerLastHealth, playerHealth, 0.075));
	} else if (playerLastHealth <= playerHealth) {
		smoothHealth = false;	
	}
}

// Death
if (playerLastHealth <= 0) {
	game_restart();	
}




// --== Debug ==--


// Close Game
if (keyboard_check(vk_escape)) {
	game_end();	
}

// Restart
if (keyboard_check(ord("R"))) {
	game_restart();
}

// Take Damage
if (keyboard_check_pressed(ord("X"))) {
	playerHealth -= 10;
	alarm[0] = room_speed/2;
}

// Take More Damage
if (keyboard_check_pressed(ord("Z"))) {
	playerHealth -= 25;
	alarm[0] = room_speed/2;
}

// Heal Player
if (keyboard_check_pressed(ord("C"))) {
	playerHealth += 10;
	playerLastHealth = playerHealth;
}
