class GroundTiles{
  int x,y,w,h;
  
  int leftX,rightX;
  
  GroundTiles(int i, int j, int rowSize, int colSize, int levelSize){
    w = levelSize / rowSize;
    h = levelSize / colSize;
    x = w * j;
    y = h * i;
    
    leftX = x;
    rightX = x+w;
    
    //println(x+","+y+","+w+","+h);
  }
  
  void display(){
    fill(0,255,0);
    rect(x,y,w,h);
  }
}
