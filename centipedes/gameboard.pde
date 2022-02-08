// UpdateScore(player, item)
// UpdateCentipedeLength(player, isIncrease)

int[][] initCentipedePositions()
{
  centipedePositions = new int[gameboardSizeY][gameboardSizeX];

  for (int y = 0; y < gameboardSizeY; y = y+1) {
    for (int x = 0; x < gameboardSizeX; x = x+1) {

      if (x == 1 && y == 1) {
        centipedePositions[y][x] = centipedeHeadPlayer1Id;
      } else if (x == 0        && y ==1) { // TODO Fix addjustable length
        centipedePositions[y][x] = centipedeSegmentPlayer1Id;
      } else {
        centipedePositions[y][x] = emptyId;
      }
    }
  }

  return centipedePositions;
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

      if (centipedePositions[y][x] != emptyId) { // Draw centipede part
        fill(gameboardItemColors[centipedePositions[y][x]]);
      } else {
        fill(gameboardItemColors[gameboard[y][x]]);
      }

      square(offsetX, offsetY, gameboardSquareSize);
    }
  }
}

void move(int player, String direction)
{
  int[] headPositions = getHeadPosition(player);

  setHeadPosition(player, headPositions[0], headPositions[1], direction);

  if (headHasBeenMoved(player, headPositions[0], headPositions[1])) {

    // get segements postition
    int[][] previousSegmentPositions = extractSegmentPositions(player);

    // set segements postition
    setSegmentPositions(player, direction, previousSegmentPositions);
  }

  drawGameboard();
}

int[] getHeadPosition(int player)
{
  for (int y = 0; y < centipedePositions.length; y = y+1) {
    for (int x = 0; x < centipedePositions[y].length; x = x+1) {
      if (
        (player == 1 && centipedePositions[y][x] == centipedeHeadPlayer1Id)
        ||
        (player == 2 && centipedePositions[y][x] == centipedeHeadPlayer2Id)
        ) {
        return new int[] {y, x};
      }
    }
  }

  return new int[] {0, 0}; // Should NEVER be the case
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

  centipedePositions[currentY][currentX] = emptyId;

  if (player == 1) {
    centipedePositions[currentY + addY][currentX + addX] = centipedeHeadPlayer1Id;
  } else {
    centipedePositions[currentY + addY][currentX + addX] = centipedeHeadPlayer2Id;
  }
}

boolean headHasBeenMoved(int player, int previousY, int previousX)
{
  int[] headPositions = getHeadPosition(player);

  if (headPositions[0] != previousY || headPositions[1] != previousX) {
    return true;
  }

  return false;
}

int[][] extractSegmentPositions(int player)
{
  int[][] positions = new int[gameboardSizeY][gameboardSizeX];

  for (int y = 0; y < centipedePositions.length; y = y+1) {
    for (int x = 0; x < centipedePositions[y].length; x = x+1) {
      if (player == 1 && centipedePositions[y][x] == centipedeSegmentPlayer1Id) {
        positions[y][x] = centipedeSegmentPlayer1Id;
        centipedePositions[y][x] = emptyId; // Clear the old position
      } else {
        positions[y][x] = emptyId;
      }
    }
  }

  return positions;
}

void setSegmentPositions(int player, String direction, int[][] previousPositions)
{
  int[] headPositions = getHeadPosition(player);

  int offsetY = 0;
  int offsetX = 0;

  switch(direction) {
  case "up":
    offsetY = -1;
    break;
  case "right":
    offsetX = 1;
    break;
  case "down":
    offsetY = 1;
    break;
  case "left":
    offsetX = -1;
    break;
  default:
    return;
  }

  for (int y = 0; y < centipedePositions.length; y = y+1) {
    for (int x = 0; x < centipedePositions[y].length; x = x+1) {
      if (previousPositions[y][x] == centipedeSegmentPlayer1Id) {
        int velocityY = headPositions[y] - y * 2;
        int velocityX = headPositions[x] - x * 2;

        println(velocityY, velocityX);

        centipedePositions[y + offsetY -1][x + offsetX +1] = centipedeSegmentPlayer1Id;
        //centipedePositions[y + offsetY -1][x + offsetX +1] = centipedeSegmentPlayer1Id;
      }
    }
  }
}
