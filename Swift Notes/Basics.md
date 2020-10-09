## Swift Language
### About
- Swift is a general-purpose, multi-paradigm, protocol oriented, object oriented, compiled programming language ; developed by Apple Inc. for iOS, iPadOS, macOS, watchOS and Linux.

### Advantages of Swift over Objective-C
- Swift is easier to read
- Swift is easier to maintain
- Swift is safer (Type-Safe) Helps you to clear about types. Eg:  If code expects a `String`, type safely avoids mistakenly passing an `Int`. Similarly prevents passing `optional` to `non-optional` check at compile time.
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

### Control transfer statements in Swift
- Continue
- Break
- Fallthrough
- Return

### Data Types (Int, Float, Double)
- On a 32-bit platform, Int is the same size as Int32.
- On a 64-bit platform, Int is the same size as Int64.
- Float : 32 bit floating point number. 
- Double : Is Float64 in swift. Default and Recommended because , iOS 11 is 64 bit platform. Also swift has Float80 ! 

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

### Value Types
- enums, structures, Swift Collections (Array/Set/Dictionary) and Basic value types (String, Integer)
- structs, enums and tuples are true value types only if all their properties are value types. If any of their properties is a reference type, we still could run into the implicit data sharing issues.

### Reference Types
- Classes and Closures are tipical examples.

### Unowned vs Weak
- A weak reference is always optional and automatically becomes nil when the referenced object deinitializes.
Unowned expects an owner (pointer reference) after deallocation. It never becomes nil. Therefore the unowned variable must not be an optional. 
- For `weak` references, which are set to nil if the instance they reference is deallocated.
- Weak references are automatically set to nil once the object they point to gets deallocated
- Since a weak reference can be set to nil, it is always declared as an optional.
- `unowned` reference is always expected to have a value. which means - when the object deallocated, reference will 
- unowned comes in two flavours - unowned(safe) and unowned(unsafe). It's equivalent to assign and unsafe_unretained from Objective-C
- unowned - When a references object is deallocated(is nil), the unowned does not become a nil because ARC does not set it. That is why unowned reference is non-optional


### Const vs Let
- Difference b/w const and let is `const` evaluated at compile time and `let` evaluated at run time.

### Computed properties
- Are functions *masquerading* as properties. 
- Can change value dynamically and are thus calculated; this is in contrast to stored properties - which are fixed and have to update explicitly.
- **Don't** use for expensive operations is highly discouraged. 
- **DO** use when a value can be different each time you call it.

### Lazy properties
- For expensive and time consuming computations.
- This will make sure properties are calculated at a later time (if at all) and only once - stored.

### Property Observers
- **didSet** after property changed & **willSet** just before property changes.
- **defer** use to trigger property observer from an initializer.

## Optionals & Non-Optionals
- By default optionals values are set to ‘nil’ when defined. Eg : var myVar:Int? //Will set to nil

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


### MISC 
- There are three ways to create a predicate in Cocoa: using a format string, directly in code, and from a predicate template.
- ARC - Automatic Reference Counting is a mechanism which manages a memory, which is applicable for reference type. An object is deallocated only when there are 0 references on it.
- Retain cycle - it is a situation when each of who objects has a strong reference on each other
- By default optionals values are set to ‘nil’ when defined. 
  Eg : `var myVar:Int? //is nil.`
- `final` key will stop overriding method -or- subclassing class

