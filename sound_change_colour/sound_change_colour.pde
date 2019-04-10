import processing.sound.*;

AudioIn input;
Amplitude loudness;

void setup() {
  size(640, 360);
  background(255);

  // Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);
  // Begin capturing the audio input
  input.start();
  // start() activates audio capture so that you can use it as
  // the input to live sound analysis, but it does NOT cause the
  // captured audio to be played back to you. if you also want the
  // microphone input to be played back to you, call
 input.play();
  // instead (be careful with your speaker volume, you might produce
  // painful audio feedback. best to first try it out wearing headphones!)

  // Create a new Amplitude analyzer
  loudness = new Amplitude(this);

  // Patch the input to the volume analyzer
  loudness.input(input);
}

// Sets the background gray value based on the distance 
// of the mouse from the center of the screen
void draw() {
  noStroke();
  float inputLevel = map(mouseY, 0, height, 1.0, 0.0);
  input.amp(inputLevel);
  
  float d = dist(width/2, height/2, mouseX, mouseY);
  float maxDist = dist(0, 0, width/2, height/2);
  float gray = map(d, 0, maxDist, 0, 255);
  fill(gray);
  rect(0, 0, width, height);
}
