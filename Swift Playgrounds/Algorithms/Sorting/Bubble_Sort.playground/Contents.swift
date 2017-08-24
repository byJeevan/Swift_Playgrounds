/************************
 Problem : Bubble Sort.
 ************************/

import Foundation

var array =  [5, 3, 4, 6, 8, 2, 9, 1, 7, 10, 11]

var sortedArray = NSMutableArray(array: array)

var sortedAboveIndex = array.count // Assume all values are not in order

var count = 0;

repeat {
    
    var lastSwapIndex = 0
 
    for index in 1..<sortedAboveIndex {
        
        if ((sortedArray[index - 1] as? Int)! > (sortedArray[index] as? Int)!) { //Ascending order, Hence '>'
            sortedArray.exchangeObject(at: index, withObjectAt: index-1)
            lastSwapIndex = index
            
            count = count + 1;
        }
        
    }
    
    //print("Last swapped \(lastSwapIndex)")
    
    sortedAboveIndex = lastSwapIndex
    print(count)
    
    
} while (sortedAboveIndex != 0)


//Print sorted array.
print(sortedArray as Array)
