/// @description Initialise Variables
p = oPlayer;
e = oEnemy;

phaseText = "Draw Phase";

// Phases of Battle
phase = battlePhase.pDraw;
enum battlePhase{
	pDraw,
	pAttack,
}

// Phases Variables
currentCombatPhase = 1;
maxCombatPhases = 6;

phaseAlarm = false;
enemyAttack = false;
reduceHealth = true;

pAttackDone = false; // If player's attack has been done
eAttackDone = true; // If enemy's attack has been done

lastAttack = "";
