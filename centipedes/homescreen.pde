int playerModeButtonW;
int playerModeButtonH;
int playerModeButtonY;
int singleplayerButtonX;
int multiplayerButtonX;

void renderHomescreen()
{
  playerModeButtonW = 200;
  playerModeButtonH = 40;
  playerModeButtonY = int(height * .75);
  singleplayerButtonX = (width / 2) - playerModeButtonW;
  multiplayerButtonX = (width / 2);

  background(background);
  button(singleplayerButtonX, playerModeButtonY, playerModeButtonW, "Singleplayer");
  button(multiplayerButtonX, playerModeButtonY, playerModeButtonW, "Multiplayer");
}
