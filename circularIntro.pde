
void circularIntro(float increment) {
  background(0);
  float a = amp.analyze() * 100;
  int circleNumber = 24;//experimentally derived
  float diameter = width * increment;
  fill(random(0, 255), random(0, 255), random(0, 255));
  for (int i = 1; i <= circleNumber; ++i) {
    float angle = i * TWO_PI / circleNumber;
    float x = width / 2 + cos(angle) * diameter / 2; // math class, unit circle
    float y = height /2 + sin(angle) * diameter / 2;
    if (a >20 && a < 50) {
      ellipse(x, y, a* 1.75, a*1.75);// if amplitude is within this range of value, exaggerate the size of the ellipse
      increment -= .1;
    }
  }
}

  
