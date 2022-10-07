void gameover() {
  vx +=3;

  //gameover text
  background(red);
  fill(black);
  textSize(150);
  text("GAME", vx, 100);
  text("OVER", vx, 200);

  if (vx > 1000) {
    vx = -200;
  }

  //score text
  textSize(50);
  text("Score:", 350, 400);
  text(score, 500, 400);

  //highscore text
  text("highscore:", 300, 500);
  text(highscore, 500, 500);

  //restart button
  tactileCircle(700, 500, 100, orange);
  textSize(20);
  fill(white);
  text("restart", 700, 500);
}

void gameoverclicks() {
  if (circlebuttons(600, 400, 200)) {
    mode = INTRO;
  }
  reset();
}
