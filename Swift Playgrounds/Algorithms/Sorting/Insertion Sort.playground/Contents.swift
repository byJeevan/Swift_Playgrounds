/************************
 Insertion Sort :
 The array is virtually split into a sorted and an unsorted part. Values from the unsorted part are picked 
 and placed at the correct position in the sorted part.
 ************************/

import Foundation

//Unsorted Array input
var arr = [5, 8, 1, 9, 10, 2, 6];
let n = arr.count
var key:Int;

for i in 0..<n {
    
    key = arr[i]
    
    //Iterate backwards through he stored position
    
    for j in (0..<i).reversed() {
        
        //Compare all other items for smaller than key
        if key < arr[j] {
            
            //remove item from from original position
            arr.remove(at: j+1)
            
            //insert the number at key position
            arr.insert(key, at: j)
            
            
        }
        
    }
    
 
}

/*
    //Alternative way:
    for index in 1..<arr.count {		 
        var currentIndex = index
        while currentIndex > 0 && arr[currentIndex] < arr[currentIndex - 1] {  
            arr.swapAt(currentIndex - 1, currentIndex)
            currentIndex -= 1
        }
    }
 
*/

//Sorted Array - Ascending order.
print(arr)




