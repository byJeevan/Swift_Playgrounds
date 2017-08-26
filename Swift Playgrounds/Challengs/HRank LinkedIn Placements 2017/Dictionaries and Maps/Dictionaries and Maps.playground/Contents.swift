/*
  Dictionaries and Maps
 */

import Foundation

let n = Int64(readLine()!)!
var dict = [String:Any]()

//Read all contact data and save into dictionary
for i in 0..<n {
    
    var arr =  readLine()!.components(separatedBy: " ").map({$0})
    dict[arr[0]] = arr[1]
    
}

//take queries
for i in 0..<n {
    
    let name = readLine()!
    
    if let phone = dict[name] {
        print("\(name)=\(phone)")
    }
    else{
        
        print("Not found")
    }
}