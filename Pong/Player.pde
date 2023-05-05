class Player{
  
  int w, h; // width and height
  int x, y;
  int speed;
  
  int planeTop, planeBottom, planeX;
  
  boolean atTop, atBottom;
  int buffer;
  
  String dir; // up, down, or null
  
  Player(int wid, int hei, int startX, int startY, int s, int pT, int pB, int pX){
    x = startX;
    y = startY;
    w = wid;
    h = hei;
    speed = s;
    
    dir = null;
    atTop = false;
    atBottom = false;
    buffer = 10;
    
    planeTop = pT;
    planeBottom = pB;
    planeX = pX;
  }
  
  void checkBounds(){
    if(y < buffer){
      atTop = true;
    }else{
      atTop = false;
    }
    
    if(y > height - (h + buffer)){
      atBottom = true;
    }else{
      atBottom = false;
    }
  }
  
  void move(){
    if(dir != "null"){
      if(!atTop && dir == "up"){
        y -= speed;
        planeTop -= speed;
        planeBottom -= speed;
      }else if(!atBottom && dir == "down"){
        y += speed;
        planeTop += speed;
        planeBottom += speed;
      }
    }
  }
  
  void display(){
    fill(255);
    noStroke();
    
    rect(x,y,w,h);
    
    stroke(0,150,255);
    strokeWeight(2);
    line(planeX ,planeTop, planeX, planeBottom);
  }
}
