/*
 * Swift 3.1
 * Instroduction : Basics
 * Apple Doc Ref : https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309
 */

import Foundation

//Declaring constants
let maximumNumberOfLoginAttempts = 10

//Declaring variable
var currentLoginAttempt = 0

//Declaring multiple constants or multiple variables on a single line, separated by commas
var x = 0.0, y = 0.0, z = 0.0

//Type anotation. Eg. String
var welcomeMessage: String //Will be not be set 'nil' by default.
welcomeMessage = "Hello"

//Naming constants and variables : 
//Contains any character including Unicode characters.
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

//Use ';' for multiple statements in single line.
let cat = "🐱" ; print(cat)

//Type inference
let pi = 3.14159 // pi is inferred to be of type Double

//Type conversion
let integerPi = Int(pi)

//Type alias
typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min //Will be 0

//Type safty : Non-boolean values are not allowed for conditional statements unlike Objective-c.
if maxAmplitudeFound == 1 {
    print("This is allowed")
}

//Use 'Optionals' in situations where a value may be absent.
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) // convertedNumber is inferred to be of type "Int?", or "optional Int"

//By default optional is automatically set to 'nil'.
let userCommentText : String?
print(userCommentText)




