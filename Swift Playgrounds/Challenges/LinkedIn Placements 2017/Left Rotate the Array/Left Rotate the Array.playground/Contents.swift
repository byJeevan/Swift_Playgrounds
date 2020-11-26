/*
  Left Rotate the Array
 */

import Foundation

let info = readLine()!.components(separatedBy: " ").map({Int($0)!})
let n = info[0]
let k = info[1]
let arr = readLine()!.components(separatedBy: " ").map({Int($0)!})

var result = ""
var cacheArr =  ""

for index in 0..<n {
    
    if (index < k) {
        //cache it for append later
        cacheArr = cacheArr + "\(arr[index]) "
        
    }
    else{
        //append now
        result = result + "\(arr[index]) "
        
    }   
    
}

print("\(result)\(cacheArr)”)