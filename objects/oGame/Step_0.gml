/// @description Step



// --=== Debug ==--

if (keyboard_check_pressed(vk_space)) {
	switch (phase) {
		case battlePhase.pDraw:
			phase = battlePhase.pAttack; // Set Phase
			phaseText = "Attack Phase"; // Set text
			break;
			
			
		case battlePhase.pAttack:
			phase = battlePhase.pDraw; // Set Phase
			phaseText = "Draw Phase"; // Set Text
			scrShuffleHand(); // Shuffle Hand
			with (oHand) { // Reset Hand when turning to draw phase
				for (var k=0; k<maxCardsInPlay+1; k++) {
					c[k] = -1;	
				}
			}
			
			break;
	}
}
