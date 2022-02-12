float startButtonX = 100;
float startButtonY = 50;
float startButtonW = 150;
float startButtonH = 80;

void renderHomescreen()
{
  background(backgroundColor);
  renderStartButton();
}

void renderStartButton()
{
  fill(#ffffff);
  stroke(#000000);
  rect(startButtonX, startButtonY, startButtonW, startButtonH);
  fill(textColor);
  textSize(25);
  text("Start game", startButtonX + (startButtonW / 2) - 50, startButtonY + (startButtonH / 2));
}
