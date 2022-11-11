/// @description Smoothly Move towards Target

// Get Target Position
targetX = target.x;
targetY = target.y;

// Switch Targets depending on Phase
if (instance_exists(oPlayer)) {
	switch (g.phase) {
		case battlePhase.pDraw:
			targetX = floor((oPlayer.x + oEnemy.x)/6);
			targetY = oPlayer.y;
			break;
	
		case battlePhase.pAttack:
			targetX = floor((oPlayer.x + oEnemy.x)/2);
			targetY = oPlayer.y;
			break;
	}
} else {
	targetX = room_width/2;
	targetY = room_height/2;
}

// Smoothly move towards target
x += ((targetX - x)*.05);
y += ((targetY - y)*.05);
