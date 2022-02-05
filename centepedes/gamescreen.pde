void renderGamescreen() {
  background(#ffffff);
  renderGameboard();
}

void renderGameboard() {
  int[][]gameboard = createGameboard();

  for (int i = 0; i < gameboard.length; i = i+1) {
    int offsetY = boardOffsetY() + (gameboardSquareSize * i);

    for (int j = 0; j < gameboard[i].length; j = j+1) {
      int offsetX = boardOffsetX() + (gameboardSquareSize * j);
      fill(gameboardItemColors[gameboard[i][j]]);
      square(offsetX, offsetY, gameboardSquareSize);
    }
  }
}

int boardOffsetY() {
  return (height / 2) - (gameboardSizeY * gameboardSquareSize / 2);
}

int boardOffsetX() {
  return (width / 2) - (gameboardSizeX * gameboardSquareSize / 2);
}
