void setup()
{
  size(1000, 500);

  background = loadImage("winXP.jpg");
  image(background, 0, 0);
  background.resize(1000, 500);
  image(background, 0, 0);

  play("xp-startup.mp3", 0.1);
}

void draw()
{
  if (inGameScreen) {
    printScore();

    if (isMultiplayer) printTurnTime();

    if (isMultiplayer && millis() > timeInMillis + turnTimeInMillis)
    {
      timeInMillis = millis();
      endTurn();
    }
  } else if (inScoreScreen) {
    renderScoreScreen();
  } else {
    renderHomeScreen();
  }
}

void keyPressed()
{
  if (inGameScreen) {
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

/**
 * Draws a button and returns the pressed state.
 */
boolean button(int x, int y, int w, String text)
{
  boolean pressed = checkButtonPressed(x, y, w, btnH);
  int textSize = 20;
  fill(#ffffff);
  if (pressed) fill(#dddddd);
  stroke(#000000);
  rect(x, y, w, btnH);
  fill(textColor);
  textSize(textSize);
  float textWidth = textWidth(text);
  text(text, x + (w / 2) - (textWidth / 2), y + (btnH / 2) + (textSize / 4));

  return pressed;
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
  file = new SoundFile(this, filename);
  file.amp(amp);
  file.play();
}
