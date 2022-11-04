/*
void setup(){
  fill(0,255,0);
  rect(2,2,30,40);
  
  noStroke();
  fill(255,0,255);
  ellipse(60,60,20,40);
}
*/

/*
int[] rGB = {0,0,0}; 

void setup(){
  noStroke();
  fill(0,0,0);
  rect(0,0,100,100);
}

void draw(){
  //rGB[0] += 1;
  rGB[1] += 2;
  rGB[2] += 1;
  
  fill(rGB[0],rGB[1],rGB[2]);
  rect(0,0,100,100);
}
*/

/*
int sqrSize = 100;
int[] sqrPos = {200,200};
int speed = 2;
int[] size = {500,500};

boolean changingDirection = false;

void setup(){
  size(500,500);
  fill(0,0,0);
  rect(0,0,500,500);
  fill(255,255,255);
  
  drawSqr();
}

void draw(){
  checkPos();
  if(!changingDirection){
    updatePos();
  }
}

void drawSqr(){
  rect(sqrPos[0],sqrPos[1],sqrSize,sqrSize);
}

void updatePos(){
  fill(0,0,0);
  rect(0,0,500,500);
  fill(255,255,255);
  sqrPos[0] += speed;
  drawSqr();
}

void checkPos(){
  if(sqrPos[0] == (size[0] - sqrSize) || sqrPos[0] == 0){
    ChangeDirection();
  }
}

void ChangeDirection(){
  changingDirection = true;
  fill(255,0,0);
  drawSqr();
  delay(100);
  speed *= -1;
  changingDirection = false;
}
*/

/*
int rValue = 255;
int gValue = 0;
int bValue = 0;

void setup(){
  noStroke();
  drawSqr();
}

void draw(){
  changeColor();
  drawSqr();
}

void changeColor(){
  rValue -= 0;
  gValue += 1;
  bValue += 1;
}

void drawSqr(){
  fill(rValue,gValue,bValue);
  rect(0,0,100,100);
}
*/

int sqrSize = 100;
int[] sqrPos = {200,200};
int[] Col = {255,0,0};
int speed = 2;
int[] size = {500,500};

boolean changingDirection = false;

void setup(){
  size(500,500);
  fill(0,0,0);
  rect(0,0,500,500);
  fill(Col[0],Col[1],Col[2]);
  
  drawSqr();
}

void draw(){
  checkPos();
  if(!changingDirection){
    changeColor();
    updatePos();
  }
}

void drawSqr(){
  rect(sqrPos[0],sqrPos[1],sqrSize,sqrSize);
}

void updatePos(){
  fill(0,0,0);
  rect(0,0,500,500);
  fill(Col[0],Col[1],Col[2]);
  sqrPos[0] += speed;
  drawSqr();
}

void changeColor(){
  Col[1] += 1.6;
  Col[2] += 1.6;
}

void checkPos(){
  if(sqrPos[0] == (size[0] - sqrSize) || sqrPos[0] == 0){
    ChangeDirection();
  }
}

void ChangeDirection(){
  changingDirection = true;
  Col[1] = 0;
  Col[2] = 0;
  speed *= -1;
  changingDirection = false;
}
