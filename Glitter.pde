class Glitter {
  float x = random (0, width);
  float y = random (-150, -300);
  float acceleration = random (4, 7);
  float r = random (4, 7);

  void fall() {
    y+= acceleration;
    if (y > height) {
      y = random (-50, -350);//starts from off of the screen and falls to the bottom
    }
  }
  void levitate() {
    y-= acceleration;
    if (y< height) {
      y = random (150, 300);
    }
  }
  void display() {
    stroke (0, 0, 255);
    ellipse (x, y, r, r);
    if (beatDetector.isBeat()) {
      ellipse (x, y, 3.5 *r, r*3.5);// if beat is Detected, exaggerate the radius of the glitter
    }
  }
}
void setupGlitter(){
  for (int i = 0; i< glitter.length; i++) {
    glitter[i] = new Glitter();
  }

}
