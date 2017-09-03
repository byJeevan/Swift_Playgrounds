/************************
 Quick Sort
 
 Pscedocode (Recursion):
 procedure quicksort(List values)
 if values.size <= 1 then
 return values
 
 pivot = random element of values
 
 Divide values into the following lists
 list1 = { elements with value higher than the pivot }
 list2 = { pivot }
 list3 = { elements with value lower than the pivot }
 
 return quicksort(list1) + list2 + quicksort(list3)
 ************************/

import Foundation

//Unsorted Array input
var arr = [5, 8, 1, 9, 10, 2, 6];
let n = arr.count

func quicksort(_ a: [Int]) -> [Int] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    
    // Uncomment this following line to see in detail what the
    // pivot is in each step and how the subarrays are partitioned.
    // print(pivot, less, equal, greater)
    
    return quicksort(less) + equal + quicksort(greater)
}

//Sorted Array - ascending order.
print(quicksort(arr))





