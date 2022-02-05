void setup() {
  size(1000, 500);
  renderHomescreen();
}

void draw() {
  if (checkButtonPressed(startButtonX, startButtonY, startButtonW, startButtonH)) {
    println("The mouse is pressed and over the button");
    renderGamescreen();
  }

  if (keyPressed) {
    if (key == 'w') {
      println("w");
    } else if (key == 'a') {
      println("a");
    } else if (key == 's') {
      println("s");
    } else if (key == 'd') {
      println("d");
      moveRight(1);
    }
  }

}

boolean checkButtonPressed(float x, float y, float w, float h) {
  if (mousePressed) {
    if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {
      return true;
    }
  }

  return false;
}
