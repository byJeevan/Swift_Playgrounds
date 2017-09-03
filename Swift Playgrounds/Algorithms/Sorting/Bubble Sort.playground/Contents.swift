/************************
 Bubble Sort
 ************************/

import Foundation

//Unsorted Array input
var arr = [5, 8, 1, 9, 10, 2, 6];
let n = arr.count
var temp:Int;

for i in 0..<n-1 {
    
    //Compare with adjacent element till end.
    for j in 0..<n-1-i {
        
        //Swap if smaller than element arr[j] found.
        if arr[j] > arr[j+1] {
            
            temp = arr[j]
            arr[j] = arr[j+1]
            arr[j+1] = temp
        }
    }
}

//Sorted Array ascending order
print(arr)

