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



// --== Debug ==--


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

// Roll Dice
if (keyboard_check_pressed(ord("H"))) {
	diceRoll = true;
	diceDraw = true;
	diceTimer = room_speed*.75;
	var snd = choose(sfxDiceRoll1, sfxDiceRoll2);
	audio_play_sound(snd, 10, false);
	
	// Dice Sound 1: https://freesound.org/people/John_Dark_Souls/sounds/618288/
	// Dice Sound 2: https://freesound.org/people/Aesterial-Arts/sounds/633852/
}


/* Select Card 
if (keyboard_check_pressed(ord("T"))) {
	if (CheckArray(array_get(c), cardSelected)) {
			
	}
}*/

// Shuffle
if (keyboard_check_pressed(ord("R"))) {
	ds_list_shuffle(hand);
}