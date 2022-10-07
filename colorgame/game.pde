void game() {
  background(white);
  music.rewind();
  music.play();
  timer--;

  //left rectangle
  tactileRect(-5, -5, 400, 650, black);

  //right rectangle
  tactileRect(400, 0, 400, 650, white);

  textFont(peoplebook);
  fill(black);
  text("Match", 600, 300);
  fill(white);
  text("don't", 200, 200);
  text("match", 200, 300);
  
  //score display
  textFont(Bubblegum);
  textSize(50);
  fill(red);
  text("score:", 400, 50);
  text(score, 550, 50);
   
   //timer display
  text(timer, 50, 50);

  if (score > highscore) {
    highscore = score;
  }
  
  textSize(timer);
  fill(colors[randomcolor]);
  text(colorwords[randomword], width/2, height/2);

  if (timer<=0) {
    incorrect();
  }
 
}

void gameclicks() {
  if (randomcolor == randomword && rectbuttons(400, 0, 400, 600)) {
      correct();
      randomize();
  } 
  else if (randomcolor != randomword && rectbuttons(0, 0, 400, 600)) {
      correct();
      randomize();
  } 
  else if (randomcolor != randomword && rectbuttons(400, 0, 400, 600)) {
      incorrect();
  } 
  else if (randomcolor == randomword && rectbuttons(0, 0, 400, 600)) {
      incorrect();
  }
}
