/// @description Step

// Roll Dice
if (diceRoll == true && diceTimer > 0) {
	
	diceTimer--;
} else if (diceRoll == true && diceTimer <= 0) {
	if (diceRoll == true) {
		diceNumber = irandom_range(1, 20);
	}
	diceRoll = false;
	alarm[1] = room_speed*2;
}

// Start Attack Phase

if (keyboard_check_pressed(vk_space) && c[0] != -1 && c[1] != -1 && c[2] != -1) { // Check if All Cards have been selected
	with (g) { // In oGame
		if (phase != battlePhase.pAttack) {
			phase = battlePhase.pAttack; // Set Phase to Battle if it isn't already set
		}
	}
}


// Increase Selected Card Size
if (keyboard_check_pressed(ord("E"))) {
	if (cardSelected + 1 < handSize) { // Loop back to start
		cardSelected ++;
	} else {
		cardSelected = 0;	
	}
}

// Decrease Selected Card Size
if (keyboard_check_pressed(ord("Q"))) {
	if (cardSelected - 1 < 0) {
		cardSelected = handSize-1;
	} else {
		cardSelected --;	
	}
}

// Select Card
if (keyboard_check_pressed(ord("W"))) {
	scrSelectCard(cardSelected);
}

// Reset Cards
if (keyboard_check_pressed(ord("S"))) {
	c[0] = -1;
	c[1] = -1;
	c[2] = -1;
}

if (playerDeath == true || enemyDeath == true && keyboard_check_pressed(vk_space)) {
	// Reset Game
	game_restart();
}