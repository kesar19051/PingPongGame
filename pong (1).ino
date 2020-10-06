int potPin = 2;
int pirPin1 = 2;                 
 
int pirStat1 = 0;                

int x1;
float x2;
String val,preading="";
void setup() {
     
 pinMode(pirPin1, INPUT);  
 pinMode(potPin, INPUT);
 Serial.begin(9600);
}
void loop(){
 pirStat1 = digitalRead(pirPin1);  
 
 x1 = (analogRead(potPin)) ;
 x1 = x1+2;
 preading="p"+x1;
 Serial.write(x1);
 Serial.write(pirStat1);
 
 delay(50);  
  
}
 
  
  

 


  
 
 
 
