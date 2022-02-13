void renderGamescreen()
{
  scorePlayer1 = 0;
  scorePlayer2 = 0;
  countCentipedeSegmentsPlayer1 = 8; // TODO Fix to use 10
  countCentipedeSegmentsPlayer2 = 8; // TODO Fix to use 10

  gameOver = false;
  isPlayer1 = true;
  lastCollidedWith = null;

  fruitAmount = 25;
  cherryAmount = ceil(fruitAmount * .2); // 20% of fruit are cherries
  chameleonAmount = ceil((gameboardSizeY * gameboardSizeX - fruitAmount) * .1); // 10% of boardspace minus fruit occupance

  background(#ffffff);
  renderGameboard();
}

void renderGameboard()
{
  initCentipedePositions();
  gameboard = createGameboard();

  drawGameboard();
}

int boardOffsetY()
{
  return (height / 2) - (gameboardSizeY * gameboardSquareSize / 2);
}

int boardOffsetX()
{
  return (width / 2) - (gameboardSizeX * gameboardSquareSize / 2);
}

void addScore(int amount) {
  if (isPlayer1) {
    scorePlayer1 = scorePlayer1 + amount;
  } else {
    scorePlayer2 = scorePlayer2 + amount;
  }
}
