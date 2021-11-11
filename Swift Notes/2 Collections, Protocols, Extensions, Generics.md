## Collections
### Mutability of Collections :
- If you create a collection type(Array, Set or Dictionary) and assign it to a variable type (var), that collection type will be mutable. This means that you can change (or mutate) the collection after it’s created by adding, removing, or changing items in the collection. If you assign an array, a set, or a dictionary to a constant (let), that collection is immutable, and its size and contents cannot be changed.
- Collections are [generic implementations](https://github.com/byJeevan/Swift_Playgrounds/blob/master/Swift%20Notes/Generics.md) under the hood. Swift collections (Array, Set and Dictionary) types are implemented as generic functions.

## Higher Order Functions
- Higher order functions are based on closures. 
- Shorthand arguments such as $0, $1 also can be used to simplify.

### map
It performs an operation on all the elements of a collection and returns a new collection with the results of the operation on the original elements.
Example: 
`let doubled = [1,2,3,4].map { $0 * 2 }` 
Returns [2,4,6,8] array having doubled values performed on each elements.

##### Approaching dictionary with `map` 
For instance,
```
var info = [String: String]()
info["name"] = "andrew"
info["city"] = "berlin"
info["job"] = "developer"
info["hobby"] = "computer games"
```
Then
```
let keys = info.map { $0.key } //All keys mapped into an array.
let values = info.map { $0.value } //All values mapped into an array.
```

### compactMap
Similar to `map`, but resulting array *does not contain any nil values*. 
Example 1:
```
    let numbers = [42, 19, nil, 10]
    let ints = numbers.compactMap { $0 }
    print(ints) // [42, 19, 10]
```
Example 2:
```
    let numbers = ["42", "19", "notANumber"]
    let ints = numbers.compactMap { Int($0) }
    print(ints) // [42, 19]
```
    
### flatMap
flatMap is useful when *there are collections inside collections, and we want to merge them into one single collection*.

Example:
```
let marks = [[3, 4, 5], [2, 5, 3], [1, 2, 2], [5, 5, 4], [3, 5, 3]]
let allMarks = marks.flatMap { $0 }
print(allMarks)
// Prints [3, 4, 5, 2, 5, 3, 1, 2, 2, 5, 5, 4, 3, 5, 3]
```

### filter
This function will filter the elements of a collection based on a condition and produce a new one containing only those elements that satisfy the condition.

Example:
```
let numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]
let over10 = numbers.filter { $0 > 10 }
print(over10)
//Prints [15, 12, 17, 20, 11]
```

### reduce
The purpose of the reduce higher order function is to produce one value from the values of all elements in a collection

Example:
```
let numbers = [5, 3, 8, 4, 2]
let sumOfNumbers = numbers.reduce(0, { $0 + $1 }) 
print(sumOfNumbers) //Prints 22
```

### sorted
Sorting a collection’s data in ascending order is easy in Swift using the sorted() method as shown next:
```
    let toSort = [5, 3, 8, 2, 10]
    let sorted = toSort.sorted()
    print(sorted)
    // Prints [2, 3, 5, 8, 10]
```

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


## Protocols


## Extensions
**Pros:**
- Extensions add new functionality to an existing class, structure, or enumeration type.
- We can avoid subclassing if we use extensions.
- Combining extension with protocol (Protocol Extension), we can achieve abstract methods in swift.
- Extensions can conform protocols and thus it helps to keep organized code.

**Cons:** 
- Extensions can add new functionality to a type, but they cannot override existing functionality
- Extensions can add new computed properties, but they cannot add stored properties, or add property observers to existing properties
	
### Why `isEmpty` prefferred over `count == 0` ?
Time Complexity of length calculation depends on collection types. 
For `String` type, `count == 0` will loop through all over UTF-8 contents (which is O(n)). Rather `isEmpty` will check `startIndex == endIndex`.
For `Set` type, both expressions are same complex 0(1)
Standard implementation of isEmpty is :
	```
	extension Collection {
    		var isEmpty: Bool { startIndex == endIndex } // not as we imagined count == 0
	}
	```
