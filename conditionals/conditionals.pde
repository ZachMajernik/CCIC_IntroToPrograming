/*
int num = 171;

if(num % 3 == 0 && num % 5 == 0){
  println("It is a multiple of 3 and 5!");
}
else if(num % 3 == 0){
  println("It is a multiple of 3!");
}
else if(num % 5 == 0){
  println("It is a multiple of 5!");
}

int i;

for(i = 2; i < 101; i++){
  if(num % i == 0){
    println("The number is a multiple of " + i);
  }
}

String word1 = "hat", word2 = "hat";

if(word1 == word2){
  println("They are the same!");
}else{
  println("Uh oh! Check capitalization and spelling please");
}
*/

/*
float x1, x2;
int a, b, c;
int[] coef = new int[3]; //coefficients

coef[0] = 1;
coef[1] = 2;
coef[2] = 1;

a = coef[0]; // ax^2 + bx + c
b = coef[1];
c = coef[2];

if((sq(b) - 4*a*c) >= 0){
  x1 = (((b*-1) + sqrt(sq(b) - 4*a*c))/(2*a)); // quadratic equation
  x2 = (((b*-1) - sqrt(sq(b) - 4*a*c))/(2*a));
  
  if(x2 != x1){
    println("The Answers are " + x1 + " and " + x2);
  }else if(x2 == x1){
    println("The Answer is " + x1);
  }
}else{
  println("ERROR : CANNOT TAKE ROOT OF A NEGATIVE NUMBER, NO SOLUTION");
}
*/

int[][] temps = {
  {43,52,50,72,82,88,72},
  {70,68,86,72,75,81,75},
  {82,82,82,86,41,46,59},
  {60,56,71,81,88,85,78}
};

int rowIndex = 0, colIndex = 0;

int dayOfMay = 3;
String dayOfWeek = "Wed";

if(dayOfMay >= 2 && dayOfMay <= 8){
  rowIndex = 0;
}else if(dayOfMay >= 9 && dayOfMay <= 15){
  rowIndex = 1;
}
else if(dayOfMay >= 16 && dayOfMay <= 22){
  rowIndex = 2;
}
else if(dayOfMay >= 23 && dayOfMay <= 29){
  rowIndex = 3;
}

switch(dayOfWeek){
  case "Mon": {
    colIndex = 0;
    break;
  }
  case "Tue": {
    colIndex = 1;
    break;
  }
  case "Wed": {
    colIndex = 2;
    break;
  }
  case "Thu": {
    colIndex = 3;
    break;
  }
  case "Fri": {
    colIndex = 4;
    break;
  }
  case "Sat": {
    colIndex = 5;
    break;
  }
  case "Sun": {
    colIndex = 6;
    break;
  }
}

if(temps[rowIndex][colIndex] < 65){
  println("You need a coat for " + dayOfWeek + " The " + dayOfMay);
}else{
  println("You don't need a coat for " + dayOfWeek + " The " + dayOfMay);
}
