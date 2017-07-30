/*
 
 Question :
 
 A left rotation operation on an array of size n shifts each of the array's elements 1 unit to the left. For example, if 2 left rotations are performed on array [1,2,3,4,5], then the array would become [3,4,5,1,2].
 
 Given an array of n integers and a number, d, perform left rotations on the array. Then print the updated array as a single line of space-separated integers.
 
 Input :
 
 5 
 4
 1 2 3 4 5
 
 Output :
 5 1 2 3 4
 
 */

import Foundation

let arr = [1,2,3,4,5]
let n = 5
let k = 4

var result = ""
var cacheArr =  ""

for index in 0..<n {
    
    if (index < k) {
        //cache it for append later
        cacheArr = cacheArr + "\(arr[index]) "
        
    }
    else{
        //append now
        result = result + "\(arr[index]) "
        
    }   
    
}

print("\(result)\(cacheArr)")
