class GroundTiles{
  // variables for each tiles x-pos, y-pos, width, and height
  int x,y,w,h;
  
  int leftX,rightX;
  
  // gets called every time a ground tile is created from the level matrix and gets added to the groundTiles array
  // each tile in the array has its own set of the variables assigned below
  GroundTiles(int i, int j, int rowSize, int colSize, int levelSize){
    w = levelSize / rowSize;
    h = levelSize / colSize;
    x = w * j;
    y = h * i;
    
    leftX = x;
    rightX = x+w;
    
    //println(x+","+y+","+w+","+h);
  }
  
  // draws each ground tile every frame based on the x and y positions and the width and hights of each tile in the groundTiles array
  void display(){
    fill(0,255,0);
    rect(x,y,w,h);
  }
}
