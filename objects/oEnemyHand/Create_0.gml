/// @description Variables

// Get Variables from Game Object
g = oGame;

// Cards
c[0] = 1;
c[1] = 2;
c[2] = 3;

// Card Variables
maxCardsInPlay = 2; // (Add 1 since Arrays start at 0) How many cards can be played at once.

// Dice Variables
diceRoll = false;
diceNumber = 0;
diceTimer = 0; // How Long the Dice initially Rolls for
diceDraw = false;

// Card Data
eHand = ds_list_create();
deckSize = sprite_get_number(sCard);

for (var i=0; i<deckSize; ++i) {
	ds_list_add(eHand, i);	
}

ds_list_shuffle(eHand);