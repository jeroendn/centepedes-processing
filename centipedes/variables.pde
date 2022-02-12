int scorePlayer1;
int scorePlayer2;
int countCentipedeSegmentsPlayer1;
int countCentipedeSegmentsPlayer2;

boolean isPlayer1;

int gameboardSizeY = 8;
int gameboardSizeX = 16;
int gameboardSquareSize = 20;
int fruitPercentage = 10;
int turnTimeInSeconds = 20;

// Gameboard items
int[][] gameboard;
int emptyId = 0;
int visitedId = 1;
int appleId = 6;
int bananaId = 7;
int cherriesId = 8;
int chameleonId = 9;

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
  #cccccc,
  #000000,
  #000000,
  #17e847,
  #e62dff,
  #fffff0,
  #fffff0,
  #fffff0,
  #fffff0,
};
