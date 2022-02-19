void renderGamescreen(boolean isMulti)
{
  timeInMillis = millis();
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

  background(background);
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
  textSize(20);
  int borderOffset = 20;
  String text = "Score player 1: " + scorePlayer1;
  float textWidth = textWidth(text);
  int padding = 20;

  fill(backgroundColor);
  noStroke();
  rect(borderOffset - (padding / 2), 0, textWidth + padding, 35, borderRadius);
  if (isPlayer1) {
    fill(#00ff00);
  } else {
    fill(textColor);
  }
  text(text, borderOffset, borderOffset);

  if (isMultiplayer) {
    text = "Score player 2: " + scorePlayer2;
    textWidth = textWidth(text);

    fill(backgroundColor);
    noStroke();
    rect((width - textWidth) - borderOffset - (padding / 2), 0, textWidth + padding, 35, borderRadius);
    if (!isPlayer1) {
      fill(#00ff00);
    } else {
      fill(textColor);
    }
    text(text, (width - textWidth) - borderOffset, borderOffset);
  }
}

void printTurnTime()
{
  textSize(30);
  String text = str(abs((timeInMillis - millis()) / 1000));
  float textWidth = textWidth(text);
  int extraWidth = 30;
  fill(backgroundColor);
  noStroke();
  rect((width / 2 - textWidth) - (extraWidth / 2), 0, textWidth + extraWidth, 35, borderRadius);
  fill(textColor);
  text(text, width / 2 - textWidth, 25);
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
  timeInMillis = millis();
}

void gameOver()
{
  inGame = false;

  if (int(random(0, 10)) == 1) {
    file = new SoundFile(this, "../files/xp-shutdown.mp3");
    file.amp(0.01);
    file.play();
  }
}
