/// @description Initialise Variables
randomise();

// Get Variables from Game Object
g = oGame;

// Variables
handSize = 0; // Amount of Cards that will be played in the hand
maxHandSize = 5; // Maximum amount of Cards that can be in the hand at one time.
maxCardsInPlay = 2; // (Add 1 since Arrays start at 0) How many cards can be played at once.

// Win/Loss Conditions
playerDeath = false;
enemyDeath = false;
playerWinText = choose(
"You did it. You did the unfathomable.\nYou Defeated the enemy!\nCONGRATULATIONS.\nSpace to return to main menu.",
"Despite the odds being against you.\nYou Came out on top.\nCONGRATULATIONS.\nSpace to return to main menu.",
"CONGRATULATIONS.\nYou overcame everything.\nEven your greatest fears.\nCONGRATULATIONS.\nSpace to return to main menu."
);

enemyWinText = choose(
"It seems luck wasn't on your side.\nBut Don't give up yet...\nSpace to return to main menu.",
"Overcoming foes isn't trivial.\nLuckily you get another shot...\nSpace to return to main menu.",
"It would seem your skills are lacking...\nPerhaps another duel?\nSpace to return to main menu."
);

// Credits
creditsText = "Producer - Josephine B\nProgramming - Ashe L\nMenu - Ethan S\nUI Art - Bailey O'H\nCharacter Art - Flynn C\nSong: Kikuo - Boy Sorcerer";

//Draw Vars
cardX = 350;
cardXMultiplier = 240;
cardY = 700;
cardColour = c_white;
cardScale = 1;

// Dice Variables
diceRoll = false;
diceNumber = 0;
diceTimer = 0; // How Long the Dice initially Rolls for
diceDraw = false;

// UI
cardSelected = 0;

// Cards
cardsHeld = 0;
c[0] = -1;
c[1] = -1;
c[2] = -1;

// Add Cards to hand
alarm[0] = room_speed;


// Card Data
hand = ds_list_create();
deckSize = sprite_get_number(sCard);

for (var i=0; i<deckSize; ++i) {
	ds_list_add(hand, i);	
}

ds_list_shuffle(hand);