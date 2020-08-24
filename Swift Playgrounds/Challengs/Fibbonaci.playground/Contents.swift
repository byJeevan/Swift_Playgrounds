/*
 
 Question : 
 
 Fibbonaci series till a input n.
 
*/


func fibonacci(n : Int) -> Int {
    
  guard n != 0, n != 1 else { return n }
    
  return fibonacci(n: n - 1) + fibonacci(n: n - 2);
}


let n  = 6;

var fib = fibonacci(n:n);

print(fib)






