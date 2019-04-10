import processing.sound.*;
import processing.video.*;
    Amplitude loudness;
    AudioIn input;
    Capture video;
    float ampt;
    PImage prevFrame;
    int cellSize = 25;
int cols, rows;
 
    void setup() {
      size(1200, 800);
      //background(255);
   cols = width / cellSize;
  rows = height / cellSize;
  colorMode(RGB, 255, 255, 255, 100);
  rectMode(CENTER);
      // Create an Input stream which is routed into the Amplitude analyzer
    //  amp = new Amplitude(this);
     input = new AudioIn(this, 0);
     input.start();
   //   amp.input(in);
     input.play();
      video = new Capture(this, width, height);
      video.start();
      prevFrame = createImage(video.width, video.height, RGB);
        background(0);
    }      
 
     void captureEvent(Capture video) {
      prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
      prevFrame.updatePixels();
      video.read();
    }
 
    void draw() {
     // background(255);
     // ampt = amp.analyze();
    //  println(ampt);
 
    //  float myColor = ampt*256; 
    //  tint((myColor), (myColor), (myColor));
      image(video, 0, 0);

      video.loadPixels();
      prevFrame.loadPixels();
    
   // float totalMotion = 0;

   // float diff = dist(r1, g1, b1, r2, g2, b2);
   // totalMotion += diff;
    
    if (video.available()) {
    video.read();
    video.loadPixels();
    
    background(0, 0, 255);

    for (int i = 0; i < cols;i++) {
      for (int j = 0; j < rows;j++) {

        int x = i * cellSize;
        int y = j * cellSize;
        int loc = (video.width - x - 1) + y*video.width; 
        color c = video.pixels[loc];
        float sz = (brightness(c) / 255.0) * cellSize;
        fill(255);
        stroke(random(255), random(255), random(255));
        rect(x + cellSize/2, y + cellSize/2, sz, sz);
      }
    }
  }
  }
    
