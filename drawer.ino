/* 
 Controlling a servo position using a potentiometer (variable resistor) 
 by Michal Rinott <http://people.interaction-ivrea.it/m.rinott> 

 modified on 8 Nov 2013
 by Scott Fitzgerald
 http://www.arduino.cc/en/Tutorial/Knob
*/

#include <Servo.h>

Servo myservo;  // create servo object to control a servo
Servo servos;
Servo servo3;
int potpin = 0, potpin2=1; // analog pin used to connect the potentiometer
int val1, val2; // variable to read the value from the analog pin
String pos="";
int sPos=0;
void setup()
{
 Serial.begin(9600);
  myservo.attach(9);
  servos.attach(10);// attaches the servo on pin 9 to the servo object
   servo3.attach(11);
}

void loop() 
{ while(Serial.available()>0){
    int inChar = Serial.read(); 
    if (isDigit(inChar)) {
      pos += (char)inChar;
      Serial.print("111");
    } 
if (inChar == '\n') {
     
     sPos=pos.toInt();;
      pos = "";
    }
  }
  int j=(sPos%10);
  if ((j==1)&&(j>=0)&&(j<=180)){
    sPos=map(sPos, 0, 180, 0, 156);
   myservo.write(sPos/10); 
   
   delay(15);
   sPos=0;       
  }
 else if((j==2)&&(j>=0)&&(j<=180)) {
  
  sPos = map(sPos, 0, 180, 0, 156);
  servos.write(180-(sPos/10)); 
  delay(15);
    sPos=0;    
 }
else if ((j==3)&&(j>=0)&&(j<=180)){
  if (sPos==13){
     servo3.write(45);
      
  }
  else servo3.write(0);
}
  
}

  

