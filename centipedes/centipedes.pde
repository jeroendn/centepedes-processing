void setup()
{
  size(1000, 500);

  background = loadImage("../media/winXP.jpg");
  image(background, 0, 0);
  background.resize(1000, 500);
  image(background, 0, 0);

  play("xp-startup.mp3", 0.1);

  renderHomescreen();
}

void draw()
{
  if (inGame) {
    printScore();

    if (isMultiplayer) printTurnTime();

    if (isMultiplayer && millis() > timeInMillis + turnTimeInMillis)
    {
      timeInMillis = millis();
      endTurn();
    }
  } else {
    renderHomescreen();

    if (checkButtonPressed(btnSingleplayerX, btnPlayerModeY, btnWideW, btnH)) {
      renderGamescreen(false);
    } else if (checkButtonPressed(btnMultiplayerX, btnPlayerModeY, btnWideW, btnH)) {
      renderGamescreen(true);
    } else if (checkButtonPressed(btnGameboardSize1X, btnGameboardSizeY, btnSmallW, btnH)) {
      gameboardSizeX = 16;
      gameboardSizeY = 8;
    } else if (checkButtonPressed(btnGameboardSize2X, btnGameboardSizeY, btnSmallW, btnH)) {
      gameboardSizeX = 20;
      gameboardSizeY = 10;
    } else if (checkButtonPressed(btnGameboardSize3X, btnGameboardSizeY, btnSmallW, btnH)) {
      gameboardSizeX = 24;
      gameboardSizeY = 12;
    } else if (checkButtonPressed(btnGameboardSize4X, btnGameboardSizeY, btnSmallW, btnH)) {
      gameboardSizeX = 28;
      gameboardSizeY = 14;
    } else if (checkButtonPressed(btnGameboardSize5X, btnGameboardSizeY, btnSmallW, btnH)) {
      gameboardSizeX = 32;
      gameboardSizeY = 16;
    } else if (checkButtonPressed(btnFruit1X, btnFruitY, btnSmallW, btnH)) {
      fruitAmount = 10;
    } else if (checkButtonPressed(btnFruit2X, btnFruitY, btnSmallW, btnH)) {
      fruitAmount = 20;
    } else if (checkButtonPressed(btnFruit3X, btnFruitY, btnSmallW, btnH)) {
      fruitAmount = 25;
    } else if (checkButtonPressed(btnFruit4X, btnFruitY, btnSmallW, btnH)) {
      fruitAmount = 30;
    } else if (checkButtonPressed(btnFruit5X, btnFruitY, btnSmallW, btnH)) {
      fruitAmount = 50;
    }
  }
}

void keyPressed()
{
  if (inGame) {
    if (isPlayer1) {
      if (key == 'w') {
        move("up");
      } else if (key == 'd') {
        move("right");
      } else if (key == 's') {
        move("down");
      } else if (key == 'a') {
        move("left");
      }
    } else {
      if (keyCode == UP) {
        move("up");
      } else if (keyCode == RIGHT) {
        move("right");
      } else if (keyCode == DOWN) {
        move("down");
      } else if (keyCode == LEFT) {
        move("left");
      }
    }
  }
}

void button(int x, int y, int w, String text)
{
  int textSize = 20;
  fill(#ffffff);
  stroke(#000000);
  rect(x, y, w, btnH);
  fill(textColor);
  textSize(textSize);
  float textWidth = textWidth(text);
  text(text, x + (w / 2) - (textWidth / 2), y + (btnH / 2) + (textSize / 4));
}

boolean checkButtonPressed(float x, float y, float w, float h)
{
  if (mousePressed) {
    if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {
      return true;
    }
  }

  return false;
}

void play(String filename, float amp)
{
  file = new SoundFile(this, "../media/" + filename);
  file.amp(amp);
  file.play();
}
