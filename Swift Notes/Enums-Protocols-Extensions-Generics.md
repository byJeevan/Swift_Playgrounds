## Protocols

## Enums (Tj.Veens - Swift in Depth)
- Enums are sometimes an alternative to subclassing, allowing for a flexible architecture.
- Enums give you the ability to catch problems at compile time instead of runtime.
- You can use enums to group properties together.
- Enums are sometimes called sum types, based on algebraic data types.
- Structs can be distributed over enums.
- When working with enum’s raw values, you forego catching problems at compile time.
- Handling strings can be made safer by converting them to enums.
- When converting a string to an enum, grouping cases and using a lowercased string makes conversion easier.”

## Extensions
**Pros:**
- Extensions add new functionality to an existing class, structure, or enumeration type.
- We can avoid subclassing if we use extensions.
- Combining extension with protocol (Protocol Extension), we can achieve abstract methods in swift.
- Extensions can conform protocols and thus it helps to keep organized code.

**Cons:** 
- Extensions can add new functionality to a type, but they cannot override existing functionality
- Extensions can add new computed properties, but they cannot add stored properties, or add property observers to existing properties

## Generics
- Collections are generic implementation under the hood : Swift collections (Array, Set and Dictionary) types are implemented as generic functions.
