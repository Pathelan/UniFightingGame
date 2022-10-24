/// @description Initialise Variables
randomise();

// Get Variables from Game Object
g = oGame;

// Variables
handSize = 0; // Amount of Cards that will be played in the hand
maxHandSize = 5; // Maximum amount of Cards that can be in the hand at one time.
maxCardsInPlay = 2; // (Add 1 since Arrays start at 0) How many cards can be played at once.

// UI
cardSelected = 0;


// Cards
cardsHeld = 0;
c[0] = -1;
c[1] = -1;
c[2] = -1;

// Add Cards to hand
alarm[0] = room_speed;

// Shuffle Deck every 10 seconds
alarm[1] = room_speed*10;


// Card Data
hand = ds_list_create();
deckSize = sprite_get_number(sCard);



for (var i=0; i<deckSize; ++i) {
	ds_list_add(hand, i);	
}

ds_list_shuffle(hand);