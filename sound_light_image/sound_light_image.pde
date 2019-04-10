import ddf.minim.*;
import ddf.minim.signals.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*;
 
Minim minim;
AudioInput in;
 
PGraphics pgBase;
 
void settings() {
  size( 540, 687 );
}
 
void setup()
{
  pgBase=createGraphics(width, height);
  shapeSketch0(pgBase);  
  minim = new Minim( this );
  in = minim.getLineIn( Minim.STEREO, 512 );
}
 
void draw()
{
  PImage pg=pgBase.copy();
  image(pg, 0, 0, width, height);
  float p = 0;
  for ( int i = 0; i < in.bufferSize(); i++ ) {
    p += abs( in.mix.get( i ) ) * 1;
  }
  println("P values="+p);
  loadPixels();
 
  p=constrain(p, 0, 400);    //Optional as map will take care of constraining the value anyways.
 
 
  // ************************************
  //OPTION: Next try either of both lines
  //p=map(p, 0, 400, 0, 2);  //Changing from 0 to 2. You need to make lots of noise to see the figure
  //p=map(p, 0, 400, 1, 2);    //Changing from 1 to 2. You always see the image. Noise just makes it whiter.
 
  for (int i=0; i<(width*height); i++) {
    float r = red(pixels[i]);
    float g = green(pixels[i]);
    float b = blue(pixels[i]);
 
    // ************************************
    // TRY commenting out any of these next three lines to see effects on single basic colors
 
    //Halves my color so when I multiply by the max value (aka 2), it is still within the color range
    r=r/2.0*p;
    g=g/2.0*p;  
    b=b/2.0*p;
 
    pixels[i] = color(r, g, b);
  }
  updatePixels();
 
  //Draws the original image in the lower right quadrant for comparison purposes
  //image(pg, width/2, height/2, width, height);
}
 
public void stop()
{
  in.close();
  minim.stop();
  super.stop();
}
 
 
void shapeSketch0(PGraphics ap) {
  ap.beginDraw();
  ap.background(211, 38, 38);
  ap.rect(110.0f, 69.0f, 194.0f, 194.0f);
  ap.fill(38, 42, 211);
  ap.rect(0, 0, 239.0f, 167.0f);
  ap.rect(176.0f, 336.0f, 0.0f, 0.0f);
  ap.ellipse(346.0f, 305.0f, 210.0f, 210.0f);
  ap.line(371.0f, 142.0f, 34.0f, 408.0f);
  ap.line(148.0f, 552.0f, 482.0f, 96.0f);
  ap.strokeWeight(5);
  ap.line(180.0f, 559.0f, 492.0f, 108.0f);
  ap.line(25.0f, 382.0f, 368.0f, 126.0f);
  ap.endDraw();
}
