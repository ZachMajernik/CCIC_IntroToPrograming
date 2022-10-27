String[][] face = {
  {" ","*"," ","*"," "},
  {" "," ","*"," "," "},
  {"|","_","_","_","|"}
};

int runTime = 0;
int stopTime = 100;

void setup(){
  runAnim();
}

void openEye(){
  face[0][3] = "*";
}

void wink(){
  face[0][3] = "_";
}

void drawSmiley(){
  for(int i = 0; i < face.length; i++){
    for(int j = 0; j < face[i].length; j++){
       print(face[i][j]); 
    }
    println();
  }
}
void clearCon(){
  for(int i = 0; i < face.length; i++){
    println();
  }
}

void runAnim(){
  while(runTime < stopTime){
    drawSmiley();
    wink();
    delay(100);
    clearCon();
    drawSmiley();
    openEye();
    delay(100);
    clearCon();
    
    runTime++;
  }
}
