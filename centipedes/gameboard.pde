// UpdateScore(player, item)
// UpdateCentipedeLength(player, isIncrease)

int[][] initCentipedePositions() {
  centipedePositions = new int[gameboardSizeY][gameboardSizeX];

  for (int y = 0; y < gameboardSizeY; y = y+1) {
    for (int x = 0; x < gameboardSizeX; x = x+1) {

      if (x == 0 && y == 0) {
        centipedePositions[y][x] = centipedeHeadPlayer1Id;
      } else if (x == 0) { // TODO Fix addjustable length
        centipedePositions[y][x] = centipedeSegmentPlayer1Id;
      } else {
        centipedePositions[y][x] = emptyId;
      }
    }
  }

  return centipedePositions;
}

int[][] createGameboard() {
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

void drawGameboard() {
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

void move(int player, String direction) {
  // get head position
  println(getHeadPosition(player));

  // set head position
  // get segements postition
  // set segements postition
  // draw board anew
}

int[] getHeadPosition(int player) {
  for (int y = 0; y < gameboard.length; y = y+1) {
    for (int x = 0; x < gameboard[y].length; x = x+1) {
      if (
        (player == 1 && gameboard[y][x] == centipedeHeadPlayer1Id)
        ||
        (player == 2 && gameboard[y][x] == centipedeHeadPlayer2Id)
        ) {
        return new int[] {x, y};
      }
    }
  }

  return new int[] {0, 0}; // Should NEVER be the case
}
