/// @description Initialise Variables



// Player Variables
playerMaxHealth = 40;
playerHealth = playerMaxHealth;
playerLastHealth = playerHealth;

// Attack Variables
playerAttack = 0;
playerFocus = false;
playerRecoil = false;
playerPunchConsecutive = 0;


// WORK ON CARD ATTACKS TOMORROW


// Defence Variables
playerDefence = 0;
playerDodge = false;
playerGrab = false;


// Draw Variables
smoothHealth = false;


// Create Cursor object if it doesn't exist
if (!instance_exists(oCursor)) {
	instance_create_depth(0,0,-100,oCursor);
}

