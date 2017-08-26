/*
  Divisible Pair of Sum
 */


import Foundation


let firstPart = readLine()!.components(separatedBy : " ").map({ Int($0)!})

let n = firstPart[0]
let k = firstPart[1]
let arr = readLine()!.components(separatedBy : " ").map({ Int($0)!})
var count = 0;

for i in 0..<n-1 {
    
    for j in i+1..<n {
        
        let sumOfPair = arr[i] + arr[j]
        
        if (sumOfPair%k == 0) {
            
            //     print("\(arr[i]) + \(arr[j])")
            count = count + 1
            
        }
        
    }
}

print(count)