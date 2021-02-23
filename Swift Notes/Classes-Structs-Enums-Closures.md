## Value Types
- Structs, such as Int, String, Double and Bool
- Arrays, dictionaries and sets
- Enumerations and tuples

## Reference Types
- Functions
- Classes
- Closures

### Value vs Reference types
- Value type: each instance keeps a unique copy of its data. *A copy of an instance is created* when it’s assigned to a variable, constant or property.
- Reference type: each instance shares the same copy of the data. *A reference to one instance is created* when it’s assigned to a variable, constant or property.

### How `let` and `var` work differently for value types and reference types ?
When we define a constant propery (with `let`), 
- For reference types, the reference itself needs to remain constant. So you can change the instance, like its properties, but you can’t change the reference.
- For value types, the value itself needs to remain constant. So you can’t change the value, or any of its properties. The value is immutable.

## Structs
Swift provides a flexible building block of making use of constructs as Structures. By making use of these structures once can define constructs methods and properties.

### Defination & Introduction
**Pros:**
- Suitable for small data models
- Encapsulate data
- To copy the properties by 'values' rather than by 'references'

**Cons:**
- We cannot subclass
- KVC not supported

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

### Defination & Introduction
- Blue print of object / building blocks of you app program.
- Usually we create instance of class called 'object'.

### Class initialization

#### 1. Designated initializer
- A designated initializer must call a designated initializer from its immediate superclass

#### 2. Convenience initializer
- A convenience initializer must ultimately call a designated initializer.
- Convenience initializers can call other
convenience initializers, but they ultimately call a designated initializer from the same class

### Subclassing
- Is a way to achieve polymorphism.

### Similarities between classes and structures
Both can
- Define properties to store values
- Define methods to provide functionality
- Define subscripts to provide access to their values using subscript syntax
- Define initializers to set up their initial state
- Be extended to expand their functionality beyond a default implementation
- Conform to protocols to provide standard functionality of a certain kind

### Differences between classes and structures
- Type: A structure is a value type, while a class is a reference type
- Inheritance: A structure cannot inherit from other types, while a class can
- KVC : structs will not support. Classes inherited from NSObject will support.

### Classes have additional capabilities that structures don’t have :
- Inheritance enables one class to inherit the characteristics of another.
- Type casting enables you to check and interpret the type of a class instance at runtime.
- Deinitializers enable an instance of a class to free up any resources it has assigned.
- Reference counting allows more than one reference to a class instance.
- KVO capability

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

## Enumerations 
An enumeration **defines a common type** for a group of related values and enables you to work with those values in a type-safe way within your code

### Why do we need Enums ? (Tj.Veens - Swift in Depth)
- Enums are sometimes an alternative to subclassing, allowing for a flexible architecture.
- Enums give you the ability to catch problems at compile time instead of runtime.
- You can use enums to group properties together.
- Enums are sometimes called sum types, based on algebraic data types.
- Structs can be distributed over enums.
- When working with enum’s raw values, you forego catching problems at compile time.
- Handling strings can be made safer by converting them to enums.
- When converting a string to an enum, grouping cases and using a lowercased string makes conversion easier.

### Enum cases default value ?
**Each enumeration definition defines a new type.** Hence, Swift enumeration cases don’t have an integer value set (implicit) by default, unlike languages like C and Objective-C.

Example:
```
enum CompassPoint {
    case north
    case south
    case east
    case west
}
```
Here `north`, `south`, `east` and `west` don’t implicitly equal 0, 1, 2 and 3. 

### What are associated values in Enums ?
Used to **store values** of other types with **enum case values.**

Example:
```
enum Barcode {
   case upc(Int, Int, Int, Int)
   case qrCode(String)
}
```

### What is Rawvalue in Enums ?
Enum cases can be prepopulated with default values called ‘rawValue’.

Example 1:
```
enum Planets:Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune 
} // “mercury” explicitly assigned raw (Int) value as ‘1’. For `venus` implicitly assigned “2” and so on.
```
Example 2:
```
enum Planets:String {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune 

} //Implicitly assigned raw String value “mercury” to `mercury` case and so on.
```

> NOTE: For any enumeration with a string, integer, or floating-point raw type, the Swift compiler automatically adds RawRepresentable conformance.

### What are Recursive Enums ?
A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases

Example:
```
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

//-or- enable indirection for all of the enumeration’s cases :

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

```

### How do we access Swift Enums in Objective-C ?
Using the @objc attribute. But those enums must declare an integer raw type, and cannot be generic or use associated values.
> Note: Because Objective-C enums are not namespaced, enum cases are imported into Objective-C as the concatenation of the enum name and case name.
Working Example: https://oscarcortes.medium.com/using-swift-string-enums-in-objective-c-f6683da5b92e

### How `optional` implemented as enum ?
```
enum OptionalValue<T> {
    case None
    case Some(T)
}
```
`let x: String? = nil` //actually means: `let x = Optional<String>.None`
`let x :String? = "hello"` //actually means: `let x = Optional<String>.Some("hello")`


### References:
- [Medium #post1](https://medium.com/swift-india/functional-swift-closures-67459b812d0)
- [programiz.com](https://www.programiz.com/swift-programming/closures)
