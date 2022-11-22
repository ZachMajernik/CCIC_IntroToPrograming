public int canvasSize = 500;

int levelSize = 500;
int[][] level = {
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 },
  { 0, 1, 0, 1, 0, 1, 1, 1, 0, 1 }
};
GroundTiles[] groundTiles;

Player p;

public char left = 'a';
public char right = 'd';
public char jump = 'w';
public char none = 'x';
char curDir = none;

boolean isMoving = false;

int jumpFalseTimer = 0;

public void settings() {
  size(canvasSize, canvasSize);
}

public void setup() {
  // noStroke();

  p = new Player( );

  calcGroundTileCount();
  createTiles();
}

void calcGroundTileCount() {
  int groundTileCount = 0;
  for (int i = 0; i < level.length; i++) {
    for (int j = 0; j < level[i].length; j++) {
      if (level[i][j] == 1) {
        groundTileCount++;
      }
    }
  }
  groundTiles = new GroundTiles[groundTileCount];
}

void createTiles() {
  int groundTileIndex = 0;
  for (int i = 0; i < level.length; i++) {
    for (int j = 0; j < level[i].length; j++) {
      switch (level[i][j]) {
      case 0:
        break;
      case 1:
        groundTiles[groundTileIndex] = (new GroundTiles(i, j, level[i].length, level.length, levelSize));
        groundTileIndex++;
        break;
      }
    }
  }
}

void draw() {
  background(50);

  for (int i = 0; i < groundTiles.length; i++) {
    groundTiles[i].display();
  }

  p.update(isMoving, curDir);
  p.display();

  collisionCheck_Ground();
  collisionCheck_Wall();

  if (p.isJumping) {
    jumpFalseTimer++;
    if (jumpFalseTimer == 20) {
      p.isJumping = false;
    }
  }

  //println(p.leftX+","+p.rightX+"-"+groundTiles[0].leftX+","+groundTiles[0].rightX);
}

public void keyPressed() {
  if (key == left) {
    isMoving = true;
    curDir = left;
  } else if (key == right) {
    isMoving = true;
    curDir = right;
  }

  if (p.isGrounded && key == jump) {
    if (!p.isJumping) {
      p.isJumping = true;
      jump();
    }
  }
}

public void keyReleased() {
  if (key == left) {
    isMoving = false;
    curDir = none;
  } else if (key == right) {
    isMoving = false;
    curDir = none;
  }
}

void collisionCheck_Ground() {
  for (int i = 0; i < groundTiles.length; i++) {
    if (isAboveTile(i)) {
      if (p.bottomY > groundTiles[i].y - 1 && p.bottomY < groundTiles[i].y + 6) {
        //println("touching ground");
        p.isGrounded = true;
        return;
      } else {
        //println("not touching ground");
        p.isGrounded = false;
      }
    } else {
      p.isGrounded = false;
    }
  }
}

void collisionCheck_Wall() {
  for (int i = 0; i < groundTiles.length; i++) {
    if (isNextToTile(i)) {
      if (p.x < groundTiles[i].x) {
        p.touchingRightOfWall = false;
        //println("on left of tile");
        if (p.rightX > groundTiles[i].leftX - 10 && p.rightX < groundTiles[i].leftX + 10) {
          //println("hit left");
          p.touchingLeftOfWall = true;
          return;
        } else {
          p.touchingLeftOfWall = false;
        }
      } else if (p.x > groundTiles[i].x) {
        p.touchingLeftOfWall = false;
        //println("on right of tile");
        if (p.leftX < groundTiles[i].rightX + 10 &&  p.leftX > groundTiles[i].rightX - 10) {
          //println("hit right");
          p.touchingRightOfWall = true;
          return;
        } else {
          p.touchingRightOfWall = false;
        }
      }
    } else {
      //println("is not next to tile");
      p.touchingLeftOfWall = false;
      p.touchingRightOfWall = false;
    }
  }
}

boolean isAboveTile(int i) {
  if (p.leftX > groundTiles[i].leftX &&  p.leftX < groundTiles[i].rightX) {
    return true;
  } else if (p.rightX > groundTiles[i].leftX &&  p.rightX < groundTiles[i].rightX) {
    return true;
  } else {
    return false;
  }
}

boolean isNextToTile(int i) {
  if (p.topY + 6 > groundTiles[i].y && p.topY + 6 < groundTiles[i].y + groundTiles[i].h) {
    return true;
  } else if (p.bottomY - 6 > groundTiles[i].y && p.bottomY - 6 < groundTiles[i].y + groundTiles[i].h) {
    return true;
  } else {
    return false;
  }
}

void jump() {
  //p.isJumping = true;
  p.speedY -= p.jumpForce;
  //isJumping = false;
  //stopJump();
}
