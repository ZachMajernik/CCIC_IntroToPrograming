class Player{  
  int x,y,w,h;
  
  int leftX,rightX,topY,bottomY;
  
  boolean isGrounded;
  boolean touchingLeftOfWall,touchingRightOfWall;

  int gravity; //acceleration of gravity
  int speedX,maxSpeedX;
  int speedY,maxSpeedY;
  
  int jumpForce;
  boolean isJumping;

  Player(){
    w = 40;
    h = 40;
    x = (canvasSize / 2)-90;
    y = (canvasSize / 4);
    
    //rightX = x+w - 25;
    //leftX = x - 20;
    
    rightX = x+w;
    leftX = x;
    
    topY = y;
    bottomY = y+h;

    maxSpeedX = 5;
    speedX = 0;
    
    maxSpeedY = 15;
    speedY = 0;
    
    jumpForce = 15;
    isJumping = false;
    
    gravity = 1;
    isGrounded = false;
    touchingLeftOfWall = false;
    touchingRightOfWall = false;
  }

  void update(boolean moving, char dir) {
    if(moving) {
      speedX = maxSpeedX;
      
      if(dir == left){ 
        x -= speedX;
        rightX -= speedX;
        leftX -= speedX;
      }else if(dir == right){ 
       x += speedX;
       rightX += speedX;
       leftX += speedX;
      }
    }else{
      speedX = 0;
    }
    
    //println(speedY+","+isJumping);
    
    if(!isGrounded){
      if(speedY < maxSpeedY){
        speedY += gravity;
      }
    }else{
      if(!isJumping){
        speedY = 0;
      }
    }
    
    y += speedY;
    bottomY += speedY;
    
    //println(touchingLeftOfWall+","+touchingRightOfWall);
    //println(x+","+y+"-"+leftX+","+rightX+"-"+bottomY);
  }

  void display() {
    fill(255,255,255);
    rect(x, y, w, h);
    
    fill(255,0,0);
    ellipse(x,y,5,5);
    ellipse(x+w,y,5,5);
    
    fill(0,0,255);
    ellipse(leftX,y+(h/2),5,5);
    ellipse(rightX,y+(h/2),5,5);
  }
}
