/*
  Nested Logic
 */

import Foundation

let actualDate = readLine()!.components(separatedBy: " ").map({ Int($0)! })
let expDate = readLine()!.components(separatedBy: " ").map({ Int($0)! })

let dayDiff = actualDate[0] - expDate[0]
let monthDiff = actualDate[1] - expDate[1]
let yearDiff = actualDate[2] - expDate[2]

var totalFine = 0;

if yearDiff > 0 { totalFine = 10000 }
else if monthDiff > 0 && yearDiff >= 0   { totalFine = monthDiff * 500 }
else if dayDiff > 0 && monthDiff >= 0 && yearDiff >= 0  { totalFine = dayDiff * 15  }

print(totalFine)
