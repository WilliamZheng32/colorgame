//William Zheng
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer music, failure, success;

//color pallette
color lightblue = #ADD8E6;
color lightgreen = #00FF00;
color yellow = #FFE600;
color white = #FFFFFF;
color brown = #964B00;
color darkbrown = #4E3524;
color grey = #808080;
color darkblue = #00008B;
color black = #000000;
color cream = #fefae0;
color bkg = cream;
color red = #ff0000;
color blue = #0000FF;
color green = #00FF00;
color orange = #FFA500;

int randomword = (int) random(0, 5);
int randomcolor = (int) random(0, 5);
int randomnumber = (int) random(0, 2);
String[] colorwords = {"RED", "GREEN", "BLUE", "YELLOW", "BROWN"};
color[] colors = {red, green, blue, yellow, brown};

//gif
PImage[] gif;
int numberofframes;
int f;

//mode variables
int mode;
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;

//fonts
PFont peoplebook;
PFont Bubblegum;

//other variables
int score;
int highscore;
int timer;
int textsize;

int vx;

boolean leftkey, rightkey;

void setup() {

  mode = INTRO;
  score = 0;
  highscore = 0;
  timer = 200;
  textsize = 100;
  vx = 400;

  minim = new Minim(this);
  music = minim.loadFile("MUSIC.mp3");
  success = minim.loadFile("SUCCESS.wav");
  failure = minim.loadFile("FAILURE.wav");

  peoplebook = createFont("peoplebook.otf", 100);
  Bubblegum = createFont("Bubblegum.ttf", 100);

  numberofframes = 60;
  gif = new PImage[numberofframes];

  int i = 0;
  while ( i < numberofframes) {
    gif[i] = loadImage("frame_"+i+"_delay-0.03s.gif");
    i++;
  }
  size(800, 600);

  textAlign(CENTER, CENTER);
  reset();
}

void draw() {

  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  }
}

boolean rectbuttons(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true;
  } else {
    return false;
  }
}

boolean circlebuttons(int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    return true;
  } else {
    return false;
  }
}

void tactileRect(int x, int y, int w, int h, color f) {
  fill(f);
  strokeWeight(5);

  if (rectbuttons(x, y, w, h)) {
    stroke(white);
  } else {
    stroke(black);
  }
  rect(x, y, w, h, 100);
}

void tactileCircle(int x, int y, int d, color f) {
  fill(f);
  strokeWeight(5);

  if (circlebuttons(x, y, d/2)) {
    stroke(white);
  } else {
    stroke(black);
  }
  circle(x, y, d);
}

void correct() {
  score+=1;
  timer = 200;
  success.rewind();
  success.play();
  randomcolor = (int) random(0, 5);
  randomword = (int) random(0, 5);
  randomnumber = (int) random(0, 2);
  println(randomnumber);
}

void incorrect() {
  mode = GAMEOVER;
  failure.rewind();
  failure.play();
}

void randomize() {

  //matching
  if (randomnumber == 0) {
    randomcolor = randomword;
  }
  //nonmatching
  else {
    while (randomcolor == randomword) {
      randomcolor = (int) random(0, 5);
      randomword = (int) random(0, 5);
    }
  }
}
