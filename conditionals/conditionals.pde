int num = 171;

/*
if(num % 3 == 0 && num % 5 == 0){
  println("It is a multiple of 3 and 5!");
}
else if(num % 3 == 0){
  println("It is a multiple of 3!");
}
else if(num % 5 == 0){
  println("It is a multiple of 5!");
}
*/

int i;

for(i = 2; i < 101; i++){
  if(num % i == 0){
    println("The number is a multiple of " + i);
  }
}
