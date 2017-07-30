/*
 
   Factorial of given number. 
 
 */

func factorial(n: Int) -> Int {
    
    if n >= 0 {
        return n == 0 ? 1 : n * factorial(n: n - 1)
    } else {
        return 0
    }
}


let n  = 4;

var fact = factorial(n:n);

print(fact)


