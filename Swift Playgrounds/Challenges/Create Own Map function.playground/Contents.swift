import UIKit

/*
 * Own Map function implementation for any Collection type.
 */

extension Sequence {
        
    mutating func sticher<NewElement>(_ object:(Element) -> NewElement) -> [NewElement] {
        var result: [NewElement] = []
        
        for item in self {
            result.append(object(item))
        }
        
        return result
    }

}

var temp = [1,2,3,4]

//print(temp.map({$0*2})) //[2, 4, 6, 8]

print(temp.sticher({ $0 * 2}))
