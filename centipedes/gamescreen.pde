void renderGamescreen()
{
  scorePlayer1 = 0;
  scorePlayer2 = 0;
  countCentipedeSegmentsPlayer1 = 8;
  countCentipedeSegmentsPlayer2 = 10;

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
