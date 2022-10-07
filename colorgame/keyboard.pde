void keyPressed() {
 
}

void keyReleased() {
   if (mode == GAME) {
    if (keyCode == LEFT) {
      if (randomcolor != randomword) {
        correct();
        randomize();
      } 
      else if ( randomcolor == randomword) {
        incorrect();
      }
    }
    if (keyCode == RIGHT) {
      if (randomcolor == randomword) {
        correct();
        randomize();
      } 
      else if (randomcolor != randomword) {
        incorrect();
      }
    }
  }
}
