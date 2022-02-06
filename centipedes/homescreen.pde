float startButtonX = 100;
float startButtonY = 50;
float startButtonW = 150;
float startButtonH = 80;

void renderHomescreen()
{
  background(#ffffff);
  renderStartButton();
}

void renderStartButton()
{
  rect(startButtonX,startButtonY,startButtonW,startButtonH);
  fill(#000000);
  textSize(25);
  text("Start game", startButtonX + (startButtonW / 2) - 50, startButtonY + (startButtonH / 2));
}
