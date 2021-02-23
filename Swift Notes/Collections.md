
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

