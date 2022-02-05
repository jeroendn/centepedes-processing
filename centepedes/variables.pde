int scorePlayer1 = 0;
int countCentepedeSegmentsPlayer1 = 10;
int[][] gameboard;

String[] gameboardItems = {
  "empty",
  "visited",
  "centepedeHeadPlayer1",
  "centepedeHeadPlayer2",
  "centepedeSegmentPlayer1",
  "centepedeSegmentPlayer2",
  "apple",
  "banana",
  "cherries",
  "chameleon"
};

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

int gameboardSizeY = 8;
int gameboardSizeX = 16;
int gameboardSquareSize = 20;
int fruitPercentage = 10;
int turnTimeInSeconds = 20;
