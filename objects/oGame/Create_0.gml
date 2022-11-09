/// @description Initialise Variables
p = oPlayer;
e = oEnemy;


// Parallax Variables
bgClose = layer_get_id("bgForestClose");
bgMid = layer_get_id("bgForestMid");
bgFar = layer_get_id("bgForestFar");

phaseText = "Draw Phase";

// Phases of Battle
phase = battlePhase.pDraw;
enum battlePhase{
	pDraw,
	pAttack,
}

// Phases Variables
currentCombatPhase = 0;
maxCombatPhases = 6;

phaseAlarm = false;
enemyAttack = false;
reduceHealth = true;

pAttackDone = false; // If player's attack has been done
eAttackDone = true; // If enemy's attack has been done

lastAttack = "";
