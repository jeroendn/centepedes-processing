void setup()
{
  size(1000, 500);
  renderHomescreen();
}

void draw()
{
  if (checkButtonPressed(startButtonX, startButtonY, startButtonW, startButtonH)) {
    println("The mouse is pressed and over the button");
    renderGamescreen();
  }
}

void keyPressed()
{
  if (key == 'w') {
    move(1, "up");
  } else if (key == 'd') {
    move(1, "right");
  } else if (key == 's') {
    move(1, "down");
  } else if (key == 'a') {
    move(1, "left");
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
