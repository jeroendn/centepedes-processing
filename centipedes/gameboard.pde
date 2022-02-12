/**
 * Initializes the positions of the centipedes on the gameboard.
 */
void initCentipedePositions()
{
  centipedePositionsPlayer1 = new int[countCentipedeSegmentsPlayer1][2];
  centipedePositionsPlayer2 = new int[countCentipedeSegmentsPlayer2][2];

  for (int y = 0; y < gameboardSizeY; y = y+1) {
    for (int x = 0; x < gameboardSizeX; x = x+1) {

      if (x == 0) { // TODO Fix addjustable length
        centipedePositionsPlayer1[y] = new int[] {y, x}; // TODO DANGEROUS TO USE Y
      } else if (x == 15) {
        centipedePositionsPlayer2[y] = new int[] {y, x};
      }
    }
  }
}

/**
 * Genarates how to board will be filled in.
 */
int[][] createGameboard()
{
  gameboard = new int[gameboardSizeY][gameboardSizeX];

  // Fill entire board with emptyness
  for (int y = 0; y < gameboardSizeY; y = y+1) {
    for (int x = 0; x < gameboardSizeX; x = x+1) {
      gameboard[y][x] = emptyId;
    }
  }

  while (fruitAmount > 0) {
    int randY = int(random(0, gameboardSizeY));
    int randX = int(random(0, gameboardSizeX));

    if (willCollide(randY, randX)) continue;

    gameboard[randY][randX] = bananaId;
    fruitAmount = fruitAmount - 1;
  }

  return gameboard;
}

/**
 * Draws to gameboard to the screen.
 */
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

      for (int i = 0; i < centipedePositionsPlayer2.length; i = i+1) {
        if (centipedePositionsPlayer2[i][0] == y && centipedePositionsPlayer2[i][1] == x) {
          if (i == 0) {
            fill(gameboardItemColors[centipedeHeadPlayer2Id]);
          } else {
            fill(gameboardItemColors[centipedeSegmentPlayer2Id]);
          }
          filled = true;
        }
      }

      if (!filled) {
        fill(gameboardItemColors[gameboard[y][x]]); // Print any gameboard item other than a player item
      }

      square(offsetX, offsetY, gameboardSquareSize);
    }
  }
}

/**
 * Tries to move the active player to the desired direction.
 */
void move(String direction)
{
  int[] oldHeadPosition = getHeadPosition();
  boolean increase = false;
  lastCollidedWith = "";

  setHeadPosition(oldHeadPosition[0], oldHeadPosition[1], direction);
  
  int[] newHeadPosition = getHeadPosition();

  if (lastCollidedWith == "banana") {
    increase = true;
    gameboard[newHeadPosition[0]][newHeadPosition[1]] = emptyId; // Remove banana
  }

  if (headHasBeenMoved(oldHeadPosition[0], oldHeadPosition[1])) {
    if (isPlayer1) {
      centipedePositionsPlayer1 = setSegmentPositions(oldHeadPosition, centipedePositionsPlayer1, increase);
    } else {
      centipedePositionsPlayer2 = setSegmentPositions(oldHeadPosition, centipedePositionsPlayer2, increase);
    }
  }

  drawGameboard();
}

int[] getHeadPosition()
{
  if (isPlayer1) {
    return centipedePositionsPlayer1[0];
  } else {
    return centipedePositionsPlayer2[0];
  }
}

/**
 * Tries to move the active player's head to the desired direction.
 */
void setHeadPosition(int currentY, int currentX, String direction)
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

  if (willCollide(currentY + addY, currentX + addX)) {
    if (lastCollidedWith == "border") {
      return;
    } else if (lastCollidedWith == "player1" || lastCollidedWith == "player2") {
      gameOver = true;
      return;
    }
  }

  if (isPlayer1) {
    centipedePositionsPlayer1[0] = new int[] {currentY + addY, currentX + addX};
  } else {
    centipedePositionsPlayer2[0] = new int[] {currentY + addY, currentX + addX};
  }
}

/**
 * Returns true if the new position would result in a colliosion.
 * Use variable lastCollidedWith to see which item has been collided with.
 */
boolean willCollide(int newY, int newX)
{
  if (
    (newY >= gameboardSizeY)
    ||
    (newY < 0)
    ||
    (newX >= gameboardSizeX)
    ||
    (newX < 0)
    ) {
    lastCollidedWith = "border";
    println("Out of bounds!");
    return true;
  }

  for (int i = 0; i < centipedePositionsPlayer1.length; i = i+1) {
    if (centipedePositionsPlayer1[i][0] == newY && centipedePositionsPlayer1[i][1] == newX) {
      lastCollidedWith = "player1";
      println("Player 1 collide!");
      return true;
    }
  }

  for (int i = 0; i < centipedePositionsPlayer2.length; i = i+1) {
    if (centipedePositionsPlayer2[i][0] == newY && centipedePositionsPlayer2[i][1] == newX) {
      lastCollidedWith = "player2";
      println("Player 2 collide!");
      return true;
    }
  }

  if (gameboard[newY][newX] == bananaId) {
    lastCollidedWith = "banana";
    println("Banana collide!");
    return true;
  }

  return false;
}

/**
 * Checks of the head was able to be moved.
 */
boolean headHasBeenMoved(int previousY, int previousX)
{
  int[] headPositions = getHeadPosition();

  if (headPositions[0] != previousY || headPositions[1] != previousX) {
    return true;
  }

  return false;
}

/**
 * Updates the player's segement positions based on the player's action.
 */
int[][] setSegmentPositions(int[] previousHeadPosition, int[][] centipedePositions, boolean increase)
{
  int[] prevPos = new int[] {};

  for (int i = 0; i < centipedePositions.length; i = i+1) {
    if (i == 1) {
      prevPos = centipedePositions[i];
      centipedePositions[i] = new int[] {previousHeadPosition[0], previousHeadPosition[1]};
    }
  }

  for (int i = 0; i < centipedePositions.length; i = i+1) {
    if (i != 0 && i != 1) {
      println(prevPos[0], prevPos[1]);
      int[] tempPos = centipedePositions[i];
      centipedePositions[i] = new int[] {prevPos[0], prevPos[1]};
      prevPos = tempPos;
    }
  }

  if (increase) {
    centipedePositions = (int[][]) expand(centipedePositions, centipedePositions.length + 1);
    centipedePositions[centipedePositions.length - 1] = new int[] {prevPos[0], prevPos[1]};
  }

  return centipedePositions;
}
