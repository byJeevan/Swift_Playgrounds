## Swift Language
### About
- Swift is a general-purpose, multi-paradigm, protocol oriented, object oriented, compiled programming language ; developed by Apple Inc. for iOS, iPadOS, macOS, watchOS and Linux.
- Swift is a type-safe language, and doesn’t allow (for example) a variable of type `String` and a variable of type `Double` to swap values with each other. Attempting to do so results in a compile-time error. 
- In Swift the classes are not inherited from the base class and the classes that you define without specifying its superclass, automatically becomes the base-class. Note: In case objective : Root class either NSObject or NSCoder or NSProxy class
- There are many different ways to pass data such as Delegate, KVO, Segue, and NSNotification, Target-Action, Callbacks.

### Advantages of Swift over Objective-C
- Swift is easier to read
- Swift is easier to maintain
- Swift is safer (Type-Safe) : Helps you to clear about types. Eg:  If code expects a `String`, type safely avoids mistakenly passing an `Int`. Similarly prevents passing `optional` to `non-optional` check at compile time.
- Swift is unified with memory management
- Swift requires less code
- Swift is faster
- Fewer name collisions with open source projects
- Swift support dynamic libraries
- Swift playgrounds encourages interactive coding

### Swift's Pattern matching 6 techniques
- *Tuple patterns* are used to match values of corresponding tuple types.
- *Type-casting patterns* allow you to cast or match types.
- *Wildcard patterns* match and ignore any kind and type of value.
- *Optional patterns* are used to match optional values.
- *Enumeration case patterns* match cases of existing enumeration types.
- *Expression patterns* allow you to compare a given value against a given expression.

## Access Controls
- Swift provides 5 access controllers based on Modules & Source Files Open Access, Public, Internal, File-Private, Private.
- Note: A *module* is a single unit of code distribution—a framework or application that is built and shipped as a single unit and that can be imported by another module with Swift’s import keyword.
- Open or Public access : Enables to access source file within defined module or any other files of imported modules.
- Internal access (default) : Access entities in source files within defined module.
- File-Private access : Restricts the use of an entity- to the own defined source file.
- Private access : Restricts the use of an entity- to the enclosing declaration. And extensions that are declared in the same file. 

#### Public vs Open access :
- Both are very much similar, But the open access level was introduced to *impose limitations on class inheritance and method override* in Swift 2.0+. 
- Open classes can be subclassed in the defined module -OR- in the imported modules in which class is defined. Even Open method can be overridden in the defined module -OR- in the imported modules in which method is defined.
- Same applied for public class and class memebers EXCEPT only with in defined module.
- Eg: Core Data is fine example. Documentation says - some of methods of the `NSManagedObject` class should not be overridden. If Apple were to apply the public access level to these methods, developers would no longer be able to override these methods in their `NSManagedObject` subclasses.
- Thus they protect the integrity of a library or framework.

### Control transfer statements in Swift
- Continue
- Break
- Fallthrough
- Return

### Variadic Parameters
- Variadic parameters : The parameter accepts zero or more values of a specified type.
- Built in Eg. `print(1, 2, 3, 4, 5)`
- To sum up any number integer inputs : 
    ```
    func sum1(_ numbers: Int...) -> Int {
        var total = 0

        for number in numbers {   total += number }

        return total
    }

    //can be called
    let total = sum2(1, 2, 3, 4, 5)
    ```

### Computed properties
- Are functions *masquerading* as properties. 
- Can change value dynamically and are thus calculated; this is in contrast to stored properties - which are fixed and have to update explicitly.
- **Don't** use for expensive operations is highly discouraged. 
- **DO** use when a value can be different each time you call it.

### Lazy properties
- A lazy stored property is a property whose initial value is not calculated until the first time it is used. You indicate a lazy stored property by writing the lazy modifier before its declaration.
- Note : You must always declare a lazy property as a variable (with the var keyword), because its initial value might not be retrieved until after instance initialization completes. Constant properties must always have a value before initialization completes, and therefore cannot be declared as lazy.
- Pros : 
1. When a initial value property is dependent on some other factors.
2. When initialization of property expensive in terms of time and memory.
3. This will make sure properties are calculated at a later time (if at all) and only once - stored.

### Stored properties
- A stored property is a constant or variable that is stored as part of an instance of a particular class or structure.
- We can provide a default value for a stored property as part of its definition -OR- can also set and modify the initial value for a stored property during initialization.

Eg:
```
struct Num {
   var digits: Int
   let pi = 3.1415
}
```

### Property Observers
- **didSet** after property changed & **willSet** just before property changes.
- **defer** use to trigger property observer from an initializer.

## Optionals & Non-Optionals
- By default optionals values are set to ‘nil’ when defined. 
Eg : `var myVar:Int?` //Will set to nil

### Unwrapping optionals
1. Optional binding (if-let)
2. guard statement (guard let)
3. force unwrapping (!)
4. Optional chaining

### 1. Optional binding
- Use optional binding to find out whether an optional contains a value and if so, to make that value available as a temporary constant or variable.
    ``` 
    if let constantName = someOptional {
        //constantName is now non-optional
    }
    ```
    
### 2. `guard` statement
- It reduces nested ‘if-else’ statements. You can think of guard more like an Assert, but rather than crashing, you can gracefully exit.
- Swift 2 introduced.
    ```
    guard <Some condition> else {
      //Code to handle if above condition fails.
    }
    ```
    
### 3. Force unwrapping
- If we are sure that a value of optional isn’t nil, swift allows to force unwrap.
- Tipically not safe practice & hence not recomonded.
    ```
    //example:
    let str = "5"
    let num = Int(str) //optional(5)
    let forcedNum = Int(str)! //force unwrapped to '5'
    ```

### 4. Optional chaining
- Process of calling/querying properties, methods where multiple calls/queries chained together. If any link in the chain fails, then the entire chain fails by returning nil.
- Opposite of 'Forced unwrapping' ‘?’ placed after optional value to call its property or method.
    ```
    class ElectionPoll {
        var candidate: Pollbooth?
    }
    class Pollbooth {
        var name = "MP"
    }

    let cand = ElectionPoll()

    if let candname = cand.candidate?.name { //--- Optional chaining
        print("Candidate name is \(candname)")
    }else {
        print("Candidate name cannot be retreived")
    }

    ```
## Data Types in Swift
- **(Int, Float, Double)**
- On a 32-bit platform, Int is the same size as Int32.
- On a 64-bit platform, Int is the same size as Int64.
- Float : 32 bit floating point number. 
- Double : Is Float64 in swift. Default and Recommended because , iOS 11 is 64 bit platform. Also swift has Float80 ! 

## Collections in Swift
### Mutability of Collections :
- If you create a collection type(Array, Set or Dictionary) and assign it to a variable type (var), that collection type will be mutable. This means that you can change (or mutate) the collection after it’s created by adding, removing, or changing items in the collection. If you assign an array, a set, or a dictionary to a constant (let), that collection is immutable, and its size and contents cannot be changed.

### Const vs Let
- Difference b/w const and let is `const` evaluated at compile time and `let` evaluated at run time.

### Value Types vs Reference Types
- enums, structs, Swift Collections (Array/Set/Dictionary) and Basic value types (String, Integer)
- structs, enums and tuples are true value types only if all their properties are value types. If any of their properties is a reference type, we still could run into the implicit data sharing issues.*more?
- Classes and Closures are tipical examples of Reference Types

### mutating function
- As Structures are of value type we cannot modify the properties directly.
- By adding `mutating` keyword to any function in value type (such as struct, enum,  etc) can enable them to modify the variable. 
- Internally when we try to mutate the value type, **it does not mutate its value but it mutates the variable holding that value.**

**Explained :**
If we try to change any variable inside a class it’s straight forward.
    ```
    class Employee {
        var name : String
        var teamName : String
        init(name: String, teamName: String) {
            self.name = name
            self.teamName = teamName
        }
        func changeTeam(newTeamName : String){
            self.teamName = newTeamName
        }
    }
    var emp1 = Employee(name : "Suneet", teamName:"Engineering")
    print(emp1.teamName)    //Engineering
    emp1.changeTeam(newTeamName : "Product")
    print(emp1.teamName)
    ```
Whereas if you try to do the same in any value type, it will show us a compilation error
*"cannot assign to property: 'self' is immutable"*
    ```
    struct Employee {
        var name : String
        var teamName : String
        init(name: String, teamName: String) {
            self.name = name
            self.teamName = teamName
        }
        func changeTeam(newTeamName : String){
            self.teamName = newTeamName //✖️ Error: cannot assign to property: 'self' is immutable
        }
    }
    ```
    
We can solve by adding `mutable` keyword for the method :
    ```  
    mutating func changeTeam(newTeamName : String){
        self.teamName = newTeamName //✖️ Error: cannot assign to property: 'self' is immutable
    }
    ```

### `AnyObject`
- Swift defines the `AnyObject` type alias to represent instances of any reference type, and it’s internally defined as a protocol

### MISC 
- There are three ways to create a predicate in Cocoa: using a format string, directly in code, and from a predicate template.
- ARC - Automatic Reference Counting is a mechanism which manages a memory, which is applicable for reference type. An object is deallocated only when there are 0 references on it.
- By default optionals values are set to ‘nil’ when defined. 
  Eg : `var myVar:Int? //is nil.`
- `final` key will stop overriding method -or- subclassing class

