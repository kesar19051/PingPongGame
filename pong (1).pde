import processing.serial.*;

Serial myPort;
int val;
int stage;

Puck puck;

Paddle left;
Paddle right;

int leftscore = 0;
int rightscore = 0;
void setup (){
  stage = 1;
  size(800,500);
  puck=new Puck();
  left=new Paddle(true);
  right=new Paddle(false);
  myPort = new Serial(this,"COM4",9600);
  int lf = 1;
  myPort.bufferUntil(lf);
}  

void draw (){
  if(stage ==1){
    
  background(0);
  textSize(50);
  text("Ping Pong",300,250);
  textSize(30);
  text("Press S for single player",300,400);
  text("Press M for two player",300,450);
  left.show();
  right.show();
  ellipse(340,180,24,24);
  if (key == 's'){
    right.h = 500;
    stage +=1;
  }
  if (key == 'm'){
    stage +=1;
  }
  }
  if(stage ==2){
    background(0);
  //puck.checkPaddle(left);
  puck.checkPaddleRight(right);
  puck.checkPaddleLeft(left);
  
  left.show();
  right.show();
  left.update();
  right.update();
  
  puck.update();
  puck.edges();
  puck.show();

  fill(255);
  textSize(30);
  text(leftscore,32,40);
  text(rightscore, width-64, 40);
  
  if (myPort.available()>0){
    val = (myPort.read());
    
   }
   
  if(val>1){
    
  left.p(val);
  }
  
   
   if (val ==1){
     right.move(-10);
   }
   else if (val ==0){
     right.move(10);
   }
  }
}

   



   
  
  


    
