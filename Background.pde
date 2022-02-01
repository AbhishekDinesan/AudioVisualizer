//influenced by the Coding Train, StarField Animation

class StarBackground {
  float speed;
  float x;
  float y;
  float mov;
  float previousMov;
  StarBackground() {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    mov = random(width/2);
    previousMov = mov;
  }

  void update() {
     speed = map(mouseX-50, 0, width-50, 0, 10);
     if (beatDetector.isBeat()) {
       speed = map(-mouseX-50, 0, -width-50, 0, 10);//revert effect when beat hits
     }
    mov = mov - speed;
    if (mov < 1) {//reset
      mov = width/2;
      x = random(-width/2, width/2); 
      y = random(-height/2, height/2);
      previousMov= mov;
    }
  }
  void show() {
    fill(255);
    noStroke();
    
    /*the map functions takes the division between the x and y coordinates and "maps" them so that they fit within
    the smaller range from 0 to width / 2, so that newX, newY move faster.
    */

    float newX = map(x / mov, 0, 1, 0, width/2);
    float newY = map(y / mov, 0, 1, 0, height/2);
    float r = map(mov, 0, width/2, 16, 0);
    ellipse(newX, newY, r, r);

     // store the previous position 
    float prevX = map(x / previousMov, 0, 1, 0, width/2);
    float prevY = map(y / previousMov, 0, 1, 0, height/2);
    previousMov = mov;
    
    // draw a line that connects the previous point to new one
    stroke(255);
    line(prevX, prevY, newX, newY);
  }
}

void setupBackground(){
for (int i = 0; i < stars.length; i++) {//setting up, didn't want to clog setup function
    stars[i] = new StarBackground();
  }
}
