/*
  Bitwise AND
 */


import Foundation
import Darwin

var testCaseCount = Int(readLine()!)!

for t in 0..<testCaseCount {
    
    let inputs = readLine()!.components(separatedBy : " ").map({ Int($0)! })
    let n = inputs[0]
    let k = inputs[1]
    
    var m = 0;
    
    for i in 0..<n {
        
        for j in i+1..<n {
            
            let bitWiseResult = (i+1)&(j+1);
            
            if( m < bitWiseResult && bitWiseResult < k ) {
                m = bitWiseResult;
            }
        }
    }
    
    
    print(m)
}
