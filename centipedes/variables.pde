color backgroundColor = #ffffff;
color textColor = #000000;

int scorePlayer1;
int scorePlayer2;
int countCentipedeSegmentsPlayer1;
int countCentipedeSegmentsPlayer2;

boolean isMultiplayer;
boolean inGame;
boolean isPlayer1;
String lastCollidedWith;

int gameboardSizeY = 8;
int gameboardSizeX = 16;
int gameboardSquareSize = 20;
int fruitAmount;
int cherryAmount;
int chameleonAmount;
int turnTimeInSeconds = 20;

// Gameboard items
int[][] gameboard;
int emptyId = 0;
int visitedId = 1;
int bananaId = 6;
int cherryId = 7;
int chameleonId = 8;

// Gameboard centipede positions
int[][] centipedePositionsPlayer1;
int[][] centipedePositionsPlayer2;
int centipedeHeadPlayer1Id = 2;
int centipedeHeadPlayer2Id = 3;
int centipedeSegmentPlayer1Id = 4;
int centipedeSegmentPlayer2Id = 5;

// Gameboard item colors mapped by id as index
color[] gameboardItemColors = {
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
