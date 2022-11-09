/// @description Roll Dice

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
