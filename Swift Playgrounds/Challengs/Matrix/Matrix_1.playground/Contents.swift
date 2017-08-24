/*
 
 Problem Statement :
 
 Given a square matrix of size , calculate the absolute difference between the sums of its diagonals.
 
 Input : 
 
 3
 
 11  2    4
 4   5    6
 10  8  -12
 
 
 Result : 
 15
 
 
 Explanation : 
 
 Diagonal 1 is 
 11
     5 
 
        -12
 
 And sum is : 4
 
 Diagonal 2 is 
        4
    5
 10

 
 And sum is : 19
 
 Difference: |4 - 19| = 15
 

 
 */



import Foundation

// read the integer n
let n = 3

// declare 2d array
var arr: [[Int]] =  [
                        [11,2,4],
                        [4,5,6],
                        [10,8,-12]
                    ]


var first_diag_Sum = 0;

for index in 0..<n{
    
    first_diag_Sum = first_diag_Sum + arr[index][index];
    
}


var second_diag_Sum = 0;

for index in 0..<n{
    
    second_diag_Sum = second_diag_Sum + arr[index][n-index-1];
    
}

print(abs(first_diag_Sum - second_diag_Sum))

