/**
 * Initializes the positions of the centipedes on the gameboard.
 */
void initCentipedePositions()
{
  centipedePositionsPlayer1 = new int[countCentipedeSegmentsPlayer1][2];
  if (isMultiplayer) centipedePositionsPlayer2 = new int[countCentipedeSegmentsPlayer2][2];
  
  // Always initialise to the first segement index in order to prevent unset tail when starting positions is out of gameboard bounds
  for (int i = 0; i < countCentipedeSegmentsPlayer1; i++) {
    centipedePositionsPlayer1[i] = new int[] {1, 0};
    if (isMultiplayer) centipedePositionsPlayer2[i] = new int[] {gameboardSizeX - 1, 0};
  }

  for (int y = 0; y < gameboardSizeY; y++) {
    for (int x = 0; x < gameboardSizeX; x++) {

      if (x == 0 && y < countCentipedeSegmentsPlayer1) { // Player 1
        centipedePositionsPlayer1[y] = new int[] {y, x};
      } else if (x == gameboardSizeX - 1 && y < countCentipedeSegmentsPlayer2 && isMultiplayer) { // Player 2
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
  for (int y = 0; y < gameboardSizeY; y++) {
    for (int x = 0; x < gameboardSizeX; x++) {
      gameboard[y][x] = emptyId;
    }
  }

  while (fruitAmount > 0) {
    int randY = int(random(0, gameboardSizeY));
    int randX = int(random(0, gameboardSizeX));

    if (willCollide(randY, randX)) continue;

    if (fruitAmount <= cherryAmount) {
      gameboard[randY][randX] = cherryId;
    } else {
      gameboard[randY][randX] = bananaId;
    }
    fruitAmount = fruitAmount - 1;
  }

  while (chameleonAmount > 0) {
    int randY = int(random(0, gameboardSizeY));
    int randX = int(random(0, gameboardSizeX));

    if (willCollide(randY, randX)) continue;

    gameboard[randY][randX] = chameleonId;
    chameleonAmount = chameleonAmount - 1;
  }

  return gameboard;
}

/**
 * Draws to gameboard to the screen.
 */
void drawGameboard()
{
  for (int y = 0; y < gameboard.length; y++) {
    int offsetY = boardOffsetY() + (gameboardSquareSize * y);

    for (int x = 0; x < gameboard[y].length; x++) {
      int offsetX = boardOffsetX() + (gameboardSquareSize * x);

      boolean filled = false;

      for (int i = 0; i < centipedePositionsPlayer1.length; i++) {
        if (centipedePositionsPlayer1[i][0] == y && centipedePositionsPlayer1[i][1] == x) {
          if (i == 0) {
            fill(gameboardItemColors[centipedeHeadPlayer1Id]);
          } else {
            fill(gameboardItemColors[centipedeSegmentPlayer1Id]);
          }
          filled = true;
        }
      }

      if (isMultiplayer) {
        for (int i = 0; i < centipedePositionsPlayer2.length; i++) {
          if (centipedePositionsPlayer2[i][0] == y && centipedePositionsPlayer2[i][1] == x) {
            if (i == 0) {
              fill(gameboardItemColors[centipedeHeadPlayer2Id]);
            } else {
              fill(gameboardItemColors[centipedeSegmentPlayer2Id]);
            }
            filled = true;
          }
        }
      }

      if (!filled) {
        fill(gameboardItemColors[gameboard[y][x]]); // Print any gameboard item other than a player item
      }

      stroke(#000000);
      square(offsetX, offsetY, gameboardSquareSize);
    }
  }

  if (lastCollidedWith == "chameleon") drawChameleon();
}

/**
 * Tries to move the active player to the desired direction.
 */
void move(String direction)
{
  int[] oldHeadPosition = getHeadPosition();
  boolean increase = false;
  boolean decrease = false;
  lastCollidedWith = "";

  setHeadPosition(oldHeadPosition[0], oldHeadPosition[1], direction);

  switch(lastCollidedWith) {
  case "banana":
    addScore(10);
    increase = true;
    play("crunch.wav", 0.5);
    file.amp(0.5);
    file.play();
    break;
  case "cherry":
    addScore(5);
    increase = true;
    play("crunch.wav", 0.5);
    break;
  case "chameleon":
    decrease = true;
    break;
  }

  if (headHasBeenMoved(oldHeadPosition[0], oldHeadPosition[1])) {
    if (isPlayer1) {
      centipedePositionsPlayer1 = setSegmentPositions(oldHeadPosition, centipedePositionsPlayer1, increase, decrease);
    } else {
      centipedePositionsPlayer2 = setSegmentPositions(oldHeadPosition, centipedePositionsPlayer2, increase, decrease);
    }

    gameboard[oldHeadPosition[0]][oldHeadPosition[1]] = visitedId; // Mark position as visited
    drawGameboard();

    if (remainingFruitCount() <= 0) gameOver(); // When all fruits have been eaten
    if (isMultiplayer) endTurn();
  }
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
    if (lastCollidedWith == "border" || lastCollidedWith == "visited") {
      return;
    } else if (lastCollidedWith == "player1" || lastCollidedWith == "player2") {
      gameOver();
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
    return true;
  }

  for (int i = 0; i < centipedePositionsPlayer1.length; i++) {
    if (centipedePositionsPlayer1[i][0] == newY && centipedePositionsPlayer1[i][1] == newX) {
      lastCollidedWith = "player1";
      return true;
    }
  }

  if (isMultiplayer) {
    for (int i = 0; i < centipedePositionsPlayer2.length; i++) {
      if (centipedePositionsPlayer2[i][0] == newY && centipedePositionsPlayer2[i][1] == newX) {
        lastCollidedWith = "player2";
        return true;
      }
    }
  }

  if (gameboard[newY][newX] == visitedId) {
    lastCollidedWith = "visited";
    return true;
  }

  if (gameboard[newY][newX] == bananaId) {
    lastCollidedWith = "banana";
    return true;
  }

  if (gameboard[newY][newX] == cherryId) {
    lastCollidedWith = "cherry";
    return true;
  }

  if (gameboard[newY][newX] == chameleonId) {
    lastCollidedWith = "chameleon";
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
int[][] setSegmentPositions(int[] previousHeadPosition, int[][] centipedePositions, boolean increase, boolean decrease)
{
  int[] prevPos = new int[] {};

  for (int i = 0; i < centipedePositions.length; i++) {
    if (i == 1) {
      prevPos = centipedePositions[i];
      centipedePositions[i] = new int[] {previousHeadPosition[0], previousHeadPosition[1]};
    }
  }

  for (int i = 0; i < centipedePositions.length; i++) {
    if (i != 0 && i != 1) {
      int[] tempPos = centipedePositions[i];
      centipedePositions[i] = new int[] {prevPos[0], prevPos[1]};
      prevPos = tempPos;
    }
  }

  if (increase) {
    centipedePositions = (int[][]) expand(centipedePositions, centipedePositions.length + 1);
    centipedePositions[centipedePositions.length - 1] = new int[] {prevPos[0], prevPos[1]};
  } else if (decrease) {
    centipedePositions = (int[][]) expand(centipedePositions, centipedePositions.length - 1);
  }

  if (centipedePositions.length <= 1) gameOver(); // When all segements have disappeared

  return centipedePositions;
}

/**
 * Counts the amount of fruits remaining on the gameboard.
 */
int remainingFruitCount()
{
  int fruitCount = 0;

  for (int y = 0; y < gameboard.length; y++) {
    for (int x = 0; x < gameboard[y].length; x++) {
      if (gameboard[y][x] == bananaId || gameboard[y][x] == cherryId) {
        fruitCount = fruitCount + 1;
      }
    }
  }

  return fruitCount;
}

/**
 * Shows the chamelion on the board.
 */
void drawChameleon()
{
  int[] yx = getHeadPosition();

  murloc = loadImage("../media/murloc.png");
  murloc.resize(gameboardSquareSize, gameboardSquareSize);
  image(murloc, boardOffsetX() + (gameboardSquareSize * yx[1]), boardOffsetY() + (gameboardSquareSize * yx[0]));

  play("murloc.mp3", 0.05);
}
