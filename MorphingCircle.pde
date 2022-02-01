//OpenProcessing
// 3 sets of coordinates that are needed to store vector quantities(positions)
ArrayList<PVector> circleList = new ArrayList<PVector>();
ArrayList<PVector> squareList = new ArrayList<PVector>();
ArrayList<PVector> morphList = new ArrayList<PVector>();
boolean state = false;


void morphingFunction (int centerX, int centerY) {
  float totalDistance = 0;
  if (beatDetector.isBeat()) {
    state = true;
  }

  for (int i = 0; i < circleList.size(); i++) {
    PVector v1;
    if (state) {
      v1 = squareList.get(i);//retrieve the vector from the respective list
    } else {
      v1 = circleList.get(i);
    }
    // Get the vector from the morphList, and computer relative distance
    PVector v2 = morphList.get(i);
    v2.lerp(v1, 0.1);
    totalDistance += PVector.dist(v1, v2);
  }
  // If the distance is very, very small, then we can switch shapes, reverting back to the oriignal shape
  if (totalDistance < 0.05) {
    state = !state;
  }
  // Set origin to the center
  translate(centerX, centerY);
  strokeWeight(4);
  // Draw a polygon that makes up all the vertices
  beginShape();
  noFill();
  stroke(255);
  for (PVector v : morphList) {//foreach loop iterating through list and plotting its posiiton
    vertex(v.x, v.y);
  }
  endShape(CLOSE);
}

void setupMorph() { // setup Vector sizes and Lists
  for (int angle = 0; angle < 360; angle += 9) {
    PVector v = PVector.fromAngle(radians(angle-135));
    v.mult(100);
    circleList.add(v);
    morphList.add(new PVector());
  }
  for (int x = -50; x < 50; x += 10) {
    squareList.add(new PVector(x, -50));
  }
  // Right side
  for (int y = -50; y < 50; y += 10) {
    squareList.add(new PVector(50, y));
  }
  // Bottom
  for (int x = 50; x > -50; x -= 10) {
    squareList.add(new PVector(x, 50));
  }
  // Left side
  for (int y = 50; y > -50; y -= 10) {
    squareList.add(new PVector(-50, y));
  }
  
}
