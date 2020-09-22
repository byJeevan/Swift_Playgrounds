/************************
 Problem Statement:
 Print Most repeated Colors in a given colors array.
 ************************/

import Foundation

//Input Array of colors
let inputArray = ["green", "red" , "green", "blue", "green", "black", "red", "blue", "blue", "gray", "purple", "white", "green", "red", "yellow", "red", "blue", "green"]


func getTopItemsArray(_ array:[String]) -> [String] {
    
    var topArray = [String]()
    var colorDictionary = [String:Int]()
    
    //Step 1 : Form dictionary of items with its count
    for color in array {
        
        if let count = colorDictionary[color] {
            colorDictionary[color] = count + 1
        }
        else{
            //First time encoured a color, initialize value to '1'
            colorDictionary[color] = 1
        }
        
    }
    
    //Step 2 : Find the max value in the colors count dictionary
    let highest = colorDictionary.values.max()
    
    //Step 3 : Get the 'color' key having 'height' value
    for (color, count) in colorDictionary {
        
        if count == highest {
            topArray.append(color)
        }
        
    }
    
    
    return topArray
}

//Print array of colors most repeated.
print(getTopItemsArray(inputArray))




