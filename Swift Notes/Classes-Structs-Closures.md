### Similarities between classes and structures
- Properties: These are used to store information in our classes and structures
- Methods: These provide functionality for our classes and structures
- Initializers: These are used when initializing instances of our classes and structures
- Subscripts: These provide access to values using the subscript syntax
- Extensions: These help extend both classes and structures

### Differences between classes and structures
- Type: A structure is a value type, while a class is a reference type
- Inheritance: A structure cannot inherit from other types, while a class can
- KVC : structs will not support. Classes inherited from NSObject will support.

### Value vs Reference types
- Structures are value types. When we pass instances of a structure within our application,
we pass a copy of the structure and not the original structure. Classes are reference types,
therefore when we pass an instance of a class, within our application, a reference to the
original instance is passed.

## Structs
- We cannot subclass
- Suitable for small data models

### Struct Initialization 
↳ Memberwise Initialization, Custom, Designated, Convenience, Required initializers, Optional Initializers, Failable initializers, Throwing Initializers

#### 1. Memberwise (free) initializer
- which is a free initializer the compiler generates for you.
- Swift structures (and only structures) automatically generate a memberwise initializer.
- You can use default initializers when your types either don’t have any stored properties.
- Re-ordering structure properties, will break instance initialization.

- Eg: Struct `Player` defined with Memberwise initializer

```
struct Player {
  let name:String
  let pawn:Int
}

let player = Player(name:"Jeff", pawn:3) //Memberwise initializer
```
#### 2. Custom initilizers

```
struct Player {
  let name:String
  let pawn:Int
  
  init(name:String) {
    self.name = name
    self.pawn = Int.random(in: 0..<10)
  }
}

let player = Player(name:"Jeff") //Custom initializer
```
- As soon as you define an 'custom initializer', you lose the automatic 'memberwise initializer'.
- **You can offer both initializers by extending struct and putting your custom initializer there in the extension.**

```
  //restore struct
  struct Player {
    let name:String
    let pawn:Int

    //Memberwise initializer will inserted. 
  }

  extension Player {
  //Adding custom initializer in the extension
    init(name:String) {
      self.name = name
      self.pawn = Int.random(in: 0..<10)
    }
  }
```

## Classes

### Class initialization

#### 1. Designated initializer
- A designated initializer must call a designated initializer from its immediate superclass

#### 2. Convenience initializer
- A convenience initializer must ultimately call a designated initializer.
- Convenience initializers can call other
convenience initializers, but they ultimately call a designated initializer from the same class

### Subclassing
- Is a way to achieve polymorphism.



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
- If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.

- For example
    ```
    //A closure at the end of `travel` function. 
    func travel(action: () -> Void) {
        print("Do some travel action")
        action()
        print("I arrived")
    }
    
    //We can execute it in casual way
    travel() {
        print("I'm driving in my car")
    }
    
    //Because there aren’t any other parameters to `travel` function, we can eliminate parentheses '()' 
    travel {
      print("I'm driving in my car")
    }
    ```
- We can have mulitple trailing closures in *Swift 5.3*
    ```
    // Eg. Multiple trailing closure arguments
    UIView.animate(withDuration: 0.3) {
      self.view.alpha = 0
    } completion: { _ in
      self.view.removeFromSuperview()
    }
    ```

### Closures are Reference Types

### Escaping & Non-Escaping Closures
-  *A non-escaping closure will be executed within (/along with) the body of that function and nowhere else. When the function ends, the closure will no longer exist in memory.*
- *An escaping closure grants the ability of the closure to outlive the function and can be stored elsewhere.*
- **When to use escaping ?** When we are dealing with dispatch queue, the queue will hold onto the closure for you, and when the queue is done completing its work, then it will return back to the closure and complete it. Since dispatch queue is outside of the scope, we need to use escaping closure. Another instance is when we need to store our closure to a global variable, property, or any bit of storage that lives on past the function.
- During the earlier days of Swift, closure parameters were escaping by default. Due to better memory management and optimizations, Swift has changed all closures to be non-escaping by default.

### @autoclosure
- *An autoclosure is a closure that is automatically created to wrap an expression that's being passed as an argument to a function*

#### Struct inheritance/polymorphism wouldn't be possible for at least 2 reasons.
- Structs are stored and moved around by value. This requires the compiler to know, at compile time, the exact size of the struct, in order to know how many bytes to copy after the start of a struct instance.
- Suppose there was a struct A, and a struct B that inherits from A. Whenever the compiler sees a variable of type A, it has no way to be sure if the runtime type will really be an A, or if B was used instead. If B added on new stored properties that A didn't have, then B's size would be different (bigger) than A. The compiler would be unable to determine the runtime type, and the size of these structs.
- Polymorphism would require a function table. A function table would be stored as a static member of the struct type. But to access this static member, every struct instance would need an instance member which encodes the type of the instance. This is usually called the "isa" pointer (as in, this instance is a A type). This would be 8 bytes of overhead (on 64 bit systems) for every instance. Considering Int, Bool, Double, and many other common types are all implemented as structs, this would be an unacceptable amount of overhead. Just think, a Bool is a one byte value, which would need 8 bytes of overhead. That's 11% efficiency!
- That’s why swift provides Protocols to solve all the above problems.


### References:
- [Medium #post1](https://medium.com/swift-india/functional-swift-closures-67459b812d0)
- [programiz.com](https://www.programiz.com/swift-programming/closures)
