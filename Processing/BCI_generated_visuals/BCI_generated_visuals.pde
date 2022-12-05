import oscP5.*;
import netP5.*;

// osc listener
OscP5 oscP5;

// Animations
rectAnimation bar;
backgroundFill backgroundFill;
circleAnimation circleAnim;
circleRingAnimation circleRingAnim;
triangleRingAnimation triRingAnim;
diamondRingAnimation diamondRingAnim;
lineAnimation lineAnim;
sinWaveAnimation waveAnim;

int rotateState=0;
float ringStart=0;
//Colors
color ThemeMain;
color Theme1;
color Theme2;
color Theme3;


void setup() {
  colorMode(HSB,255,255,255,100);
  noStroke();
  background(0);  
  size(1920,1080); 
  RandomColorGroup(0.6,0.6);
  
  //animations init 
  bar = new rectAnimation(int(random(0,width-500)),int(random(0,height-500)),500,60,0.2,5,color(32,27,148)); 
  backgroundFill = new backgroundFill(0.05,int(random(1,6)),Theme3);
  circleAnim=new circleAnimation(400,0.1,Theme2);
  circleRingAnim = new circleRingAnimation(500,30,20,0.03,Theme1);
  triRingAnim=new triangleRingAnimation(400,30,20,0.03,Theme2);
  diamondRingAnim=new diamondRingAnimation(300,30,20,0.03,Theme1);
  lineAnim = new lineAnimation(int(random(width/2,width)),int(random(height/2,height)),0.1,Theme2);
  // sinWaveAnimation (float f, int l, float st, float s, float sp, color col){  
 waveAnim = new sinWaveAnimation(100,random(0.02,0.08),500,5,3,0.01,Theme3);
//  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,5000);
 
}

void mousePressed(){
// RandomColorGroup(random(0.2,0.8),random(0.2,0.8));
 bar = new rectAnimation(0,0,1000,60,0.05,4,ThemeMain);
// backgroundFill = new backgroundFill(0.05,1,Theme3);
// circleAnim=new circleAnimation(450,0.1,Theme2);
// circleRingAnim = new circleRingAnimation(500,30,20,0.03,Theme1);
// triRingAnim=new triangleRingAnimation(450,30,20,0.03,Theme1);
// diamondRingAnim=new diamondRingAnimation(300,30,20,0.03,Theme1);
// ringStart = random(0,1);
// lineAnim = new lineAnimation(int(random(0,width)),int(random(0,height/2)),0.1,Theme2);
// waveAnim = new sinWaveAnimation(250,random(0.02,0.06),800,8,3,0.01,Theme2);
 rotateState = int(random(0,2));

}

void RandomColorGroup(float s,float b){
int H = int(random(0,255));
int S= int(100+(220-100)*s);
int B= int(100+(220-100)*b);
ThemeMain = color(H,S,B);
Theme1= color(int(H+255*0.25)%255,S,B);
Theme2= color(int(H+255*0.5)%255,S,B);
Theme3= color(int(H+255*0.75)%255,S,B);
}

void draw() {
  background(0);  
  backgroundFill.update(); 
  translate(width/2, height/2);
  rotate(rotateState*PI);
  waveAnim.update();
  lineAnim.update();
  //360 degree 
  bar.update();
  rotate(2*PI*ringStart);
  circleAnim.update();
  circleRingAnim.update();
  triRingAnim.update();
  diamondRingAnim.update();
}

void oscEvent(OscMessage theOscMessage) {
  rotateState = int(random(0,2));
  /* print the address pattern and the typetag of the received OscMessage */
  if(theOscMessage.checkAddrPattern("/fader1")){
  RandomColorGroup(theOscMessage.get(0).floatValue(),theOscMessage.get(0).floatValue());}
    if(theOscMessage.checkAddrPattern("/button1")){
   bar = new rectAnimation(0,0,1000,60,0.05,4,ThemeMain);}
    if(theOscMessage.checkAddrPattern("/button2")){
  backgroundFill = new backgroundFill(0.05,1,Theme3);
waveAnim = new sinWaveAnimation(250,random(0.02,0.06),800,8,3,0.01,Theme2);}
    if(theOscMessage.checkAddrPattern("/button3")){
   circleAnim=new circleAnimation(450,0.1,Theme2);
 }
    if(theOscMessage.checkAddrPattern("/button4")){
   circleRingAnim = new circleRingAnimation(500,30,20,0.03,Theme1);
   
    ringStart = random(0,1);
   rotateState = int(random(0,2));
    }
  if(theOscMessage.checkAddrPattern("/button5")){
  lineAnim = new lineAnimation(int(random(0,width)),int(random(0,height/2)),0.1,Theme2);
  triRingAnim=new triangleRingAnimation(400,30,20,0.03,Theme1);
  }
  if(theOscMessage.checkAddrPattern("/button6")){
  diamondRingAnim=new diamondRingAnimation(300,30,20,0.03,Theme2);
  }
  }
