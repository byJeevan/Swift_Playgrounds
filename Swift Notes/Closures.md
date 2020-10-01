## Closures

### Defination & Introduction
- *Closures* are self-contained blocks of functionality that can be passed around and used in your code.
- *Closure expressions* are a way to write inline closures in a brief, focused syntax.
- Closure expression syntax has the following general form:
  ```
  { (<parameters>) -> <return type> in
      <statements>
  }
  ```
- *parameters* can be : 
  - in-out types. But can't have default value.
  - Variadic parameters
  - Tuples can be parameters or return type.
  
- The start of the closure’s body is introduced by the `in` keyword.


### Closures take one of three forms
#### 1. Global functions are closures that have a name and don’t capture any values.
#### 2. Nested functions are closures that have a name and can capture values from their enclosing function.
#### 3. Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.

### Trailing Closures

### Closures are Reference Types

### Escaping & Non-Escaping Closures
-  *A non-escaping closure will be executed within (/along with) the body of that function and nowhere else. When the function ends, the closure will no longer exist in memory.*
- *An escaping closure grants the ability of the closure to outlive the function and can be stored elsewhere.*
- **When to use escaping ?** When we are dealing with dispatch queue, the queue will hold onto the closure for you, and when the queue is done completing its work, then it will return back to the closure and complete it. Since dispatch queue is outside of the scope, we need to use escaping closure. Another instance is when we need to store our closure to a global variable, property, or any bit of storage that lives on past the function.
- During the earlier days of Swift, closure parameters were escaping by default. Due to better memory management and optimizations, Swift has changed all closures to be non-escaping by default.

### @autoclosure
- *An autoclosure is a closure that is automatically created to wrap an expression that's being passed as an argument to a function*

### References:
- [Medium #post1](https://medium.com/swift-india/functional-swift-closures-67459b812d0)
- [programiz.com](https://www.programiz.com/swift-programming/closures)
