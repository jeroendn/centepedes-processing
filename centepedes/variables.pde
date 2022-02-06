int scorePlayer1;
int scorePlayer2;
int countCentepedeSegmentsPlayer1;
int countCentepedeSegmentsPlayer2;

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

// Gameboard centepede positions
int[][] centepedePositions;
int centepedeHeadPlayer1Id = 2;
int centepedeHeadPlayer2Id = 3;
int centepedeSegmentPlayer1Id = 4;
int centepedeSegmentPlayer2Id = 5;

// Gameboard item colors mapped by id as index
color[] gameboardItemColors = {
  #ffffff,
  #cccccc,
  #000000,
  #000000,
  #00ff00,
  #0000ff,
  #fffff0,
  #fffff0,
  #fffff0,
  #fffff0,
};
