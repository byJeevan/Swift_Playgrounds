/*
 * Swift 3.1
 * Strings : Basics
 * Apple Doc Ref : https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/StringsAndCharacters.html#//apple_ref/doc/uid/TP40014097-CH7-ID285
 */

import Foundation

//String literal
let firstString = "Hello World!"

//String interpolation
//Example 1  :
"Every language starts with \(firstString)"
//Example 2 :
let price = 2
let number = 3
let cookiePrice = "\(number) cookies: $\(price * number)."

//Escape character '\'
"Every language starts with \"\(firstString)\""

//Unicode character support
let emoji = "\u{1F1F5} in 🌍"
let frenchAccent = "e\u{301}"

//Character count in the First string
firstString.characters.count
emoji.characters.count

//Append string
var greeting = "Welcome!"
greeting.append(" to Earth.")

//Concatination with '+'
let longerGreeting = greeting + " We're glad you're here!"

//Modify strings with Addition assignment operator. Note : with only mutable strings
var variableString = "Apple"
variableString += " Docs"

//Compare strings.  (==) operator possible because Strings are Value types in Swift.
let cafe1 = "Cafe\u{301}"
let cafe2 = "Café"
cafe1 == cafe2

//Characters of string
for ch in variableString.characters {
    print(ch)
}

//Array to String mapping
let carsArray = ["BMW", "Benz", "Tesla", "Audi"]
let carsString = carsArray.joined(separator: " ")
carsString.components(separatedBy: " ").map({ $0 }) //Back to Array



