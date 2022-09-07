String[] foods = {"Pizza", "Cheese Cake", "Caramel Icecream"};
foods[0] = "Black Licorice"; // least favorite; gross

String[] hobbies = {"Snowboarding", "Drawing", "Reading", "lifting"};
hobbies[hobbies.length - 1] = "coding";

int[][] matrix = {
{0,1,2,3,4,5,6,7,8},
{-1,0,1,2,3,4,5,6,7},
{-2,-1,0,1,2,3,4,5,6},
{-3,-2,-1,0,1,2,3,4,5},
{-4,-3,-2,-1,0,1,2,3,4},
{-5,-4,-3,-2,-1,0,1,2,3},
{-6,-5,-4,-3,-2,-1,0,1,2},
{-7,-6,-5,-4,-3,-2,-1,0,1},
{-8,-7,-6,-5,-4,-3,-2,-1,0}
};

print(matrix[4][2]);
