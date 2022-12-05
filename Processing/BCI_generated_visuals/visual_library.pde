class rectAnimation{
  int xPos,yPos,len,wid;
  float speed; 
  float complete=0;
  int number = 3;
  float gap=0.5;
  color barColor;
  //1- right, 2-up, 3-down, 4-left
  rectAnimation (int x, int y, int l, int w, float sp, int n, color col){  
    xPos = x-l/2; 
    yPos = y-int((w*n+w*gap*(n-1))/2);
    len = l;
    wid=w;
    speed=sp;
    number=n;
    barColor=col;
  } 
  void update() { 
    fill(barColor);
    if (complete < PI-speed) {  
      complete+=speed;
      if(complete<=0.5 * PI){
        for(int i=0;i<number;i++){
           rect(xPos, yPos+i*(gap*wid+wid), sin(complete)*len, wid); 
        }      
      }
      if(complete>0.5*PI){
       for(int i=0;i<number;i++){
            rect(xPos+len-sin(complete)*len, yPos+i*(gap*wid+wid), sin(complete)*len, wid); 
        }     
      }
    } 
    }
  } 
  
 class backgroundFill{
  float speed; 
  float complete=0;
  int number = 3;
  color bgColor;
  //n - split screens
  backgroundFill (float sp, int n, color col){  
    speed=sp;
    number=n;
    bgColor = col;
  } 
  void update() { 
    complete+=speed;
    fill(bgColor);
    if(complete<PI)
    for(int i=0;i<number;i++){
      if((i%2)==0)
      {
        rect(width*i/number,0,width/number,height*(sin(complete)));
      }
      else
      { 
        rect(width*i/number,height-height*(sin(complete)),width/number,height*(sin(complete)));
      }        
    }
    }
  } 
  
   class circleAnimation{
  int radius;
  float speed; 
  float complete=0;
  color bgColor;
  //n - split screens
 circleAnimation (int r, float sp, color col){  
   radius = r;
   speed=sp;
   bgColor = col;
  } 
  void update() { 
    complete+=speed;
    fill(bgColor);
    if(complete<PI){
    circle(width/4,0,radius*sin(complete));}
    }
  } 
  
     class circleRingAnimation{
  int radius;
  int particleR;
  int number;
  float speed; 
  float complete=0;
  color shapeColor;
  //n - split screens
 circleRingAnimation (int r, int parR, int n, float sp, color col){  
   radius = r;
   particleR=parR;
   number = n;
   speed=sp;
   shapeColor = col;
  } 
  void update() { 
    complete+=speed;
    float theta = 2*PI/number;
    fill(shapeColor);
    if(complete<PI){
    for(int i =0;i<number;i++){
    if(i<=sin(complete)*number){
      circle(radius*sin(theta*i),radius*cos(theta*i),particleR);
  }
    }
    }
    
  }
    }
    
   class triangleRingAnimation{
  int radius;
  int particleR;
  int number;
  float speed; 
  float complete=0;
  color shapeColor;
  //n - split screens
 triangleRingAnimation (int r, int parR, int n, float sp, color col){  
   radius = r;
   particleR=parR;
   number = n;
   speed=sp;
   shapeColor = col;
  } 
  void update() { 
    complete+=speed;
    float theta = 2*PI/number;
    float alpha = atan(0.5*particleR/(radius+(sqrt(3)/2.0)*particleR));
    float l=sqrt(radius*radius+particleR*particleR-2*radius*particleR*cos((5/6.0)*PI));
    fill(shapeColor);
    if(complete<PI){
    for(int i =0;i<number;i++){
    if(i<=sin(complete)*number){
      triangle(radius*sin(theta*i),radius*cos(theta*i),l*sin(theta*i-alpha),l*cos(theta*i-alpha),l*sin(theta*i+alpha),l*cos(theta*i+alpha));

    }
    }
    
  }
    }
  }
     class diamondRingAnimation{
  int radius;
  int particleR;
  int number;
  float speed; 
  float complete=0;
  color shapeColor;
  //n - split screens
 diamondRingAnimation (int r, int parR, int n, float sp, color col){  
   radius = r;
   particleR=parR;
   number = n;
   speed=sp;
   shapeColor = col;
  } 
  void update() { 
    complete+=speed;
    float theta = 2*PI/number;
    float alpha = atan(0.5*particleR/(radius+(sqrt(3)/2)*particleR));
    float l=sqrt(radius*radius+particleR*particleR-2*radius*particleR*cos((5/6.0)*PI));
    fill(shapeColor);
    if(complete<PI){
    for(int i =0;i<number;i++){
    if(i<=sin(complete)*number){
      quad(radius*sin(theta*i),radius*cos(theta*i),l*sin(theta*i-alpha),l*cos(theta*i-alpha),(radius+sqrt(3)/2*particleR*2)*sin(theta*i),(radius+sqrt(3)/2*particleR*2)*cos(theta*i),l*sin(theta*i+alpha),l*cos(theta*i+alpha));
    }
    }
    
  }
    }
  }
  
class lineAnimation{
  float xPos;
  float yPos;
  float speed;
  float complete=0;
  color lineColor;
  //n - split screens
lineAnimation (float x, float y, float sp, color col){  
   if(x==width/2 || y==height/2){
   x+=1;
   y+=1;
   }
   xPos=x;
   yPos=y;
   speed = sp;
   lineColor = col;
  } 
  void update() { 
      translate(-width/2, -height/2);
    stroke(lineColor);
    strokeWeight(30);
    
    float l = 2*sqrt((xPos-width/2)*(xPos-width/2)+(yPos-height/2)*(yPos-height/2));
    float alpha = atan((width/2-xPos)/(height/2-yPos));
    
    if (complete < PI-speed) {  
      complete+=speed;
      if(complete<=0.5 * PI){
      line(xPos, yPos, xPos+(sin(complete)*l)*sin(alpha), yPos+(sin(complete)*l)*cos(alpha) ); 
      }
      if(complete>0.5*PI){
      line(xPos+(1*l)*sin(alpha),yPos+(1*l)*cos(alpha), xPos+((1-sin(complete))*l)*sin(alpha),yPos+((1-sin(complete))*l)*cos(alpha)); 
      }
    } 
    noStroke();
      translate(width/2, height/2);
  }
    }
    
    
    
    
class sinWaveAnimation{
  float factor;
  int len,number;
  float speed; 
  float _b;
  float complete=0;
  color shapeColor;
  float step,size;
  float prevX, prevY;
 sinWaveAnimation (float f, float b, int l, float s, int st, float sp, color col){  
   factor = f;
   size=s;
   _b=b;
   len = l;
   number = int(l/st);
   speed=sp;
   shapeColor = col;
   step = st;
   prevX=width/2-len/2;
   prevY=height/2;
  } 
  void update() { 
    translate(-width/2, -height/2);
    complete+=speed;
    stroke(shapeColor);
    strokeWeight(size);
    if(complete<PI){
      if(complete<0.5*PI){
          for(int i =0;i<number;i++){
            if(i<sin(complete)*number){
                 line(width/2-len/2+(i-1)*step,height/2+factor*sin(_b*(i-1)*step),width/2-len/2+i*step,height/2+factor*sin(_b*i*step));
            }
        } 
    }
          else{
          for(int i=number;i>0;i--){
            if(i<sin(complete)*number){
                 line(width/2-len/2+(number-i-1)*step,height/2+factor*sin((number-i-1)*_b*step),width/2-len/2+(number-i)*step,height/2+factor*sin((number-i)*_b*step));
            }
        } 
        } 
    }
         noStroke();
         translate(width/2, height/2);
      } 
  }
  
  
  class sparklingCircles{
    // not updated
  float factor;
  int len,number;
  float speed; 
  float _b;
  float complete=0;
  color shapeColor;
  float step,size;
  float prevX, prevY;
 sparklingCircles (float f, float b, int l, float s, int st, float sp, color col){  
   factor = f;
   size=s;
   _b=b;
   len = l;
   number = int(l/st);
   speed=sp;
   shapeColor = col;
   step = st;
   prevX=width/2-len/2;
   prevY=height/2;
  } 
  void update() { 
    translate(-width/2, -height/2);
    complete+=speed;
    stroke(shapeColor);
    strokeWeight(size);
    if(complete<PI){
      if(complete<0.5*PI){
          for(int i =0;i<number;i++){
            if(i<sin(complete)*number){
                 line(width/2-len/2+(i-1)*step,height/2+factor*sin(_b*(i-1)*step),width/2-len/2+i*step,height/2+factor*sin(_b*i*step));
            }
        } 
    }
          else{
          for(int i=number;i>0;i--){
            if(i<sin(complete)*number){
                 line(width/2-len/2+(number-i-1)*step,height/2+factor*sin((number-i-1)*_b*step),width/2-len/2+(number-i)*step,height/2+factor*sin((number-i)*_b*step));
            }
        } 
        } 
    }
         noStroke();
         translate(width/2, height/2);
      } 
  }
