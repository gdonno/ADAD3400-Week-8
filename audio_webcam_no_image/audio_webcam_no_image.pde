import processing.sound.*;
import processing.video.*;
    Amplitude loudness;
    AudioIn input;
    Capture video;
    float ampt;
    PImage prevFrame;
 
    void setup() {
      size(1200, 800);
      background(255);
 
      // Create an Input stream which is routed into the Amplitude analyzer
    //  amp = new Amplitude(this);
     input = new AudioIn(this, 0);
     input.start();
   //   amp.input(in);
     input.play();
      video = new Capture(this, width, height);
      video.start();
      prevFrame = createImage(video.width, video.height, RGB);
    }      
 
     void captureEvent(Capture video) {
      prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
      prevFrame.updatePixels();
      video.read();
    }
 
    void draw() {
      background(255);
     // ampt = amp.analyze();
    //  println(ampt);
 
      float myColor = ampt*256; 
      tint((myColor), (myColor), (myColor));
      image(video, 0, 0);

      video.loadPixels();
      prevFrame.loadPixels();
    
    float totalMotion = 0;

  for (int i = 0; i < video.pixels.length; i ++ ) {
    color current = video.pixels[i];

    color previous = prevFrame.pixels[i];

    float r1 = red(current); 
    float g1 = green(current);
    float b1 = blue(current);
    float r2 = red(previous); 
    float g2 = green(previous);
    float b2 = blue(previous);

    float diff = dist(r1, g1, b1, r2, g2, b2);
    totalMotion += diff;
  }
    }
