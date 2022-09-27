/*          //challenge1
int minNum = 1;
int maxNum = 1000;

for(int i = minNum; i <= maxNum; i++){
  if(i % 2 == 0){
    println(i);
  }
}
*/

/*          //challenge2
double num =5;
int power = 4;
double sum = 1;

if(power < 0){
  for(int i = -1; i >= power; i--){
    if(i == -1){
      sum = 1;
    }
    sum /= num;
   }
}else{
  for(int i = 1; i <= power; i++){
    if(i == 1){
      sum = 1;
    }
    sum *= num;
  }
}
println(sum);
*/

/*          //challenge3
int[] nums = {0, -100, 10};
int smallest = 0;
int biggest = 0;
int diff = 0;

boolean loopStarted = false;

for(int num: nums){
  if(!loopStarted){
    loopStarted = true;
    smallest = num;
    biggest = num;
  }
  if(num < smallest){
    smallest = num;
  }else if(num > biggest){
    biggest = num;
  }
}

if(smallest < 0 && biggest > 0){
  diff = abs(biggest) + abs(smallest);
}else if(smallest == 0 && biggest != 0){
  diff = biggest;
}else if(smallest != 0 && biggest == 0){
  diff = abs(smallest);
}else if(smallest < 0 && biggest < 0){
  diff = abs(smallest) - abs(biggest);
}else{
  diff = abs(biggest) - abs(smallest);
}

println("The difference between " + biggest + " and " + smallest + " is " + diff);
*/

int[][] nums = {
{2,9,0},
{1,3,5},
{8,1,5}
};
