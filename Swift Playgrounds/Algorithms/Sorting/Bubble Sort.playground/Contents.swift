/************************
 Bubble Sort :
 Repeatedly comparing pairs of adjacent elements and then swapping their positions if they exist in the wrong order.
 ************************/

import Foundation

//Unsorted Array input
var arr = [5, 8, 1, 9, 10, 2, 6];
let n = arr.count

for i in 0..<arr.count {
    for j in 1..<arr.count - i { //pass finds the n-th largest element and puts it into its final place. So, skip n-1 th loop.
        //Swap if current item  arr[j] is smaller than arr[j-1]
        if arr[j-1] > arr[j] {
            let temp = arr[j]
            arr[j] = arr[j-1]
            arr[j-1] = temp
        }
    }
}


/*
Alternativly, 
for i in 0..<n-1 {
    
    //Compare with adjacent element till end.
    for j in 0..<n-1-i {
        
        //Swap if smaller than element arr[j] found.
        if arr[j] > arr[j+1] {
            
            let temp = arr[j]
            arr[j] = arr[j+1]
            arr[j+1] = temp
        }
    }
}
*/

//Sorted Array ascending order
print(arr)

