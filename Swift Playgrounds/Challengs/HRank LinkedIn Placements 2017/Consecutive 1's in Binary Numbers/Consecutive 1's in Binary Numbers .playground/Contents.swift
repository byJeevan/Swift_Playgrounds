/*
  Consecutive 1's in Binary Numbers
 */

import Foundation

let n = Int(readLine()!)!
let strN = String(n , radix:2);
var maxCount = 0;
var tempCount = 0;

//Loop each characters
for i in strN.characters.indices {
    
    if (strN[i] == "1") {
        //Increment count of '1'
        tempCount  = tempCount + 1;
    }
        
    else{
        //Reset count
        tempCount = 0;
    }
    
    //Track max count of '1's
    if (tempCount > maxCount) {
        maxCount = tempCount;
    }
    
}

print(maxCount);