/// @description Step



// --== Debug ==--

if (keyboard_check_pressed(ord("Q")) && maxHandSize > 0) {
	// Reduce hand size and clamp
	maxHandSize --;
	handSize --;
	alarm[0] = room_speed*3;
}

// Increase Hand Size
if (keyboard_check_pressed(ord("E"))) {
	maxHandSize ++;
	alarm[0] = room_speed;
}

// Increase Selected Card Size
if (keyboard_check_pressed(ord("G"))) {
	if (cardSelected + 1 < handSize) { // Loop back to start
		cardSelected ++;
	} else {
		cardSelected = 0;	
	}
}

// Decrease Selected Card Size
if (keyboard_check_pressed(ord("F"))) {
	if (cardSelected - 1 < 0) {
		cardSelected = handSize-1;
	} else {
		cardSelected --;	
	}
}

// Select Card
if (keyboard_check_pressed(ord("T"))) {
	scrSelectCard(cardSelected);
}




/* Select Card 
if (keyboard_check_pressed(ord("T"))) {
	if (CheckArray(array_get(c), cardSelected)) {
			
	}
}*/

// Shuffle
if (keyboard_check_pressed(ord("W"))) {
	ds_list_shuffle(hand);
}