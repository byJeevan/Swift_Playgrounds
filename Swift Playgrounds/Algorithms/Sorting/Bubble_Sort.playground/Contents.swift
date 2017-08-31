/************************
 Problem : Bubble Sort.
 ************************/

import Foundation

//Unsorted Array input
var bsArray = [5, 8, 1, 9, 10, 2, 6];
let bsArrayCount = bsArray.count;

var minIndex = 0;

//Outer loop
for i in 0..<(bsArrayCount-1) {
    
    minIndex = i;
    
    //Inner loop
    for j in (i+1)..<bsArrayCount {
        
        //compare if min
        if (bsArray[j] < bsArray[minIndex]) {
            
            minIndex = j;
        }
        
        
    }
    
    //Once we have min index, swap
    var temp = bsArray[i]
    bsArray[i] = bsArray[minIndex]
    bsArray[minIndex] = temp;
    
}

print("Sorted Array :", bsArray)
