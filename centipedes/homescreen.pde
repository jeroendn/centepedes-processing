int btnSingleplayerX;
int btnMultiplayerX;
int btnPlayerModeY;

int btnGameboardSize1X;
int btnGameboardSize2X;
int btnGameboardSize3X;
int btnGameboardSize4X;
int btnGameboardSize5X;
int btnGameboardSizeY;

int btnFruit1X;
int btnFruit2X;
int btnFruit3X;
int btnFruit4X;
int btnFruit5X;
int btnFruitY;

void renderHomeScreen()
{
  btnSingleplayerX = (width / 2) - btnWideW;
  btnMultiplayerX = (width / 2);
  btnPlayerModeY = int(height * .75);

  btnGameboardSize1X = (width / 2) - (btnSmallW * 5 / 2);
  btnGameboardSize2X = btnGameboardSize1X + btnSmallW;
  btnGameboardSize3X = btnGameboardSize1X + btnSmallW * 2;
  btnGameboardSize4X = btnGameboardSize1X + btnSmallW * 3;
  btnGameboardSize5X = btnGameboardSize1X + btnSmallW * 4;
  btnGameboardSizeY = int(height * .50);

  btnFruit1X = (width / 2) - (btnSmallW * 5 / 2);
  btnFruit2X = btnFruit1X + btnSmallW;
  btnFruit3X = btnFruit1X + btnSmallW * 2;
  btnFruit4X = btnFruit1X + btnSmallW * 3;
  btnFruit5X = btnFruit1X + btnSmallW * 4;
  btnFruitY = int(height * .25);

  background(background);

  button(btnSingleplayerX, btnPlayerModeY, btnWideW, "Singleplayer");
  button(btnMultiplayerX, btnPlayerModeY, btnWideW, "Multiplayer");

  text("Gameboard size", btnGameboardSize1X, btnGameboardSizeY - 10);
  button(btnGameboardSize1X, btnGameboardSizeY, btnSmallW, "16x8");
  button(btnGameboardSize2X, btnGameboardSizeY, btnSmallW, "20x10");
  button(btnGameboardSize3X, btnGameboardSizeY, btnSmallW, "24x12");
  button(btnGameboardSize4X, btnGameboardSizeY, btnSmallW, "28x14");
  button(btnGameboardSize5X, btnGameboardSizeY, btnSmallW, "32x16");

  text("Fruit amount", btnFruit1X, btnFruitY - 10);
  button(btnFruit1X, btnFruitY, btnSmallW, "10");
  button(btnFruit2X, btnFruitY, btnSmallW, "20");
  button(btnFruit3X, btnFruitY, btnSmallW, "25");
  button(btnFruit4X, btnFruitY, btnSmallW, "30");
  button(btnFruit5X, btnFruitY, btnSmallW, "50");
}
