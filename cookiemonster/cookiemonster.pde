import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

Serial myPort;

Particle[] particles = new Particle[20];
Particle[] particles2 = new Particle[20];
Particle[] particles3 = new Particle[20];

int eaten = 0;
float eatenX = -500;
float eatenY = -500;

import ddf.minim.*;
Minim minim;

AudioSample crunch1;
AudioSample scream;

PImage bluemonster;
PImage redmonster;
PImage cookie;
PImage monsterSmile;

float foodX = random(0, width);
float foodY = random(0, height);

float snakeX = 250;
float snakeY = 30;

float initialSpeed = 5;
float speed = initialSpeed;
float speedY = initialSpeed; 
float speedX = 0;

int snakeWidth = 40;
int snakeHeight = 40;

int score = 0;

boolean dead = false;

Food food = new Food();

int[] input= new int[2];

void setup () {
  
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
  
  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle();
  }
  
  minim = new Minim(this);
  crunch1 = minim.loadSample("crunch1.wav", 700);
  scream = minim.loadSample("scream.wav",700);
  
  cookie = loadImage("cookie.png");
  bluemonster = loadImage("bluemonster.png");
  redmonster = loadImage("redmonster.png");
  monsterSmile = loadImage("monsterSmile.png");
  
  size(500, 500);
  
  smooth();
  food.foodUpdate();
  
  }

void draw () {
  
  noStroke();
  background(0);
  
  if (!dead) { 
  death();
  checkEat();
  fill(255);
  text (score, 10, 20); 
  }
  
  drawmonster();
  fill(255);
  textSize(13);
 
  food.foodDraw();
  drawParticles();
  
}

/*
 void serialEvent (Serial myPort) {
 String inString = myPort.readStringUntil('\n');
 if (inString != null) {
 inString = trim(inString);
 float inByte = float(inString); 
 inByte = map(inByte, 0, 100, 0, width);
  }
}
*/

void drawParticles () {

  if (frameCount-eaten<15){ //add 15 frames after
  particles = (Particle[])append(particles, new Particle());
  particles2 = (Particle[])append(particles, new Particle());
  particles3 = (Particle[])append(particles, new Particle());
  }

  for (int i=0; i<particles.length; i++) {
    particles[i].update();
  }
}


void death() {
  if ((snakeX<0) || (snakeX>500) || (snakeY<0) || (snakeY>500)){
    dead = true;
    scream.trigger();
    myPort.write(1); 
  }
}

void checkEat() {
  if ((snakeX>foodX-snakeWidth/2)&&(snakeX<foodX+snakeWidth)&&(snakeY>foodY-snakeHeight/2)&&(snakeY<foodY+snakeHeight)) {
    score++;
    speed*=1.05;
    //tell the particles where and when to fire
    eaten = frameCount;
    eatenX = foodX;
    eatenY = foodY;
    
    food.foodUpdate();
    crunch1.trigger();
    
  }
}

void keyPressed() {
    if (key==' '){
      if (dead==true) {
        dead = false;
        resetGame();
    }
  }
}

void resetGame() {
  snakeX = 250;
  snakeY = 30;
  speed = initialSpeed;
  speedY = speed;
  food.foodUpdate();
  score = 0;
}

void stop()
{
  crunch1.close();
  scream.close();
  minim.stop();
  super.stop();
}
