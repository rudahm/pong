int x_ball, y_ball, w_ball, h_ball, x_speed, y_speed; 

void setup() { 
  size(600, 500); 
  x_ball = width/2; //width/2 and height/2 to place ball in centre of screen
  y_ball = height/2; 
  w_ball = 50; //width
  h_ball = 50; //heigth
  x_speed = 5; //how fast the ball is going on the x-axes
  y_speed = 5; //how fast the ball is going on y-axes
} 

void draw(){
  background(0); 
  
  drawBall(); 
  
  moveBall();
  
  changeDirection(); 
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
