String[][] gameBoard = {
{" "," "," "},
{" "," "," "},
{" "," "," "}
};


boolean canPlay = true;

boolean gameStarted = false;

String player1, player2;

int playersMove = 1;  // 1 is player1, -1 is player2

int nextMove = 0; 
int movesMade = 0;

void setup(){
  size(400,400);
  
  textAlign(CENTER);
  textSize(150);
  drawBoard();
}

void keyTyped(){
  if(!gameStarted){
    if(key == 'o'){
      player1 = "O";
      player2 = "X";
    }else if(key == 'x'){
      player1 = "X";
      player2 = "O";
    }
    gameStarted = true;
  }
}

void draw(){
  if(movesMade > 7){
    //canPlay = false;
  }
  if(canPlay && gameStarted){
    checkForWin();
  }
}

void drawBoard(){
  rect(133,0,1,400);
  rect(266,0,1,400);
  
  rect(0,133,400,1);
  rect(0,266,400,1);
}

void mouseClicked(){
  println(mouseX + "," + mouseY);
  
  if(canPlay && gameStarted){
    playerTurn();
  }
}

void playerTurn(){
  if(mouseY < 133){
    if(mouseX < 133){
      nextMove = 1;
      printXO(nextMove, turn(playersMove));
    }else if(mouseX > 133 && mouseX < 266){
      nextMove = 2;
      printXO(nextMove, turn(playersMove));
    }else if(mouseX > 266){
      nextMove = 3;
      printXO(nextMove, turn(playersMove));
    }
  }else if(mouseY > 133 && mouseY < 266){
    if(mouseX < 133){
      nextMove = 4;
      printXO(nextMove, turn(playersMove));
    }else if(mouseX > 133 && mouseX < 266){
      nextMove = 5;
      printXO(nextMove, turn(playersMove));
    }else if(mouseX > 266){
      nextMove = 6;
      printXO(nextMove, turn(playersMove));
    }
  }else if(mouseY > 266){
    if(mouseX < 133){
      nextMove = 7;
      printXO(nextMove, turn(playersMove));
    }else if(mouseX > 133 && mouseX < 266){
      nextMove = 8;
      printXO(nextMove, turn(playersMove));
    }else if(mouseX > 266){
      nextMove = 9;
      printXO(nextMove, turn(playersMove));
    }
  }
}

String turn(int move){
  if(move == 1){
    return player1;
  }else{
    return player2;
  }
}


void printXO(int space, String letter){
  nextMove = 0;
  
  switch(space){
    case 1:{
      if(gameBoard[0][0] == " "){
        gameBoard[0][0] = letter;
        text(letter,66,110);
        movesMade++;
        playersMove *= -1;
      }
      break;
    }
    case 2:{
      if(gameBoard[0][1] == " "){
        gameBoard[0][1] = letter;
        text(letter,199,110); 
        movesMade++;
        playersMove *= -1;
      }
      break;
    }
    case 3:{
      if(gameBoard[0][2] == " "){
        gameBoard[0][2] = letter;
        text(letter,332,110); 
        movesMade++;
        playersMove *= -1;
      }
      break;
    }
    case 4:{
      if(gameBoard[1][0] == " "){
        gameBoard[1][0] = letter;
        text(letter,66,250); 
        movesMade++;
        playersMove *= -1;
      }
      break;
    }
    case 5:{
      if(gameBoard[1][1] == " "){
        gameBoard[1][1] = letter;
        text(letter,199,250); 
        movesMade++;
        playersMove *= -1;
      }
      break;
    }
    case 6:{
      if(gameBoard[1][2] == " "){
        gameBoard[1][2] = letter;
        text(letter,332,250); 
        movesMade++;
        playersMove *= -1;
      }
      break;
    }
    case 7:{
      if(gameBoard[2][0] == " "){
        gameBoard[2][0] = letter;
        text(letter,66,380); 
        movesMade++;
        playersMove *= -1;
      }
      break;
    }
    case 8:{
      if(gameBoard[2][1] == " "){
        gameBoard[2][1] = letter;
        text(letter,199,380); 
        movesMade++;
        playersMove *= -1;
      }
      break;
    }
    case 9:{
      if(gameBoard[2][2] == " "){
        gameBoard[2][2] = letter;
        text(letter,332,380); 
        movesMade++;
        playersMove *= -1;
      }
      break;
    }
  }
}

void checkForWin(){
  if(gameBoard[0][0] == gameBoard[0][1] && gameBoard[0][1] == gameBoard[0][2]){
    if(gameBoard[0][0] != " "){
      win(gameBoard[0][0]);
    }
  }else if(gameBoard[1][0] == gameBoard[1][1] && gameBoard[1][1] == gameBoard[1][2]){
    if(gameBoard[1][0] != " "){
      win(gameBoard[1][0]);
    }
  }else if(gameBoard[2][0] == gameBoard[2][1] && gameBoard[2][1] == gameBoard[1][2]){
    if(gameBoard[2][0] != " "){
      win(gameBoard[2][0]);
    }
  }else if(gameBoard[0][0] == gameBoard[1][0] && gameBoard[1][0] == gameBoard[2][0]){
    if(gameBoard[0][0] != " "){
      win(gameBoard[0][0]);
    }
  }
  else if(gameBoard[0][1] == gameBoard[1][1] && gameBoard[1][1] == gameBoard[2][1]){
    if(gameBoard[0][1] != " "){
      win(gameBoard[0][1]);
    }
  }else if(gameBoard[0][2] == gameBoard[1][2] && gameBoard[1][2] == gameBoard[2][2]){
    if(gameBoard[0][2] != " "){
      win(gameBoard[0][2]);
    }
  }else if(gameBoard[0][0] == gameBoard[1][1] && gameBoard[1][1] == gameBoard[2][2]){
    if(gameBoard[0][0] != " "){
      win(gameBoard[0][0]);
    }
  }else if(gameBoard[0][2] == gameBoard[1][1] && gameBoard[1][1] == gameBoard[2][0]){
    if(gameBoard[0][2] != " "){
      win(gameBoard[0][2]);
    }
  }
}

void win(String winner){
  canPlay = false;
  fill(0,0,0);
  rect(0,0,500,500);
  fill(0,255,0);
  textSize(100);
  text(winner + " wins!", 200,200);
}
