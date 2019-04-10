import processing.video.*;

//import processing.video.*;
import processing.sound.*;

AudioIn input;
Amplitude loudness;

int cellSize = 25;
int cols, rows;
Capture video;


void setup() {
  size(640, 480);
  cols = width / cellSize;
  rows = height / cellSize;
  colorMode(RGB, 255, 255, 255, 100);
  rectMode(CENTER);

  video = new Capture(this, width, height);
  
  video.start();  

  background(0);
  input = new AudioIn(this, 0);
  input.start();
   input.play();
     loudness = new Amplitude(this);
     loudness.input(input);
}


void draw() { 
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
