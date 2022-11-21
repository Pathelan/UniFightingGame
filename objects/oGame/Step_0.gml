/// @description Step

switch (phase) {
	case battlePhase.pDraw:
		p.alarm[0] = room_speed/2; // Play Health Reduction animation
		e.alarm[0] = room_speed/2; // Play Health Reduction animation
		reduceHealth = false;
		break;	
		
		
	case battlePhase.pAttack:
		
		// ALL ATTACK CODE GOES HERE
		
		break;
}

if (keyboard_check_pressed(vk_space)) {
	phase = battlePhase.pAttack;	
}