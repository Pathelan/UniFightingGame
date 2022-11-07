/// @description Step

// Parallax Backgrounds
layer_x(bgClose,	-lerp(0, oCamera.x, 20)	);
layer_x(bgMid,		-lerp(0, oCamera.x, 30)	);
layer_x(bgFar,		-lerp(0, oCamera.x, 50)	);

var camX = camera_get_view_x(view_camera[0]);


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
