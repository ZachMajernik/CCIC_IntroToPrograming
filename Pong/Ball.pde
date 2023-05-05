class Ball{
  
  int x, y, r;
  int xVel, yVel;
  
   Ball(int xPos, int yPos, int radius, int xSpeed, int ySpeed){
    x = xPos;
    y = yPos;
    r = radius;
    xVel = xSpeed;
    yVel = ySpeed;
  }
  
  void checkBounds(){
    if(y <= r || y >= height - r){
      yVel *= -1;
    }
  }
  
  void move(){
    x += xVel;
    y += yVel;
  }
  
  void display(){
    fill(255);
    
    ellipse(x,y,r*2,r*2);
  }
}
