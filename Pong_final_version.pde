int x_ball, y_ball, w_ball, h_ball, x_speed, y_speed; 
int x_paddle, y_paddle, w_paddle, h_paddle, paddle_speed; 
int score; 
boolean left, right, game_over; 

color color_paddle = 255;
color color_ball = 255; 

void setup() { 
  size(1200, 800); 
  x_ball = width/2; //width/2 and height/2 to place ball in centre of screen
  y_ball = height/2; 
  w_ball = 50; //width
  h_ball = 50; //heigth
  x_speed = 4; //how fast the ball is going on the x-axes
  y_speed = 4; //how fast the ball is going on y-axes
  
  textSize(30); 
  textAlign(CENTER); 
  score = 0; 
  
  rectMode(CENTER); 
  x_paddle = width/2; 
  y_paddle = 750; 
  w_paddle = 200;
  h_paddle = 30; 
  paddle_speed = 10; 
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
  
  score(); 
  gameOver(); 
} 

void drawBall() { 
  fill (color_ball); 
  ellipse(x_ball, y_ball, w_ball, h_ball); 
} 

//function that actually 'moves the ball' by looping through function draw reeeeally fast :) 
void moveBall() { 
  y_ball = y_ball + y_speed; 
  x_ball = x_ball + x_speed; 
} 

void changeDirection() { 
  if( y_ball > height - h_ball/2) { //make ball bounce
    //if (x_speed < 0){ 
    y_speed = -y_speed; 
    game_over = true; 
  } 
  
  else if ( y_ball < 0 + h_ball/2) { //make ball bounce 
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
  fill (color_paddle); 
  rect(x_paddle, y_paddle, w_paddle, h_paddle); 
  } 
  
void movePaddle() { 
   if (left && x_paddle - w_paddle/2 > 0){ 
       x_paddle = x_paddle - paddle_speed; 
   } 
   if (right && x_paddle + w_paddle/2 < width){   
     x_paddle = x_paddle + paddle_speed; 
   } 
} 

void score() { 
  fill(255); 
  text(score, 100, 100); 
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
  if ( (y_ball + h_ball/2 > y_paddle - h_paddle/2)  && (x_ball + w_ball/2 >= x_paddle - w_paddle/2 && x_ball - w_ball/2 <= x_paddle + w_paddle/2)){ 
   y_speed = - y_speed; 
   if (!game_over){ 
   score = score + 1;
   } 
  }  
} 
  
void gameOver(){ 
  if (game_over){ 
    x_speed = 0; 
    y_speed = 0; 
    
    text("GAME OVER", width/2, height/3 + 40); 
    text("SCORE: "+ score, width/2, height/3 + 100); 
    //text("Click to play again", width/2, height/3 + 100); 
    
    if (mousePressed){ 
      game_over = false; 
      score = 0; 
      x_speed = 4; 
      y_speed = 4; 
      x_ball = width/2; //width/2 and height/2 to place ball in centre of screen
      y_ball = height/2; 
    } 
  } 
}
