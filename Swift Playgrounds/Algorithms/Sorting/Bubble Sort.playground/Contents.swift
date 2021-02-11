/************************
 Bubble Sort
 ************************/

import Foundation

//Unsorted Array input
var arr = [5, 8, 1, 9, 10, 2, 6];
let n = arr.count

for i in 0..<arr.count {
  for j in 1..<arr.count - i {
    if arr[j] < arr[j-1] {
      let tmp = arr[j-1]
      arr[j-1] = arr[j]
      arr[j] = tmp
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

