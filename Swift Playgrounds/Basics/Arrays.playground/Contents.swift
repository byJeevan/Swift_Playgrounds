/*
 * Swift 3.1
 * Basics : Arrays
 * Apple Doc Ref : https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html
 */

import Foundation


//Initialize array of certain type.
var someInts = [Int]()

//To append a single element to the end of a mutable array
someInts.append(3)

//empty array with Array Literal '[]'. Note : Still array is of type [Int]
someInts = []

//Create array with default value
var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)

//Create array 
//1. By adding 2 arrays together
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

//2. By array literals
var shoppingList:[String] = ["Eggs", "Milk"]

//Modify array 
//Number of elements in the array
shoppingList.count
shoppingList.append("Flour")
shoppingList.count

//Add elements by 'Addition assignment' operator
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

//Check for empty array
shoppingList.isEmpty
someInts.isEmpty

//Retrieve array from index
var firstItem = shoppingList[0]

//Change the existing value at a given index
shoppingList[0] = "Six Eggs"

//Change a range of values at once. Note : even if the replacement set of values has a different length than the range you are replacing.
print(shoppingList)
shoppingList[4...6] = ["Banana","Apple"]
print(shoppingList)

//Insert element at specified index
shoppingList.insert("Maple Syrup", at: 0)

//Remove element at specified index
let mapleSyrup = shoppingList.remove(at: 0)
print("Removed  item : \(mapleSyrup)")

//Better approach : Remove element from last / first element of array
let SixEggs = shoppingList.removeFirst()
print("Removed  item : \(SixEggs)")
let apples = shoppingList.removeLast()
print("Removed  item : \(apples)")

//Iterating over an array for-in loop.
print("Iterating over array \n")
for item in shoppingList {
    print(item)
}

//If we need index of each item as well as its value, use enumerated(). It returns 'Tuple' as (index, item)

for (index, value) in shoppingList.enumerated() {
    
    print("Item \(value) at index \(index)")
}






