/*
 * Caesar Cipher: Encryption
 */

import Foundation

let n = Int(readLine()!)!
let input = readLine()!
let k = Int(readLine()!)!

extension String {
    var asciiArray: [UInt32] {
        return unicodeScalars.filter{$0.isASCII}.map{$0.value}
    }
}

extension Character {
    var asciiValue: UInt32? {
        return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
    }
}

var result = [Character]()

var smallLetterIndexRange = 97...122
var upperLetterIndexRange = 65...90

for ch in input.characters {
    
    let ascii:Int = Int(ch.asciiValue!)
    
    if upperLetterIndexRange.contains(ascii) {
        
        let eChar = upperLetterIndexRange.lowerBound + ( (ascii - upperLetterIndexRange.lowerBound) + k)%26
        
        result.append(Character(UnicodeScalar(eChar)!))
        
    }
    else if smallLetterIndexRange.contains(ascii) {
        
        let eChar = smallLetterIndexRange.lowerBound + ( (ascii - smallLetterIndexRange.lowerBound) + k)%26
        
        result.append(Character(UnicodeScalar(eChar)!))
        
    }
    else {
        
        result.append(ch) //Retain the non-aplhabetical character
    }
}


print(String(result))
