import UIKit

//Leverage Protocols as parameters to function

protocol  Number {
    var floatValue:Float { get }
}

extension Double : Number {
    var floatValue:Float {
        return Float(self) //do the float conversion for Double
    }
}

extension Int : Number {
    var floatValue:Float {
        return Float(self) //do the float conversion for Int
    }
}

// Now you can write a method that can add any type of operands.
func +(left:Number, right:Number)  -> Float {
    return left.floatValue + right.floatValue;
}

//So that you can use Double or Int to manipulate with Float type without casting.
var x:Double = 1.2343
var y:Int = 5
var result = x+y //6.2343
