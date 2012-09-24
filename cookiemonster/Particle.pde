class Particle {

  //how much gravity
  float drag = 0.99;

  // positions of our particle
  float x;
  float y;

  //velocity of them
  float velX;
  float velY;

  color c;
  
  float particleSize;
  float shrink;
  float gravity;
  float opacity;
  float fade;

  // CONSTRUCTOR: this is a special function that is
  // called whenever a Particle is instantiated.
  Particle() {

    //colour of the particle
    c = color(255, random(200,255), random(0, 100));

    // set the positions of x and y
    x = eatenX;
    y = eatenY;

    // set the velocity of x and y to a random number between -10 and 10
    velX = random(-10, 10);
    velY = random(-10, 10);
    
    particleSize = random(1,6);
    shrink = 0.95;
    gravity = 0.5;
    opacity = 255;
    fade = 2;
  }

  void update() {

    //give it some drag
    velX*=drag;
    velY*=drag;


    //add gravity
    velY+=gravity;
    
    //shrinker
    particleSize*=shrink;

    //give the particle some movement
    x+=velX;
    y+=velY;
    opacity-=fade;
    //set the fill
    fill(c,opacity);
    //draw the circle
    ellipse (x, y, particleSize, particleSize);
  }
  
}
