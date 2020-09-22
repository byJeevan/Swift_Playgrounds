/*
 Question : Swap 2 numbers without temporary variable
 
 Input 
 2
 3
 
 Output
 a=3
 b=2
 
 */


var a = 2
var b = 3

//swap
a = a + b
b = a - b
a = a - b

print("a=\(a)")
print("b=\(b)")
