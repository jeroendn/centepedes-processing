void setup()
{
  size(1000, 500);
  renderHomescreen();

  renderGamescreen(); // TODO Remove lazyness
}

void draw()
{
  if (checkButtonPressed(startButtonX, startButtonY, startButtonW, startButtonH)) {
    println("The mouse is pressed and over the button");
    renderGamescreen();
  }

  if (gameOver) {
    renderHomescreen();
  }
}

void keyPressed()
{
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

boolean checkButtonPressed(float x, float y, float w, float h)
{
  if (mousePressed) {
    if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {
      return true;
    }
  }

  return false;
}
