
int bands = 32;
float[] sum = new float[bands];
int scale = 2;
float barWidth;
float smoothingFactor = 0.2;

void SpectrumEffect (float divider) {
  fft.analyze();
  for (int i = 0; i < bands; i++) {
    // Smooth the FFT spectrum data by smoothing factor as discussed in class
    sum[i] += (fft.spectrum[i] - sum[i]) * smoothingFactor;
    float r = width/ divider;
    
    // Circle Math was produced by Mr. Fowler
    // using the unit circle and trig ratios, we can create a circle of bands
    float angle = 360/bands * i;
    angle = radians(angle);

    float x = width/2;
    float y = height/2;

    x += cos(angle) * r;
    y += sin(angle) * r;

    fill(random(0,255), random(0,255), random(0,255));

    pushMatrix();
    translate(x, y);
    rotate(angle - PI/2);
    rect(0, 0, 10, sum[i]*height*scale);
    popMatrix();
    
    //creates rectangular bars that I manipulated to be mirrored in the center of the screen
    
    rect(i*barWidth, height / 2, barWidth, sum[i]*height*scale);//this thing produces a rectangular shape, make two of these
    rect(i*barWidth, height / 2, barWidth, -sum[i]*height*scale);
    rect(i*barWidth, height, barWidth, sum[i]*height*scale);
    rect((i*barWidth)*-1, height / 2, barWidth, -sum[i]*height*scale);
  }
}
