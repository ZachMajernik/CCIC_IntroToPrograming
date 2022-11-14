int boardSize = 8;

String[][] gameBoard = new String[boardSize][boardSize];

boolean canPlay = true;

boolean gameStarted = false;

boolean playerWon = false;

String player1, player2;

int playersMove = 1;  // 1 is player1, -1 is player2

int movesMade = 0;
int maxMoves = boardSize*boardSize;

int xoSize;

int player1Wins = 0;
int player2Wins = 0;


void setup(){
  size(500,550);
  
  for(int i = 0; i < boardSize; i++){
    for(int j = 0; j < boardSize; j++){
      gameBoard[i][j] = " ";
    }
  }
  
  xoSize = int(((500/boardSize) / 16) * 12);
  
  textSize(50);
  
  fill(255,255,255);
  rect(0,0,500,600);
  
  textSize(30);
  fill(0,0,0);
  text("player1 wins:",40,535);
  text(str(player1Wins),215,535);
  text("player2 wins:",280,535);
  text(str(player2Wins),455,535);
  
  textAlign(CENTER,CENTER);
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
    rect(i,0,1,500);
  }
  for(int i = space; i < 500; i += space){
    rect(0,i,500,1);
  }
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
    drawBoard();
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
  if(boardSize<4){
    for(int i = 0; i < boardSize; i++){
      for(int j = 0; j < boardSize-2; j++){
        if(gameBoard[i][j] != " "){
          if(gameBoard[i][j] == gameBoard[i][j+1] && gameBoard[i][j] == gameBoard[i][j+2]){
            win(gameBoard[i][j]);
            canPlay = false;
            playerWon = true;
            return;
          }
        }
      }
    }
    
    for(int j = 0; j < boardSize; j++){
      for(int i = 0; i < boardSize-2; i++){
        if(gameBoard[i][j] != " "){
          if(gameBoard[i][j] == gameBoard[i+1][j] && gameBoard[i][j] == gameBoard[i+2][j]){
            win(gameBoard[i][j]);
            canPlay = false;
            playerWon = true;
            return;
          }
        }
      }
    }
    
    for(int i = 0; i < boardSize-2; i++){
      for(int j = 0; j < boardSize-2; j++){
        if(gameBoard[i][j] != " "){
          if(gameBoard[i][j] == gameBoard[i+1][j+1] && gameBoard[i][j] == gameBoard[i+2][j+2]){
            win(gameBoard[i][j]);
            canPlay = false;
            playerWon = true;
            return;
          }
        }
      }
    }
    
    for(int i = 2; i < boardSize; i++){
      for(int j = 0; j < boardSize-2; j++){
        if(gameBoard[i][j] != " "){
          if(gameBoard[i][j] == gameBoard[i-1][j+1] && gameBoard[i][j] == gameBoard[i-2][j+2]){
            win(gameBoard[i][j]);
            canPlay = false;
            playerWon = true;
            return;
          }
        }
      }
    }
  }else{
    for(int i = 0; i < boardSize; i++){
      for(int j = 0; j < boardSize-2; j++){
        if(gameBoard[i][j] != " "){
          if(gameBoard[i][j] == gameBoard[i][j+1] && gameBoard[i][j] == gameBoard[i][j+2] && gameBoard[i][j] == gameBoard[i][j+3]){
            win(gameBoard[i][j]);
            canPlay = false;
            playerWon = true;
            return;
          }
        }
      }
    }
    
    for(int j = 0; j < boardSize; j++){
      for(int i = 0; i < boardSize-2; i++){
        if(gameBoard[i][j] != " "){
          if(gameBoard[i][j] == gameBoard[i+1][j] && gameBoard[i][j] == gameBoard[i+2][j] && gameBoard[i][j] == gameBoard[i+3][j]){
            win(gameBoard[i][j]);
            canPlay = false;
            playerWon = true;
            return;
          }
        }
      }
    }
    
    for(int i = 0; i < boardSize-2; i++){
      for(int j = 0; j < boardSize-2; j++){
        if(gameBoard[i][j] != " "){
          if(gameBoard[i][j] == gameBoard[i+1][j+1] && gameBoard[i][j] == gameBoard[i+2][j+2] && gameBoard[i][j] == gameBoard[i+3][j+3]){
            win(gameBoard[i][j]);
            canPlay = false;
            playerWon = true;
            return;
          }
        }
      }
    }
    
    for(int i = 2; i < boardSize; i++){
      for(int j = 0; j < boardSize-2; j++){
        if(gameBoard[i][j] != " "){
          if(gameBoard[i][j] == gameBoard[i-1][j+1] && gameBoard[i][j] == gameBoard[i-2][j+2] && gameBoard[i][j] == gameBoard[i-3][j+3]){
            win(gameBoard[i][j]);
            canPlay = false;
            playerWon = true;
            return;
          }
        }
      }
    }
  }
  
  if(!canPlay && !playerWon){
    tie();
  }
}

void win(String winner){
  canPlay = false;
  delay(200);
  fill(0,0,0);
  rect(0,0,500,500);
  fill(0,255,0);
  textSize(100);
  text(winner + " wins!", 250,250);
}

void tie(){
  canPlay = false;
  delay(200);
  fill(0,0,0);
  rect(0,0,500,500);
  fill(255,0,0);
  textSize(100);
  text("Tie!", 250,250);
}
