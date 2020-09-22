import UIKit


//
// Given an integer array print only even index using only for loop. No if condition.
//

let arr = [0,1,2,3,4,5,6,7,8,9]

//Filter logic
let evens = arr.enumerated().filter { (index, element) -> Bool in
    return index%2 == 0
}.map({ (_: Int, element: Int) -> Int in
    return Int(element)
})

print(evens)

///Solution with mandatory `for` loop.
for (_, item) in arr.enumerated().filter({
    (index: Int, element: Int) -> Bool in
    return index % 2 == 0
    }).map({ (_: Int, element: Int) -> Int in
    return element
    }).enumerated() {
    print(item)
}


