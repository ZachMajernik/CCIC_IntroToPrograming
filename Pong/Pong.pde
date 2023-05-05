int canvasX = 1200;
int canvasY = 800;

Player player1, player2;
int playerW, playerH; // width and hight
int playerSpeed;
int distFromSide;

Ball ball;

void settings(){
  size(canvasX, canvasY);
}

void setup(){
  playerW = 20;
  playerH = 150;
  playerSpeed = 20;
  distFromSide = 100;
  
  var startY = (canvasY/2) - (playerH/2);
  var startX1 = distFromSide;
  var startX2 = canvasX - (distFromSide + playerW);
  
  player1 = new Player(playerW, playerH, startX1, startY, playerSpeed, startY, startY + playerH, startX1 + playerW);
  player2 = new Player(playerW, playerH, startX2, startY, playerSpeed, startY, startY + playerH, startX2);
  
  ball = new Ball(width/2, height/2, 10, 5, int(random(-7,7)));
}

void draw(){
  background(0);
  strokeWeight(2);
  stroke(100);
  line(width/2 - 1, 0, width/2 -1, height);
  
  player1.checkBounds();
  player2.checkBounds();
  
  player1.move();
  player2.move();
  
  player1.display();
  player2.display();
  
  ball.checkBounds();
  ball.move();
  ball.display();
}

void keyPressed(){
  if(keyCode == 87){
    player1.dir = "up";
  }else if(keyCode == 83){
    player1.dir = "down";
  }
  
  if(keyCode == 38){
    player2.dir = "up";
  }else if(keyCode == 40){
    player2.dir = "down";
  }
}

void keyReleased(){
  if(keyCode == 87){
    player1.dir = "null";
  }else if(keyCode == 83){
    player1.dir = "null";
  }
  
  if(keyCode == 38){
    player2.dir = "null";
  }else if(keyCode == 40){
    player2.dir = "null";
  }
}
