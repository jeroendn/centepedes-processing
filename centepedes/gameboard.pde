// UpdateScore(player, item)
// UpdateCentepedeLength(player, isIncrease)

int[][] createGameboard() {

  gameboard = new int[gameboardSizeY][gameboardSizeX];

  for (int y = 0; y < gameboardSizeY; y = y+1) {
    for (int x = 0; x < gameboardSizeX; x = x+1) {

      if (x == 0 && y == 0) {
        gameboard[y][x] = centepedeHeadPlayer1Id;
      } else if (x == 0) { // TODO Fix addjustable length
        gameboard[y][x] = centepedeSegmentPlayer1Id;
      } else {
        gameboard[y][x] = emptyId;
      }
    }
  }

  return gameboard;
}

void moveRight(int player) {
  move(player, "right");
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
        (player == 1 && gameboard[y][x] == centepedeHeadPlayer1Id)
        ||
        (player == 2 && gameboard[y][x] == centepedeHeadPlayer2Id)
        ) {
        return new int[] {x, y};
      }
    }
  }

  return new int[] {0, 0}; // Should NEVER be the case
}
