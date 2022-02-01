// setting up libraries

import processing.sound.*;
Amplitude amp;
FFT fft;
BeatDetector beatDetector;
SoundFile sample;
PImage img;
float previousMillis = millis();
float timer = 1500;
ArrayList<CircleEffect> circles;
Glitter [] glitter = new Glitter [100];
StarBackground[] stars = new StarBackground[800];
PFont f;

void setup()
{
  //standard setup stuff
  size(400, 400);
  img = loadImage("Abhisheks' Turn.PNG");
  sample = new SoundFile(this, "Lil Baby - Sum 2 Prove (Clean).wav"); // replace with whatever song you wish to play;
  fft = new FFT(this, bands);
  amp = new Amplitude(this);
  beatDetector = new BeatDetector(this);
  fft.input(sample);
  amp.input(sample);
  beatDetector.input(sample);
  barWidth = width/float(bands); // wtf
  sample.loop();
  amp.input(sample);
  beatDetector.sensitivity(20);
  f = createFont("Algerian", 16, true); // use any font you may like
  circles = new ArrayList<CircleEffect>();
  setupGlitter();
  setupMorph();
  setupBackground();
}

void draw()
{
  background(0);
  if (millis()<2000) {//first 4s
    background(0);
    image(img, 0, 0);
  }
  if (millis() > 2000) {//next 13s
    circularIntro(0.85);
    if (millis() > previousMillis) {//revert effect
      circularIntro (0.45);
      previousMillis = millis() + timer;
    }
    textFont(f, 25);//text
    fill(255);
    text("'Sum 2 Prove'", width/2- 76, height / 2-15);//replace with your own text if needed
    text("Abhishek Dinesan", width/2 -110, height /2+25);//replace with your own text if needed
  }
  if (millis () > 17000) {//next 15s
    //method calls
    background(0);
    for (int s = 0; s < stars.length; s++) {
      stars[s].update();
      stars[s].show();
    }
    SpectrumEffect(2.5);
  }
  if (millis()> 30000) {//
    background(0);
    SpectrumEffect(2.5);
    for (int i = 0; i< glitter.length; i++) {
      glitter[i].fall();
      glitter[i].display();
    }

    if (millis() > 40000) {
      float j;
      background(0);
      for (j = 3.25; j > 0; j-= 0.25)//updates the positition of SpectrumEffect, , multiple circles being drawn inwards
        SpectrumEffect(j);
    }

    if (millis() > 48000) {
      float a = amp.analyze() * 100; 
      background (0);
      circularIntro(0.65);
      morphingFunction(width/2, height/2);//calls morphing Function
      noStroke();
      if (a >70) {
        circles.add(new CircleEffect(width/2, height/2, a * 1.2 )); // exagerates radius of 
      }
      rippleList();
    }
  }
}
void keyPressed() {// if the sapce key is pressed, pause the visualizer
  if (key == ' ') {
    if (sample.isPlaying()) {
      sample.pause();
    } else {
      sample.play();
    }
  }
}
