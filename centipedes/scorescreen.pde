int btnScoreScreenY;
int btnMenuX;
int btnReplayX;

void renderScoreScreen()
{
  btnScoreScreenY = (height / 2) - (btnH / 2);
  btnMenuX = width / 2 - btnWideW;
  btnReplayX = width / 2;

  timeInMillis = millis();
  background(background);

  fill(textColor);

  String text = "Game over!";
  textSize(50);
  float textW = textWidth(text);
  text(text, width / 2 - textW / 2, height * .2);

  textSize(25);
  if (!isMultiplayer) {
    text = "Your score : " + scorePlayer1;
    textW = textWidth(text);
    text(text, width / 2 - textW / 2, height * .30);
  } else {
    text = "Score player 1: " + scorePlayer1;
    textW = textWidth(text);
    text(text, width / 2 - textW - 10, height * .30);

    text = "Score player 2: " + scorePlayer2;
    textW = textWidth(text);
    text(text, width / 2 + 10, height * .30);
  }

  button(btnMenuX, btnScoreScreenY, btnWideW, "Menu");
  button(btnReplayX, btnScoreScreenY, btnWideW, "Replay");
}
