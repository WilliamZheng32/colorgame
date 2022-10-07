void intro() {

  music.play();
  image(gif[f], 0, 0, width, height);
  f++;
  if ( f == numberofframes) f = 0;

  textsize +=3;
  if (textsize>=200) {
    textsize = 1;
    randomcolor = (int) random(0, 5);
  }

  textFont(Bubblegum);
  textSize(textsize);
  fill(colors[randomcolor]);
  text("COLOR", 400, 200);
  text("GAME", 400, 300);

  //startbutton
  fill(white);
  tactileRect(300, 400, 200, 100, white);
  textSize(50);
  fill(black);
  text("START", 400, 450);
}

void introclicks() {
  if (rectbuttons(300, 400, 200, 100)) {
    mode = GAME;
  }
}
