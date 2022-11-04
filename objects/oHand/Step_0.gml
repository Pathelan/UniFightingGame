/// @description Step



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




/* Select Card 
if (keyboard_check_pressed(ord("T"))) {
	if (CheckArray(array_get(c), cardSelected)) {
			
	}
}*/

// Shuffle
if (keyboard_check_pressed(ord("R"))) {
	ds_list_shuffle(hand);
}