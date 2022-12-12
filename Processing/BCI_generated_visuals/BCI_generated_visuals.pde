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
sparklingCircles sparklingCircleAnim;
sparklingTriangles sparklingTriAnim;

int rotateState=0;
float ringStart=0;
//Colors
color ThemeMain;
color Theme1;
color Theme2;
color Theme3;


float timer = 0;
float gap=1;
float alpha, beta;
float minBeta=0.4, maxBeta=0.6;
int hue, saturation, brightness;
int colorState = 1;
float Lerp(float A, float B, float t){
return A+(B-A)*t;

}

void setup() {
  colorMode(HSB,255,255,255,100);
  noStroke();
  background(0);  
  size(1320,720); 
  RandomColorGroup(0.6,0.6);

  //animations init 
  bar = new rectAnimation(int(random(0,width-500)),int(random(0,height-500)),500,60,0.2,5,color(32,27,148)); 
  sparklingCircleAnim = new sparklingCircles(random(0,width),random(0,height),30,0.1,ThemeMain);
  sparklingTriAnim = new sparklingTriangles(random(0,width),random(0,height),30,0.1,ThemeMain);
  backgroundFill = new backgroundFill(0.05,int(random(1,6)),Theme3);
  circleAnim=new circleAnimation(400,0.1,Theme2);
  circleRingAnim = new circleRingAnimation(height/2,30,20,0.03,Theme1);
  triRingAnim=new triangleRingAnimation(height/3,30,20,0.03,Theme2);
  diamondRingAnim=new diamondRingAnimation(height/4,30,20,0.03,Theme1);
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
hue =H;
saturation = S;
brightness = B;
ThemeMain = color(H,S,B);
Theme1= color(int(H+255*0.25)%255,S,B);
Theme2= color(int(H+255*0.5)%255,S,B);
Theme3= color(int(H+255*0.75)%255,S,B);

}

void ColorBrightnessGroup(float b){

ThemeMain = color(hue,saturation,int(255*b));
Theme1= color(int(hue*0.25),saturation,int(255*b));
Theme2= color(int(hue*0.5),saturation,int(255*b));
Theme3= color(int(hue*0.75),saturation,int(255*b));

// println("hue + " + hue);
brightness = int(b*255);
}

void draw() {
  background(0);  
  backgroundFill.update(); 
  sparklingCircleAnim.update();
  sparklingTriAnim.update();
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
//  timer+=0.02f;
 // if(timer>gap){
 // timer=0;
// RandomColorGroup(beta,beta); 
  //ColorBrightnessGroup((beta-minBeta)/(maxBeta-minBeta)); for bci
  ColorBrightnessGroup(1); // testing
// }
}
 

void oscEvent(OscMessage theOscMessage) {
  
//  println(theOscMessage.addrPattern());
  /* print the address pattern and the typetag of the received OscMessage */
  if(theOscMessage.checkAddrPattern("/muse/elements/alpha_absolute")){
  alpha = theOscMessage.get(0).floatValue();
  }
    if(theOscMessage.checkAddrPattern("/muse/elements/beta_absolute")){
  beta = theOscMessage.get(0).floatValue();
  if(beta>maxBeta){maxBeta = beta;}
  if(beta<minBeta){minBeta = beta;}
  }
 
    if(theOscMessage.checkAddrPattern("/play") && theOscMessage.get(0).stringValue().equals("gabba")){
   //   println(theOscMessage.get(0).stringValue());
   bar = new rectAnimation(0,0,1000,60,0.05,4,ThemeMain);rotateState = int(random(0,2));
 }
   
   if(theOscMessage.checkAddrPattern("/play") && theOscMessage.get(0).stringValue().equals("hh") ){
  hue = int(random(0,255));
  backgroundFill = new backgroundFill(0.05,1,Theme3);
  
}
if(theOscMessage.checkAddrPattern("/play") && theOscMessage.get(0).stringValue().equals("cp") ){
  waveAnim = new sinWaveAnimation(250,random(0.02,0.06),800,8,3,0.01,Theme2);
}
    
    if(theOscMessage.checkAddrPattern("/button3")){
     circleAnim=new circleAnimation(450,0.1,Theme2);
 }
  if(theOscMessage.checkAddrPattern("/play") && theOscMessage.get(0).stringValue().equals("arpy")){
     sparklingTriAnim = new sparklingTriangles(random(0,width),random(0,height),random(30,50),0.1,RandomThemeColor(int(random(1,4))));
 }
     if(theOscMessage.checkAddrPattern("/play") && theOscMessage.get(0).stringValue().equals("superpiano") ){
    //  sparklingTriAnim = new sparklingTriangles(random(0,width),random(0,height),random(30,50),0.1,RandomThemeColor(int(random(1,4))));
      triRingAnim=new triangleRingAnimation(400,30,20,0.03,Theme1);
 }
   

    if(theOscMessage.checkAddrPattern("/button4")){
   circleRingAnim = new circleRingAnimation(500,30,20,0.03,Theme1);
   
    ringStart = random(0,1);
   rotateState = int(random(0,2));
    }
    
    if(theOscMessage.checkAddrPattern("/button5")){
   circleRingAnim = new circleRingAnimation(500,30,20,0.03,Theme1);
   
    ringStart = random(0,1);
 //  rotateState = int(random(0,2));
    }
    
  if(theOscMessage.checkAddrPattern("/play") && theOscMessage.get(0).stringValue().equals("d") ){
//  lineAnim = new lineAnimation(int(random(0,width)),int(random(0,height/2)),0.1,Theme2);
 // triRingAnim=new triangleRingAnimation(400,30,20,0.03,Theme1);
   sparklingCircleAnim = new sparklingCircles(random(0,width),random(0,height),random(60,100),0.1,RandomThemeColor(int(random(1,4))));
  }
  if(theOscMessage.checkAddrPattern("/button6")){
  diamondRingAnim=new diamondRingAnimation(300,30,20,0.03,Theme2);
  }
  }
  
  color RandomThemeColor(int index){

  if(index==1){return Theme1;}
  else if(index==2){return Theme2;}
  else if(index==3){return Theme3;}
  else return ThemeMain;
  
  }
