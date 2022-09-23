/*
for(int i = 1; i >= -100; i--){
  println(i);
}
*/

/*
int[] nums = {2,3,5,6,2};
int sum = 0;

for(int num: nums){
  sum += num;
}

println(sum);
*/

String[] letters = {"H","O","y","A"};
int vowels = 0;

for(String letter: letters){
  if(letter == "a" || letter == "A" || letter == "e" || letter == "E" || letter == "i" || letter == "I" || letter == "o" || letter == "O" || letter == "u" || letter == "U" || letter == "y" || letter == "Y"){
    if(letter == "y" || letter == "Y"){
      if(random(2) == 1){
        vowels += 1;
      }else{
        break;
      }
    }else{
      vowels += 1;
    }
  }
}

println(vowels);
