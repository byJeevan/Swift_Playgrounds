/************
 Swift String Basics
 ************/

import Foundation

//String literal
let firstString = "Hello World!"

//String interpolation
"Every language starts with \(firstString)"

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

//Concatination
let longerGreeting = greeting + " We're glad you're here!"

//Compare strings.  (==) operator possible because Strings are Value types in Swift.
let cafe1 = "Cafe\u{301}"
let cafe2 = "Café"
cafe1 == cafe2

//Array to String mapping
let carsArray = ["BMW", "Benz", "Tesla", "Audi"]
let carsString = carsArray.joined(separator: " ")
carsString.components(separatedBy: " ").map({ $0 }) //Back to Array "["BMW", "Benz", "Tesla", "Audi"]"



