## Swift Language
### About
- Swift is a general-purpose, multi-paradigm, protocol oriented, object oriented, compiled programming language ; developed by Apple Inc. for iOS, iPadOS, macOS, watchOS and Linux.

### Advantages of Swift over Objective-C
- Swift is easier to read
- Swift is easier to maintain
- Swift is safer
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

### Value Types
- enums, structures, Swift Collections (Array/Set/Dictionary) and Basic value types (String, Integer)
- structs, enums and tuples are true value types only if all their properties are value types. If any of their properties is a reference type, we still could run into the implicit data sharing issues.

### Reference Types
- Classes and Closures are tipical examples.

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

### MISC 
- There are three ways to create a predicate in Cocoa: using a format string, directly in code, and from a predicate template.
- ARC - Automatic Reference Counting is a mechanism which manages a memory, which is applicable for reference type. An object is deallocated only when there are 0 references on it.
- Retain cycle - it is a situation when each of who objects has a strong reference on each other
- By default optionals values are set to ‘nil’ when defined. 
  Eg : `var myVar:Int? //is nil.`
- `final` key will stop overriding method -or- subclassing class

### Const vs Let
- Difference b/w const and let is `const` evaluated at compile time and `let` evaluated at run time.

### Unowned vs Weak
- For `weak` references, which are set to nil if the instance they reference is deallocated.
- Weak references are automatically set to nil once the object they point to gets deallocated
- Since a weak reference can be set to nil, it is always declared as an optional.
- `unowned` reference is always expected to have a value. which means - when the object deallocated, reference will 
- unowned comes in two flavours - unowned(safe) and unowned(unsafe). It's equivalent to assign and unsafe_unretained from Objective-C
- unowned - When a references object is deallocated(is nil), the unowned does not become a nil because ARC does not set it. That is why unowned reference is non-optional
