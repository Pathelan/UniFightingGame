/// @description Create Hand

instance_create_layer(x, y, "Instances", oEnemyHand);

// Health
enemyMaxHealth = 40;
enemyHealth = enemyMaxHealth;
enemyLastHealth = enemyHealth;

smoothHealth = false;

// Attack Variables
enemyAttack = 0;
enemyFocus = false;
enemyRecoil = false;
enemyPunchConsecutive = 0;


// Defence Variables
enemyDefence = 0;
enemyDodge = false;
enemyGrab = false;