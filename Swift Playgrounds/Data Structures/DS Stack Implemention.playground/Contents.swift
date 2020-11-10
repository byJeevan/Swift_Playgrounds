import UIKit

//Stack implementation (LIFO)

struct Stack {
    
    private var stackArray:[String] = []
    
    func peak() -> String? {
        return self.isEmptyStack() ? nil : stackArray.first
    }
    
    mutating func pop() -> String? {
        return self.isEmptyStack() ? nil : stackArray.removeFirst() //returns removed element from first index.
    }
    
    mutating func push(element:String) {
        stackArray.append(element) //Append at starting index
    }
    
    func isEmptyStack() -> Bool {
        return stackArray.count == 0
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topLogString = "-----STACK----- \n"
        let bottomLogString = "\n------*--------\n"
        let middleLogString = stackArray.joined(separator: "\n")
        return topLogString + middleLogString + bottomLogString
    }
}

//Testing
var stackTest = Stack()
stackTest.push(element: "Eleo")
stackTest.push(element: "Combo")
stackTest.push(element: "Rambo")

print(stackTest)
/*
 -----STACK-----
 Eleo
 Combo
 Rambo
 ------*--------
 */
stackTest.peak()
stackTest.pop()
/*
 -----STACK-----
 Combo
 Rambo
 ------*--------
 */
print(stackTest)
