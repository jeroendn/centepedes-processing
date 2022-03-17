void renderHomeScreen()
{
  int btnSingleplayerX = (width / 2) - btnWideW;
  int btnMultiplayerX = (width / 2);
  int btnPlayerModeY = int(height * .75);
  int btnGameboardSizeY = int(height * .50);
  int btnFruitY = int(height * .25);

  background(background);

  if (button(btnSingleplayerX, btnPlayerModeY, btnWideW, "Singleplayer")) {
    renderGameScreen(false);
    return;
  }

  if (button(btnMultiplayerX, btnPlayerModeY, btnWideW, "Multiplayer")) {
    renderGameScreen(true);
    return;
  }

  String[] gameboardSizeButtons = {"16x8", "20x10", "24x12", "28x14", "32x16"};
  int btnStartGameboardSizeX = (width / 2) - (btnSmallW * gameboardSizeButtons.length / 2);
  text("Gameboard size", btnStartGameboardSizeX, btnGameboardSizeY - 10);

  for (int i = 0; i < gameboardSizeButtons.length; i++) {
    if (button(btnStartGameboardSizeX + btnSmallW * i, btnGameboardSizeY, btnSmallW, gameboardSizeButtons[i])) {
      String[] xy = split(gameboardSizeButtons[i], "x");
      gameboardSizeX = int(xy[0]);
      gameboardSizeY = int(xy[1]);
    }
  }


  int[] fruitButtons = {10, 20, 25, 30, 50};
  int btnStartFruitX = (width / 2) - (btnSmallW * fruitButtons.length / 2);
  text("Fruit amount", btnStartFruitX, btnFruitY - 10);

  for (int i = 0; i < fruitButtons.length; i++) {
    if (button(btnStartFruitX + btnSmallW * i, btnFruitY, btnSmallW, str(fruitButtons[i]))) {
      fruitAmount = fruitButtons[i];
    }
  }
}
