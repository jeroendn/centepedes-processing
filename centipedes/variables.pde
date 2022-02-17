final color backgroundColor = #ffffff;
final color textColor = #000000;

int scorePlayer1;
int scorePlayer2;
int countCentipedeSegmentsPlayer1;
int countCentipedeSegmentsPlayer2;
boolean inGame;
boolean isPlayer1;
boolean isMultiplayer;
String lastCollidedWith;

int timeInMillis;
final int turnTimeInMillis = 20000;
final int gameboardSquareSize = 25;
int gameboardSizeY = 8;
int gameboardSizeX = 16;
int fruitAmount;
int cherryAmount;
int chameleonAmount;

// Gameboard items
int[][] gameboard;
final int emptyId = 0;
final int visitedId = 1;
final int bananaId = 6;
final int cherryId = 7;
final int chameleonId = 8;

// Gameboard centipede positions
int[][] centipedePositionsPlayer1;
int[][] centipedePositionsPlayer2;
final int centipedeHeadPlayer1Id = 2;
final int centipedeHeadPlayer2Id = 3;
final int centipedeSegmentPlayer1Id = 4;
final int centipedeSegmentPlayer2Id = 5;

// Gameboard item colors mapped by id as index
final color[] gameboardItemColors = {
  #ffffff,
  #dddddd,
  #000000,
  #000000,
  #17e847,
  #e62dff,
  #ffff00,
  #ff0000,
  #00ff00,
};
