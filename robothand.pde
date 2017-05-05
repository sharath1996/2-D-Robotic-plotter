import processing.serial.*;




Serial myPort;  
char j,k;
String[] ang1;
String[] ang2;
float x,y,px,py,t2,t1, k2,k1,o1,o2,x1=0,x2=0,y1=0,y2=0,m;
int th1, th2;
boolean state=true;
int mode=0;
int rectX, rectY;      // Position of square button
float rbusX1,rbusY1,rbusX2,rbusY2,rbusX3,rbusY3,rbusX4,rbusY4; // Position of rohmbus button
int squareX,squareY;
float triX1,triY1,triX2,triY2,triX3,triY3;
int rectSize = 50;     // Diameter of rect
int rohmbusSize = 50; // Diameter of rohmbus
int squareSize=50;
int circdia=50;
int eleX,eleY;
float triSize=30;
color rectColor, rohmbusColor, baseColor,squareColor,triColor,circColor;
color Highlight,currentColor;
boolean rectOver= false;
boolean squareOver=false;
boolean rohmbusOver = false;
boolean triOver=false;
boolean circOver=false;




void setup() {
  size(1000,1000);


   String portName = "";
background(255);
  myPort = new Serial(this, portName, 9600);
  frameRate(9600);
    rectColor = color(100,50,200);
  Highlight = color(255,200,50);
  rohmbusColor = color(255);
  squareColor=color(200,255,0);
  triColor=color(150,150,150);
  baseColor = color(50,50,60);
  circColor=color(90,180,60);
  currentColor = baseColor;
  rbusX1 = width/3-rohmbusSize/4+15;
  rbusY1 = height/4;
  rectX = width/6-rectSize/2;
  rectY = height/4-rectSize/2;
  squareX=width/2-squareSize/2;
  squareY=height/4-squareSize/2;
  triX1=width*0.65;  triY3=triY1=height*0.35;  triX2=triX1+triSize;  triY2=triY1-(2*triSize);  triX3=triX1+(2*triSize);
  rbusX1=width/4;  rbusY4=rbusY1=height*0.25;  rbusX3=rbusX2=rbusX1+rohmbusSize*0.85;  rbusY2=rbusY1-(rohmbusSize*sin(3.14/3)); rbusX4=rbusX1+(2*rohmbusSize); rbusY3=rbusY1+(rohmbusSize*sin(3.14/3));
  eleX=width/2-circdia/2; eleY=height/2-circdia/2;
  ellipseMode(CENTER);
}

void draw() {
stroke(0);
update(mouseX, mouseY);
  background(currentColor);
  
  if (rectOver) {
    fill(Highlight);
  } else {
    fill(rectColor);
  }
  noStroke();
  rect(rectX, rectY, rectSize, rectSize/2);
  
  if (rohmbusOver) {
    fill(Highlight);
  } else {
    fill(rohmbusColor);
  }
  noStroke();
  triangle(rbusX1, rbusY1, rbusX2,rbusY2,rbusX4,rbusY4);
  triangle(rbusX1, rbusY1, rbusX3,rbusY3,rbusX4,rbusY4);
  
  if(squareOver){
    fill(Highlight);
  }else{
    fill(squareColor);
  }
  noStroke();
  rect(squareX,squareY,squareSize,squareSize);
  
  if(triOver){
    fill(Highlight);
  }else{
    fill(triColor);
  }
  noStroke();
  triangle(triX1,triY1,triX2,triY2,triX3,triY3);
  if (circOver){
    fill(Highlight);
  }else{
    fill(circColor);
  }
  noStroke();
  ellipse(eleX,eleY,circdia,circdia);




  if(mode==1) {  

  if (mousePressed == true) {
       myPort.write("13");
       myPort.write('\n'); 
   
    line(mouseX, mouseY, pmouseX, pmouseY);
          px = mouseX;  
          py = 1000-mouseY;
          send_angles(px,py);
  }
 else if(mousePressed==false){
   myPort.write("03");
    myPort.write('\n');
 }
 }



else if(mode==2){
            drawSquare();  


}
else if(mode==3){
            drawRectangle();  


}
else if(mode==4){
            drawTriangle();  


}
else if(mode==5){
  drawRhombus();
}
}


void drawRhombus(){
       myPort.write("13");
       myPort.write('\n'); 
       delay(100);
  y=400;
for (x=400;x<=550;x=x+5){
      y=y+((x-400));
      send_angles(x,y);
      
}

for (x=550;x<=700;x=x+5){
      y=y-((x-550));
      send_angles(x,y);
      
}

for (x=700;x>=550;x=x-5){
      y=y-((x-550));
      send_angles(x,y);

}

for (x=550;x>=400;x=x-5){
      y=y+((x-400));
      send_angles(x,y);
      
}
    myPort.write("03");
    myPort.write('\n');
  mode=0;}


void drawTriangle(){
         myPort.write("13");
         myPort.write('\n'); 
         delay(100);
         y=300;
for (x=400;x<=550;x=x+5){
      y=y+((x-400));
      send_angles(x,y);
      
}

for (x=550;x<=700;x=x+5){
      y=y-((x-550));
      send_angles(x,y);
      
}

for (x=700;x>=400;x=x-5){
      send_angles(x,y);}
    mode=0;
    myPort.write("03");
    myPort.write('\n');
}

void drawRectangle(){
      myPort.write("13");
       myPort.write('\n'); 
       delay(100);
              x=400;
              o1=400;
              y=700;
              o2=700;
          for(x=400; x<=700; x=x+5)
    {
          send_angles(x,y);
         
  
  }
       x=700;
       o1=700;
         
         o2=700;
          for(y=700; y>=600; y=y-5)
    {
      send_angles(x,y);
  }

         x=700;
         o1=700;
         y=600;
         o2=600;
          for(x=700; x>=400; x=x-5)
    {
       send_angles(x,y);
  }

         x=400;
         o1=400;
         o2=600;
          for(y=600; y<=700; y=y+5)
    {
          
           send_angles(x,y);     

  }
          mode=0;
          myPort.write("03");
          myPort.write('\n');
      }

void drawSquare(){
         myPort.write("13");
         myPort.write('\n'); 
         delay(100);
              x=400;
              o1=400;
              y=700;
              o2=700;
          for(x=400; x<=700; x=x+5)
    {
          send_angles(x,y);
         
  
  }
       x=700;
       o1=700;
         
         o2=100;
          for(y=700; y>=400; y=y-5)
    {
      send_angles(x,y);
  }

         x=700;
         o1=700;
         y=400;
         o2=400;
          for(x=700; x>=400; x=x-5)
    {
       send_angles(x,y);
  }

         x=400;
         o1=400;
         o2=400;
          for(y=400; y<=700; y=y+5)
    {
          
           send_angles(x,y);     

  }
          mode=0;
          myPort.write("03");
          myPort.write('\n');
      }
 


void send_angles(float x,float y)
{
              px=x/55;
              py=1000-y;
              py=y/55;   
              k1=sqrt((px*px)+(py*py))/(2*14);
              t2=PI-2*acos(k1);
              t1=acos(k1)+atan2(py,px);
              t1=(t1*180)/PI;
              t2=(t2*180)/PI;
              th1=(int(t1)*10-90)+1;
              th2=(int(t2)*10)+2;
              String angle1;
              String angle2;
              angle1=nf(th1,4);
              angle2=nf(th2,4);
           //   line(x,y,400,400);
              myPort.write(angle1);
              myPort.write('\n');
              myPort.write(angle2);
               myPort.write('\n');
              delay(100);
}

void update(int a, int b) {
  if ( overRohmbus() ){
    rohmbusOver = true;
    rectOver = false;
    squareOver=false;
    triOver=false;
    circOver=false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize/2) ) {
    rectOver = true;
    rohmbusOver = false;
    squareOver=false;
    triOver=false;
    circOver=false;
  }else if (overRect(squareX,squareY,squareSize,squareSize) ){
    squareOver=true;
    rohmbusOver = false;
    rectOver = false;
    triOver=false;
    circOver=false;
  }else if(overTriangle(triX1,triY1,triX2,triY2,triX3,triY3)){
    triOver=true;
    squareOver=false;
    rohmbusOver = false;
    rectOver = false;
    circOver=false;
  }else if(overCircle(eleX,eleY,circdia)){
    circOver=true;
    triOver=false;
    squareOver=false;
    rohmbusOver = false;
    rectOver = false;
  }
  else {
    rohmbusOver = rectOver= squareOver = triOver=circOver=false;
  }
}

void mousePressed() {
  if (circOver)
  {
    send_data(1);  
  }
  if (rohmbusOver) {
    send_data(5);
    currentColor=rohmbusColor;
  }
  if (rectOver) {
    send_data(3);
    currentColor=rectColor;
  }
  if (squareOver){
    send_data(2);
    currentColor=squareColor;
  }
  if (triOver){
    send_data(4);
    currentColor=triColor;
}}

boolean overRect(int a, int b, int width, int height){
  if (mouseX >= a && mouseX <= a+width && 
      mouseY >= b && mouseY <= b+height) {
    return true;
  } else {
    return false;
  }
}

boolean overRohmbus() {
  float a,b;
  boolean flag=false;
  float slope=tan((55*3.14)/180);
  
  if (mouseX<rbusX2 && mouseX>rbusX1)
  {
    float len=mouseX-rbusX1;
    b=len*slope;
    if (rbusY1-mouseY<=b  && rbusY1-mouseY>0) flag=true;
    else if(mouseY-rbusY1<=b  && mouseY-rbusY1>0) flag=true;
    else flag=false;
  }
  else if(mouseX>rbusX2 && mouseX<rbusX4){
    float len=rbusX4-mouseX;
    b=len*slope;
    if (rbusY1-mouseY<=b && rbusY1-mouseY>0) flag=true;
    else if(mouseY-rbusY1<=b  && mouseY-rbusY1>0) flag=true;
    else flag=false;
  }
  return flag;
  
}

boolean overTriangle(float a1,float b1,float a2, float b2, float a3, float b3){
  float a,b;
  boolean flag=false;
  if (mouseX<a2 && mouseX>a1)
  {
    float len=mouseX-a1;
    float slope=tan((60*3.14)/180);
    b=len*slope;
    if (b1-mouseY<=b  && b1-mouseY>0) flag=true;
    else flag=false;
  }
  else if(mouseX>a2 && mouseX<a3){
    float len=a3-mouseX;
    float slope=tan((60*3.14)/180);
    b=len*slope;
    if (b1-mouseY<=b && b1-mouseY>0) flag=true;
    else flag=false;
  }
  return flag;
}
  

boolean overCircle(int a,int b,int dia)
{
  float disX = a - mouseX;
  float disY = b - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < dia/2 ) {
    return true;
  } else {
    return false;
  }
}

void send_data(int shape)
{
  mode=shape;
}








     
  
  
  
  


  