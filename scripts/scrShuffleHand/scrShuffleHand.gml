function scrShuffleHand() {
	
	// Shuffle Hand
	if (instance_exists(oHand)) {
		with (oHand) { // Run code through the Hand Object
			
				// Shuffle Hand and reset number of cards.
				ds_list_shuffle(oHand.hand);
				handSize = 0;
				alarm[0] = room_speed/2;
		}
	}
	
	// Shuffle Enemy Hand
	if (instance_exists(oEnemyHand)) {
		with (oEnemyHand) { // Run code through the Hand Object
			
				// Shuffle Hand and reset number of cards.
				ds_list_shuffle(oEnemyHand.eHand);
		}
	}
}