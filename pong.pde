int x_ball, y_ball, w_ball, h_ball, x_speed, y_speed; 
int x_paddle, y_paddle, w_paddle, h_paddle, paddle_speed; 
boolean left, right; 
void setup() { 
  size(1200, 800); 
  x_ball = width/2; //width/2 and height/2 to place ball in centre of screen
  y_ball = height/2; 
  w_ball = 50; //width
  h_ball = 50; //heigth
  x_speed = 4; //how fast the ball is going on the x-axes
  y_speed = 4; //how fast the ball is going on y-axes
  
  rectMode(CENTER); 
  x_paddle = width/2; 
  y_paddle = 750; 
  w_paddle = 200;
  h_paddle = 30; 
  paddle_speed = 15; 
} 

void draw(){
  background(0); 
  
  drawBall(); 
  
  moveBall();
  
  changeDirection(); 


  drawPaddle(); 
  movePaddle(); 
  //restrictPaddle(); 
  contactPaddle(); 
} 

void drawBall() { 
  fill (255, 0, 0); 
  ellipse(x_ball, y_ball, w_ball, h_ball); 
} 

//function that actually 'moves the ball' by looping through function draw reeeeally fast :) 
void moveBall() { 
  y_ball = y_ball + y_speed; 
  x_ball = x_ball + x_speed; 
} 

void changeDirection() { 
  if( y_ball > height - h_ball/2) { //make ball bounce
    y_speed = -y_speed; 
  } 
  
  else if ( y_ball < 0 + h_ball/2) { //make ball bounce continuously 
    y_speed = -y_speed; 
  } 
  
  if (x_ball > width - w_ball/2) { //
    x_speed = -x_speed; 
  } 
  
  else if (x_ball < 0 + w_ball/2) { //x_cirlce < 0 + w_ball/2
    x_speed = -x_speed; 
  }
} 
  
void drawPaddle() { 
  fill (255); 
  rect(x_paddle, y_paddle, w_paddle, h_paddle); 
  } 
  
void movePaddle() { 
   if (left){ 
     x_paddle = x_paddle - paddle_speed; 
   }
   if (right){ 
     x_paddle = x_paddle + paddle_speed; 
   } 
} 

void keyPressed() { 
  if(keyCode == LEFT){ 
    left = true; 
  } 
  if (keyCode == RIGHT){ 
    right = true; 
  } 
} 

void keyReleased() { 
    if(keyCode == LEFT){ 
    left = false; 
  } 
  if (keyCode == RIGHT){ 
    right = false; 
  } 
}

void restrictPaddle(){ 

} 

void contactPaddle(){ 
  if (y_ball + h_ball/2 > y_paddle - h_paddle/2) 
   y_speed = - y_speed;  
  } 
 
