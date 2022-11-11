/// @description Step

// Clamp Health
playerHealth = min(playerMaxHealth, playerHealth);

// Smooth Player Damage
if (smoothHealth == true) {
	if (playerLastHealth > playerHealth) {
		playerLastHealth = lerp(playerLastHealth, playerHealth, 0.025);
	} else if (playerLastHealth <= playerHealth) {
		smoothHealth = false;	
	}
}

// Death
if (playerLastHealth <= 0) {
	oHand.playerDeath = true;
}




// --== Debug ==--


// Close Game
if (keyboard_check(vk_escape)) {
	game_end();	
}

