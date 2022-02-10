// UpdateScore(player, item)
// UpdateCentipedeLength(player, isIncrease)

void initCentipedePositions()
{
  centipedePositionsPlayer1 = new int[countCentipedeSegmentsPlayer1][2];

  for (int y = 0; y < gameboardSizeY; y = y+1) {
    for (int x = 0; x < gameboardSizeX; x = x+1) {

      if (x == 0 && y == 0) {
        centipedePositionsPlayer1[0] = new int[] {y, x};
      } else if (x == 0) { // TODO Fix addjustable length
        centipedePositionsPlayer1[y] = new int[] {y, x}; // TODO DANGEROUS TO USE Y
      }
    }
  }
}

int[][] createGameboard()
{
  gameboard = new int[gameboardSizeY][gameboardSizeX];

  for (int y = 0; y < gameboardSizeY; y = y+1) {
    for (int x = 0; x < gameboardSizeX; x = x+1) {

      if (false) { // TODO Add conditions for adding board items
        return gameboard;
      } else {
        gameboard[y][x] = emptyId;
      }
    }
  }

  return gameboard;
}

void drawGameboard()
{
  for (int y = 0; y < gameboard.length; y = y+1) {
    int offsetY = boardOffsetY() + (gameboardSquareSize * y);

    for (int x = 0; x < gameboard[y].length; x = x+1) {
      int offsetX = boardOffsetX() + (gameboardSquareSize * x);

      boolean filled = false;

      for (int i = 0; i < centipedePositionsPlayer1.length; i = i+1) {
        if (centipedePositionsPlayer1[i][0] == y && centipedePositionsPlayer1[i][1] == x) {
          if (i == 0) {
            fill(gameboardItemColors[centipedeHeadPlayer1Id]);
          } else {
            fill(gameboardItemColors[centipedeSegmentPlayer1Id]);
          }
          filled = true;
        }
      }

      if (!filled) {
        fill(gameboardItemColors[gameboard[y][x]]);
      }

      square(offsetX, offsetY, gameboardSquareSize);
    }
  }
}

void move(int player, String direction)
{
  ddC(centipedePositionsPlayer1);
  
  int[] headPositions = getHeadPosition(player);

  setHeadPosition(player, headPositions[0], headPositions[1], direction);

  if (headHasBeenMoved(player, headPositions[0], headPositions[1])) {

    //int[][] previousSegmentPositions = getSegmentPositions(player);

    setSegmentPositions(player, headPositions);
  }

  drawGameboard();
}

int[] getHeadPosition(int player)
{
  if (player == 1) {
    return centipedePositionsPlayer1[0];
  } else {
    return centipedePositionsPlayer2[0];
  }
}

void setHeadPosition(int player, int currentY, int currentX, String direction)
{
  int addY = 0;
  int addX = 0;

  switch(direction) {
  case "up":
    addY = -1;
    break;
  case "right":
    addX = 1;
    break;
  case "down":
    addY = 1;
    break;
  case "left":
    addX = -1;
    break;
  default:
    return;
  }

  if (
    (currentY + addY >= gameboardSizeY)
    ||
    (currentY + addY < 0)
    ||
    (currentX + addX >= gameboardSizeX)
    ||
    (currentX + addX < 0)
    ) {
    println("Out of bounds");
    return;
  }

  centipedePositionsPlayer1[0] = new int[] {currentY + addY, currentX + addX};
}

boolean headHasBeenMoved(int player, int previousY, int previousX)
{
  int[] headPositions = getHeadPosition(player);

  if (headPositions[0] != previousY || headPositions[1] != previousX) {
    return true;
  }

  return false;
}

//int[][] getSegmentPositions(int player)
//{
//  int[][] positions = new int[countCentipedeSegmentsPlayer1][2];
//  int i = 0;
  
//  for (int y = 0; y < centipedePositionsPlayer1.length; y = y+1) {
//    for (int x = 0; x < centipedePositionsPlayer1[y].length; x = x+1) {
//      if (player == 1 && centipedePositionsPlayer1[y][x] == centipedeSegmentPlayer1Id) {
//        positions[i] = new int[] {y, x};
//        i++;
//      }
//    }
//  }

//  return positions;
//}

void setSegmentPositions(int player, int[] previousHeadPosition)
{
  int[] prevPos = new int[] {};

  for (int i = 0; i < centipedePositionsPlayer1.length; i = i+1) {
    if (i == 1) {
      prevPos = centipedePositionsPlayer1[i];
      centipedePositionsPlayer1[i] = new int[] {previousHeadPosition[0], previousHeadPosition[1]};
    }
  }

  for (int i = 0; i < centipedePositionsPlayer1.length; i = i+1) {
    if (i != 0 && i != 1) {
      int[] tempPos = centipedePositionsPlayer1[i];
      centipedePositionsPlayer1[i] = new int[] {prevPos[0], prevPos[1]};
      prevPos = tempPos;
    }
  }
}

void ddC(int[][] centipede) {
  println('-');
  for (int y = 0; y < centipede.length; y = y+1) {
    println(centipede[y][0], centipede[y][1]);
  }
}
