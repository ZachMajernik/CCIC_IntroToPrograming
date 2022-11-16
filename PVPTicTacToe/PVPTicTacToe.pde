int boardSize = 5;

String[][] gameBoard = new String[boardSize][boardSize];

boolean canPlay = true;

boolean gameStarted = false;

boolean playerWon = false;

String player1, player2;

int playersMove = 1;  // 1 is player1, -1 is player2

int movesMade = 0;
int maxMoves = boardSize*boardSize;

int xoSize;

int winReq;

int player1Wins = 0;
int player2Wins = 0;


void setup(){
  size(500,550);
  
  if(boardSize == 3){
    winReq = 3;
  }else if(boardSize == 4){
    winReq = 4;
  }else if(boardSize > 4){
    winReq = 5;
  }
  
  noStroke();
  
  clearBoard();
  
  xoSize = int(((500/boardSize) / 16) * 12);
  
  textSize(50);
  
  fill(255,255,255);
  rect(0,0,500,600);
  
  textAlign(CENTER,CENTER);
  
  textSize(30);
  fill(0,0,0);
  text("player1 wins:",120,520);
  text(str(player1Wins),215,520);
  text("player2 wins:",360,520);
  text(str(player2Wins),455,520);
  
  pickPiece();
}

void pickPiece(){
  fill(0,0,0);
  rect(0,0,500,500);
  
  fill(255,255,255);
  textSize(40);
  text("Player 1, pick your Piece",250,200);
  textSize(20);
  text("(type \"x\" or \"o\" on keyboard)",250,300);
}

void drawBoard(){
  fill(255,255,255);
  rect(0,0,500,500);
  fill(0,0,0);
  
  textSize(xoSize);
  
  int space = 500 / boardSize;
  
  for(int i = space; i < 500; i += space){
    rect(i,0,3,500);
  }
  for(int i = space; i < 500; i += space){
    rect(0,i,500,3);
  }
}

void keyTyped(){
  if(!gameStarted){
    if(key == 'o'){
      println("player1 picked O");
      player1 = "O";
      player2 = "X";
      gameStarted = true;
      drawBoard();
    }else if(key == 'x'){
      println("player1 picked X");
      player1 = "X";
      player2 = "O";
      gameStarted = true;
      drawBoard();
    }
  }
  
  if(!canPlay){
    if(key == 'r'){
      reset();
    }
  }
}

void draw(){
  if(movesMade == maxMoves){
    canPlay = false;
    if(!playerWon){
      checkForWin();
    }
  }
  
  if(canPlay && gameStarted){
    checkForWin();
  }
}

void mouseClicked(){
  println("mouse x,y: " + mouseX + "," + mouseY);
  
  findSqrClicked(mouseX,mouseY);
}

void findSqrClicked(int x, int y){
  
  int col = 1;
  int row = 1;
  
  for(int i = 500/boardSize; i < x; i += 500/boardSize){
    col++;
  }
  for(int i = 500/boardSize; i < y; i += 500/boardSize){
    row++;
  }
  
  println("col,row: " + col + "," + row);
  
  printXO(col,row,turn(playersMove));
}

String turn(int move){
  if(move == 1){
    return player1;
  }else{
    return player2;
  }
}

void printXO(int col, int row, String letter){
  int printX = ((500/boardSize)*col) - ((500/boardSize)/2);
  int printY = ((500/boardSize)*row) - ((500/boardSize)/2);
  
  if(canPlay && letter != null && gameBoard[row-1][col-1] == " "){
    gameBoard[row-1][col-1] = letter;
    text(letter,printX,printY);
    movesMade++;
    println("moves made: " + movesMade);
    println();
    playersMove *= -1;
   }
}

void checkForWin(){
  for(int i = 0; i < boardSize; i++){
      for(int j = 0; j < boardSize-stopCheck(); j++){
        if(gameBoard[i][j] != " "){
          if(checkSpace(i,j,"horiz")){
            win(gameBoard[i][j]);
            canPlay = false;
            playerWon = true;
            return;
          }
        }
      }
    }
    
    for(int j = 0; j < boardSize; j++){
      for(int i = 0; i < boardSize-stopCheck(); i++){
        if(gameBoard[i][j] != " "){
          if(checkSpace(i,j,"vert")){
            win(gameBoard[i][j]);
            canPlay = false;
            playerWon = true;
            return;
          }
        }
      }
    }
    
    for(int i = 0; i < boardSize-2; i++){
      for(int j = 0; j < boardSize-stopCheck(); j++){
        if(gameBoard[i][j] != " "){
          if(checkSpace(i,j,"diagDown")){
            win(gameBoard[i][j]);
            canPlay = false;
            playerWon = true;
            return;
          }
        }
      }
    }
    
    for(int i = 2; i < boardSize; i++){
      for(int j = 0; j < boardSize-stopCheck(); j++){
        if(gameBoard[i][j] != " "){
          if(checkSpace(i,j,"diagUp")){
            win(gameBoard[i][j]);
            canPlay = false;
            playerWon = true;
            return;
          }
        }
      }
    }
  
  if(!canPlay && !playerWon){
    tie();
  }
}

int stopCheck(){
  if(boardSize == 3){
    return 2;
  }else if(boardSize == 4){
    return 3;
  }else{
    return 4;
  }
}


boolean checkSpace(int row, int col, String checkType){
  switch(checkType){ 
    case "horiz":
        for(int i = 1; i < winReq; i++){
          if(!(gameBoard[row][col] == gameBoard[row][col+i])){
            return false;
          }
        }
        return true;
    case "vert":
        for(int i = 1; i < winReq; i++){
          if(!(gameBoard[row][col] == gameBoard[row+i][col])){
            return false;
          }
        }
        return true;
    case "diagDown":
        for(int i = 1; i < winReq; i++){
          if(!(gameBoard[row][col] == gameBoard[row+i][col+i])){
            return false;
          }
        }
        return true;
    case "diagUp":
        for(int i = 1; i < winReq; i++){
          if(!(gameBoard[row][col] == gameBoard[row-i][col+i])){
            return false;
          }
        }
        return true;
  }
  return false;
}

void win(String winner){
  canPlay = false;
  delay(200);
  fill(0,0,0);
  rect(0,0,500,500);
  fill(0,255,0);
  textSize(100);
  text(winner + " wins!", 250,250);
  
  updateScore(winner);
}

void tie(){
  canPlay = false;
  delay(200);
  fill(0,0,0);
  rect(0,0,500,500);
  fill(255,0,0);
  textSize(100);
  text("Tie!", 250,250);
  
  textSize(50);
  text("Type \"R\" to restart", 250,350);
}

void updateScore(String winner){
  if(winner == player1){
    player1Wins++;
    fill(255,255,255);
    rect(205,510,30,30);
    textSize(30);
    fill(0,0,0);
    text(str(player1Wins),215,520);
  }else{
    player2Wins++;
    fill(255,255,255);
    rect(445,510,30,30);
    textSize(30);
    fill(0,0,0);
    text(str(player2Wins),455,520);
  }
  
  fill(255,255,255);
  textSize(50);
  text("Type \"R\" to restart", 250,350);
}

void reset(){
  canPlay = true;
  gameStarted = false;
  playerWon = false;
  clearBoard();
  
  movesMade = 0;
  playersMove = 1;
  player1 = "";
  player2 = "";
  
  pickPiece();
}

void clearBoard(){
  for(int i = 0; i < boardSize; i++){
    for(int j = 0; j < boardSize; j++){
      gameBoard[i][j] = " ";
    }
  }
}
