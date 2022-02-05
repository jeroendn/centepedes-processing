// UpdateScore(player, item)
// UpdateCentepedeLength(player, isIncrease)
// MoveCentepede(player, direction)

int[][] createGameboard() {

  gameboard = new int[gameboardSizeY][gameboardSizeX];

  for (int y = 0; y < gameboardSizeY; y = y+1) {
    for (int x = 0; x < gameboardSizeX; x = x+1) {

      if (x == 0 && y == 0) {
        gameboard[y][x] = 2; // Player 1 head
      } else if (x == 0) {
        gameboard[y][x] = 4; // Player 1 segment
      } else {
        gameboard[y][x] = 0;
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
        (player == 1 && gameboard[y][x] == 2)
        ||
        (player == 2 && gameboard[y][x] == 3)
        ) {
        return new int[] {x, y};
      }
    }
  }

  return new int[] {0, 0}; // Should NEVER be the case
}
