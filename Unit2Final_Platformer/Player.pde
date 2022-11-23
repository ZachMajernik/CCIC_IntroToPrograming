class Player{  
  // variables for the players x-pos, y-pos, width, and height
  int x,y,w,h;
  
  int leftX,rightX,topY,bottomY;
  
  boolean isGrounded;
  boolean touchingLeftOfWall,touchingRightOfWall;

  int gravity; //acceleration of gravity
  int speedX,maxSpeedX;
  int speedY,maxSpeedY;
  
  int jumpForce;
  boolean isJumping;

  // gets called at the beggining of the game and creates the player and assigns all of the variables below
  Player(){
    w = 40;
    h = 40;
    x = (canvasSize / 2)+10;
    y = (canvasSize / 4);
    
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

  //is called in the draw function of the main script, updates the x and y positions of the player based of of other variables so that the player can move
  void update(boolean moving, char dir) {
    if(moving) {
      speedX = maxSpeedX;
      
      if(dir == left){
        if(!touchingRightOfWall){
          x -= speedX;
          rightX -= speedX;
          leftX -= speedX;
        }
      }else if(dir == right){ 
        if(!touchingLeftOfWall){
          x += speedX;
          rightX += speedX;
          leftX += speedX;
        }
      }
    }else{
      speedX = 0;
    }
    
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
    
    println(touchingLeftOfWall+","+touchingRightOfWall);
  }

  // draws the player on the screen every frame bassed on the updated x and y positions and with the width and height variables
  void display() {
    fill(255,255,255);
    rect(x, y, w, h);
  }
}
