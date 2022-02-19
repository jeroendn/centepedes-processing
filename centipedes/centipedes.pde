void setup()
{
  size(1000, 500);
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

boolean checkButtonPressed(float x, float y, float w, float h)
{
  if (mousePressed) {
    if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {
      return true;
    }
  }

  return false;
}
