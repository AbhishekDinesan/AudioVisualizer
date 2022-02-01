class CircleEffect {
  float x, y, xSpeed, ySpeed, r, colour;

  CircleEffect(float _x, float _y, float _r) {//constructor
    x = _x;
    y = _y;
    r = _r;
    colour = 225;
    xSpeed = random(-2, 2);
    ySpeed = random(-2, 2);
  }

  void display() {
    
    float randomNum = random(1, 5);
    boolean isCircle;

    if (randomNum < 2.5) { //randomizes probability of both squares and circles
      ellipse(x, y, r, r);
      isCircle = true;
    } else {
      rect(x, y, r, r);
      isCircle = false;
    }
    fill(255, colour);
    if (beatDetector.isBeat()) {
      if (isCircle) {
        ellipse (x, y, 1.5 *r, r*1.5);//exagerates radius of circles on beats
      } else {
        rect (x, y, 1.5 *r, r*1.5);
      }
    }
  }
  void move() {
    x += xSpeed;
    y += ySpeed;
    r-= .1;
    colour--;
    if (x < (-width/2) || x > width / 2) {
      xSpeed *= -1;
    } else if (y > height) {
      ySpeed *= -1;
    }
  }
}

void rippleList() {//setupList, outsourced from draw
  for (int i = circles.size()-1; i >= 0; i--) {
    CircleEffect r = circles.get(i);
    r.move();
    r.display();
    if (r.colour < 1) {
      circles.remove(i);
    }
  }
}
