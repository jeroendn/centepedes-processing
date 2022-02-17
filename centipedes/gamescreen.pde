void renderGamescreen(boolean isMulti)
{
  isMultiplayer = isMulti;
  scorePlayer1 = 0;
  scorePlayer2 = 0;
  countCentipedeSegmentsPlayer1 = 8; // TODO Fix to use 10
  countCentipedeSegmentsPlayer2 = 8; // TODO Fix to use 10

  inGame = true;
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

void printScore()
{  
  int borderOffset = 20;
  String text = "Score player 1: " + scorePlayer1;
  float textWidth = textWidth(text);
  
  fill(backgroundColor);
  noStroke();
  rect(borderOffset, 0, textWidth, 35);
  fill(textColor);
  textSize(20);
  text(text, borderOffset, borderOffset);

  if (isMultiplayer) {
    text = "Score player 2: " + scorePlayer2;
    textWidth = textWidth(text);
    
    fill(backgroundColor);
    noStroke();
    rect((width - textWidth) - borderOffset, 0, textWidth, 35);
    fill(textColor);
    textSize(20);
    text(text, (width - textWidth) - borderOffset, borderOffset);
  }
}

int boardOffsetY()
{
  return (height / 2) - (gameboardSizeY * gameboardSquareSize / 2);
}

int boardOffsetX()
{
  return (width / 2) - (gameboardSizeX * gameboardSquareSize / 2);
}

void addScore(int amount)
{
  if (isPlayer1) {
    scorePlayer1 = scorePlayer1 + amount;
  } else {
    scorePlayer2 = scorePlayer2 + amount;
  }
}

void endTurn()
{
  isPlayer1 = !isPlayer1;
}

void gameOver()
{
  inGame = false;
}
