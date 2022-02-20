void setup()
{
  size(1000, 500);

  background = loadImage("../media/winXP.jpg");
  image(background, 0, 0);
  background.resize(1000, 500);
  image(background, 0, 0);
  
  file = new SoundFile(this, "../media/xp-startup.mp3");
  file.amp(0.3);
  file.play();

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

    if (checkButtonPressed(singleplayerButtonX, playerModeButtonY, playerModeButtonW, playerModeButtonH)) {
      println("The mouse is pressed and over the button");
      renderGamescreen(false);
    }

    if (checkButtonPressed(multiplayerButtonX, playerModeButtonY, playerModeButtonW, playerModeButtonH)) {
      println("The mouse is pressed and over the button");
      renderGamescreen(true);
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
  int buttonH = 40;
  int textSize = 20;

  fill(#ffffff);
  stroke(#000000);
  rect(x, y, w, buttonH);
  fill(textColor);
  textSize(textSize);
  text(text, x + (w / 2) - 50, y + (buttonH / 2) + (textSize / 4));
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
