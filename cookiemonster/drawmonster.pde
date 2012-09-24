void drawmonster() {

  if (!dead) {  //only update the position if its not dead
    if (keyPressed) {
      if (key==CODED) {
        if (keyCode==UP) {
          if (speedY==0) {  
            speedY = -speed; 
            speedX = 0;    
          }
        } 
        else if (keyCode==DOWN) {
          if (speedY==0) {
            speedY = speed;
            speedX = 0;
          }
        }
        else if (keyCode==LEFT) {
          if (speedX==0) {
            speedX = -speed;
            speedY = 0;
          }
        }
        else if (keyCode==RIGHT) {
          if (speedX==0) {
            speedX = speed;
            speedY = 0;
          }
        }
      }
    }
  }
  
  if (dead) { 
    speedX = 0;
    speedY = 0;
    fill(255);
    textAlign(CENTER);
    textSize(15);
    text("You Got", width/2, 200);
    textSize(30);
    text(score, width/2, height/2);
    textSize(13);
    text("Press Space to restart", width/2, 450);
  }
  
  snakeX+=speedX;
  snakeY+=speedY;
  imageMode(CENTER);
  
  if (!dead) { 
    tint(255);
    image (bluemonster, snakeX, snakeY, snakeWidth, snakeHeight);
       if (frameCount-eaten<20) {
       image(monsterSmile, snakeX, snakeY);
       }
    }
    else { 
    tint(255);
    image (redmonster, snakeX, snakeY, snakeWidth, snakeHeight);
    }
}

