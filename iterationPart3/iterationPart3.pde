/*
for(int i = -1; i >= -1000; i -= 2){
  println(i);
}
*/

/*
int[][] matrix = {
                 {2,9,0},
                 {1,3,5},
                 {2,4,7},
                 {8,1,5}};

for(int i = 0; i <= matrix.length-1; i++){
  for(int j = 0; j <= matrix[i].length - 1; j++){
    println(matrix[i][j]);
  }
}
*/


int[][] matrix = {
                 {2,9,0},
                 {1,3,5},
                 {2,4,7},
                 {8,1,5}};

for(int i = 0; i <= matrix[i].length - 1; i++){
  println("");
  for(int j = 0; j <= matrix.length - 1; j++){
    print(matrix[j][i]);
  }
}
