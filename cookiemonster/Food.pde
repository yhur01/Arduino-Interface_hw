class Food {

  float foodWidth;
  float foodHeight;

  //Constructor
    Food () {
    foodWidth = 20;
    foodHeight = 20;
  }

  void foodUpdate() {   
    foodX = random(20, height-20);
    foodY = random(20, width-20);
  }

  void foodDraw() {
    fill (255, 255, 255);
    tint(255);
    image (cookie, foodX, foodY, foodWidth, foodHeight);
  }
  
}

