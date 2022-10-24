/// @description Step



// --=== Debug ==--

if (keyboard_check_pressed(vk_space)) {
	switch (phase) {
		case battlePhase.pDraw:
			phase = battlePhase.pAttack; // Set Phase
			phaseText = "Attack Phase"; // Set text
			scrShuffleHand(); // Shuffle Hand
			break;
			
			
		case battlePhase.pAttack:
			phase = battlePhase.pDraw; // Set Phase
			phaseText = "Draw Phase"; // Set Text
			scrShuffleHand(); // Shuffle Hand
			break;
	}
}
