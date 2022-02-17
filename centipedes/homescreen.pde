float playerModeButtonW;
float playerModeButtonH;
float playerModeButtonY;
float singleplayerButtonX;
float multiplayerButtonX;

void renderHomescreen()
{
  playerModeButtonW = 200;
  playerModeButtonH = 40;
  playerModeButtonY = height * .75;
  singleplayerButtonX = (width / 2) - playerModeButtonW;
  multiplayerButtonX = (width / 2);

  background(backgroundColor);
  renderSingleplayerButton();
  renderMultiPlayerButton();
}

void renderSingleplayerButton()
{
  int textSize = 20;

  fill(#ffffff);
  stroke(#000000);
  rect(singleplayerButtonX, playerModeButtonY, playerModeButtonW, playerModeButtonH);
  fill(textColor);
  textSize(textSize);
  text("Singleplayer", singleplayerButtonX + (playerModeButtonW / 2) - 50, playerModeButtonY + (playerModeButtonH / 2) + (textSize / 4));
}

void renderMultiPlayerButton()
{
  int textSize = 20;

  fill(#ffffff);
  stroke(#000000);
  rect(multiplayerButtonX, playerModeButtonY, playerModeButtonW, playerModeButtonH);
  fill(textColor);
  textSize(textSize);
  text("Multiplayer", multiplayerButtonX + (playerModeButtonW / 2) - 50, playerModeButtonY + (playerModeButtonH / 2) + (textSize / 4));
}
