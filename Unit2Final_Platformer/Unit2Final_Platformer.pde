public int canvasSize = 500;

int levelSize = 500;

// splits the level into "tiles": 0 represents open space, 1 represents a ground tile
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

// initialises an array with a connection to the GroundTiles script
GroundTiles[] groundTiles;

// initializes a variable with a connection to the player script
Player p;

// char variables that make it easier to read if statements involving keys pressed
public char left = 'a';
public char right = 'd';
public char jump = 'w';
public char none = 'x';
char curDir = none;

boolean isMoving = false;

boolean hitGround = false;

int jumpFalseTimer = 0;
int hitGroundFalseTimer = 0;

public void settings() {
  size(canvasSize, canvasSize);
}

public void setup() {
  // noStroke();

  p = new Player( );

  calcGroundTileCount();
  createTiles();
}

// counts the number of ground tiles in the level matrix (each index that holds the value 1) and assigns the array groundTiles to that size
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

// for each ground tile in the level matrix, the function creates a tile by calling the GroundTiles script and adds it to the groundTiles array
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
    if (jumpFalseTimer == 2) {
      p.isJumping = false;
      jumpFalseTimer = 0;
    }
  }
  
  if (hitGround) {
    hitGroundFalseTimer++;
    if (hitGroundFalseTimer == 2) {
      hitGround = false;
      hitGroundFalseTimer = 0;
    }
  }
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

//checks to see if the player is touching the top of any ground tile
void collisionCheck_Ground() {
  for (int i = 0; i < groundTiles.length; i++) {
    if (isAboveTile(i)) {
      if (p.bottomY >= groundTiles[i].y - 6 && p.bottomY <= groundTiles[i].y + 1) {
        if(!hitGround){
          hitGround = true;
          p.speedY = 0;
          
          p.bottomY = groundTiles[i].y;
          p.topY = p.bottomY - p.h;
          p.y = p.topY;
        }
        p.isGrounded = true;
        return;
      } else {
        p.isGrounded = false;
      }
    } else {
      p.isGrounded = false;
    }
  }
}

//checks to see if the player is touching the side of any ground tile
void collisionCheck_Wall() {
  for (int i = 0; i < groundTiles.length; i++) {
    if (isNextToTile(i)) {
      if (p.x < groundTiles[i].x) {
        p.touchingRightOfWall = false;
        if (p.rightX > groundTiles[i].leftX - 10 && p.rightX < groundTiles[i].leftX + 10) {
          p.touchingLeftOfWall = true;
          return;
        } else {
          p.touchingLeftOfWall = false;
          return;
        }
      } else if (p.x > groundTiles[i].x) {
        p.touchingLeftOfWall = false;
        if (p.leftX < groundTiles[i].rightX + 10 &&  p.leftX > groundTiles[i].rightX - 10) {
          p.touchingRightOfWall = true;
          return;
        } else {
          p.touchingRightOfWall = false;
          return;
        }
      }
    } else {
      //println("is not next to tile");
      p.touchingLeftOfWall = false;
      p.touchingRightOfWall = false;
      return;
    }
  }
}

// checks to see if the player is above any of the ground tiles by checking the players x-pos against that of the tile
boolean isAboveTile(int i) {
  if (p.leftX >= groundTiles[i].leftX &&  p.leftX <= groundTiles[i].rightX) {
    return true;
  } else if (p.rightX >= groundTiles[i].leftX &&  p.rightX <= groundTiles[i].rightX) {
    return true;
  } else {
    return false;
  }
}

// checks to see if the player is on the same y level as any of the ground tiles by checking the players y-pos against that of the tile
boolean isNextToTile(int i) {
  if (p.topY > groundTiles[i].y && p.topY < groundTiles[i].y + groundTiles[i].h) {
    return true;
  } else if (p.bottomY > groundTiles[i].y && p.bottomY < groundTiles[i].y + groundTiles[i].h) {
    return true;
  } else {
    return false;
  }
}

//changes the players speedY value to a set negative value (jumpForce) when the 'w' key is clicked so that the player jumps
void jump() {
  p.speedY -= p.jumpForce;
}
