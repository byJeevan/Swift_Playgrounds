## Generics
Placeholder for types that allows flexible code that can be applied across multiple types.

#### The advantage of using generics over `Any` type that
- They still allow the compiler to enforce strong type-safety. 
- With generics, you would not work with `Any`,  saving you from downcasting at runtime.  
		
### Generic Method/Function
```
//Example of generic method which takes any type of parameter.
func printMe<T>(a: T) {
    print(a)
}
printMe(a: 1) //prints 1
printMe(a: "iPhone") //prints ‘iPhone’
``` 

### Generic Type (can be Class, Struct, Enum) :
```
//Example Generic version of stack (LIFO) implementation
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
```
For example, to create a new stack of strings, you write :
```
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
```

### Type Parameter:
In example above, the placeholder type `T` is an example of a "Type parameter".

### What are the “type parameters” of Dictionary and Array?
Key and Value in Dictionary<Key, Value> and Element in Array<Element>

> NOTE: 
> Collections are generic implementations under the hood : Swift collections (Array, Set and Dictionary) types are implemented as generic functions.
> When we use a generic method/function ’within’ a generic type (class, struct, enum), we do not > need Type Parameter (eg. <T>) in the declaration.

### Multiple Type Parameters:
We can add multiple types withing <> braces like below example:
`class AnotherGenericClass<TypeOne, TypeTwo, TypeThree>{ ... }`

### Extending Generic Type :
No need to provide parameter of Generic Type in your extension definition.
```
//Example: Extension of generic stack - `Element` type available to use.
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
```

#### Type constraints - can be used with Generic Function or Generic Types (class,struct,enums) :
Type constraints specify that a `type parameter` (say T) must inherit from a specific class, or conform to a particular protocol or protocol composition.
Eg : type constraint on the `key` type for `Dictionary`, which specifies that the key type must conform to the `Hashable` protocol - so that it can check whether it already contains a value for a particular key.

Eg 2. It is possible to force the type parameters of a generic class to implement a protocol.
For example, Equatable as a type constraint.
```
class MyGenericClass<Type: Equatable>{ 
 //... class implementations ...
}
```

#### Exercise - Below function will not compile ? 
```
func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
```

Reason “==” can’t be applied for Type `T` which is not confirmed with `Equatable` protocol. 


### Swift’s generics are invariant:
Which states that just because a generic type wraps a subclass, it does not make it a subtype of a generic wrapping its superclass.

Ex: 		 	 	 		
```
struct Container<T> {}
var containerSwiftCourse: Container<SwiftOnTheServer>  =  Container<SwiftOnTheServer>()
var containerOnlineCourse: Container<OnlineCourse> = containerSwiftCourse					
error: cannot convert value of type 'Container<SwiftOnTheServer>' to ➥ specified type 'Container<OnlineCourse>' 
.
```

### Generic `where` clause 
It's possible to specify several type constraints for generics using the where clause:
``` 
func doSomething<T where T: Comparable, T: Hashable>(first: T, second: T) {
 // Access hashable function
  guard first.hashValue == second.hashValue else { return }
 
 // Access comparable function
  if first == second {
    print("\(first) and \(second) are equal.")
  } 
}
```
					
It's also valid to write the where clause after the argument list:
```func doSomething<T>(first: T, second: T) where T: Comparable, T: Hashable { ... }```

### Generic Subscripts :

### Associated Types :
“An associated type gives a placeholder name to a type that’s used as part of the protocol.”

Example: 
```
//A protocol called Container, which declares an associated type called Item
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
```

#### The `Container` protocol defines three required capabilities that any container must provide:
* It must be possible to add a new item to the container with an append(_:) method.
* It must be possible to access a count of the items in the container through a count property that returns an Int value.
* It must be possible to retrieve each item in the container with a subscript that takes an Int index value.

### Adding Constraints to AssociatedType :
Example : `associatedtype Item: Equatable`

 
### What's the difference in writing `<T: Equatable>` and `<T> ... where T: Equatable`.
- *Both are same*.


