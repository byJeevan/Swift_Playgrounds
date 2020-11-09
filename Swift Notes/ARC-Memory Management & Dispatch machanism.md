### Stack Memory
- When a function creates a variable, the stack stores that variable and is destroyed when the function exits. 
- Variables allocated on the stack are stored directly to the memory (LIFO order) and access to this memory is very fast.

### Heap Memory
- The heap is generally a large pool of memory from which the system can request and dynamically allocate blocks of memory. The heap doesn’t automatically destroy its object like the stack does.
- *Reference count is tracked by the ARC* and when it becomes zero, the object is deallocated. Hence, the overall process (allocation , tracking the references and deallocation) is slower compared to stack.
**- If the value type instance is part of a class instance, the value is stored in the heap along with the class instance.**

> Stack is used for static memory allocation and Heap for dynamic memory allocation, both stored in the computer’s RAM 

## ARC (Automatic Reference Counting)
- Memory management machanism that efficiantly allocates and deallocate memory space of class instances, constants and variables.

### ARC Strong Reference Cycles Class Instances

### ARC Strong Reference Cycles Closures


## Strong vs Weak vs Unowned : 
- When a property is being created, by default the reference is `strong` unless they are declared `weak` or `unowned`. 
- ARC will increment Reference Count by one for strong reference.

### weak
- ARC will not increment reference count for weak reference. Hence a weak object will be present in memory until some one hold with strong reference.
- Automatically becomes nil when the referenced object deinitializes.
- *A weak reference is always optional.* Weak reference are always declared as optional types because the value of the variable can be set to nil. ARC automatically sets weak reference to nil when the instance is deallocated.
Eg : `weak var owner: Person?`
 
### unowned
- Unowned expects an owner (pointer reference) after deallocation. It never becomes nil.
- Comes in two flavours - unowned(safe) and unowned(unsafe). It's equivalent to assign and unsafe_unretained from Objective-C.

### Unowned vs Weak
- A `weak` reference is always optional and automatically becomes nil when the referenced object deinitializes. 
- A `unowned` variable must not be an optional and ARC will not set to nil when the referenced object deinitializes.

## Dispatch Machanism
### Dynamic dispatch 
- *Dynamic dispatch* happen at runtime with the help of a virtual table.
- Every language has its own mechanisms to support dynamic dispatch. Swift provides 2 ways to achieve dynamism: table dispatch and message dispatch.

### Static dispatch
- Compile time dispatches are called *static dispatches* or sometimes called *direct dispatch*
- Static dispatch is greate because of its performance. That is why Swift is swift (as compared to Objective-C, a dynamic language).

#### Table dispatch
- With this method, a class is associated with a so-called `virtual table` which comprises an array of function pointers to the real implementation correponding to that class.(?)
- the vtable is constructed at compile time. Thus, there are only two additional instructions (read and jump) as compared to static dispatch. So the dispatch should be theoretically pretty fast.

#### Message dispatch
- It is Objective-C mechanism (referred as `message passing`) and Swift code just uses the Objective-C runtime `lib`.
- Every time an Objective-C method is called, the invocation is passed to `objc_msgSend` which handles the look ups. Technically, the process starts from the given class and iterates the class hierarchy to pull out the implementation.
- Unlike table dispatch, the message passing dictionary could be modified at runtime, enabling us to adjust the program behaviors while running a.k.a `Method swizzling`.
- This mechanism is a keystone of Cocoa frameworks. Looking at the source of code Swift, you will see that KVO is implemented using swizzling.
- While message dispatch seems to be less performant, it offers great flexibility enabling a bunch of cool techniques.
  
 ### Trivial cases
 - First of all, *functions of structs or any value types must be statically dispatched*. This makes sense because they could never be overriden.
 - Explicitly enforced:
    * Functions with `final` keyword are also statically dispatched.
    * Functions with `dynamic` are invoked via message passing. Piror to Swift 4, a function with dynamic modifier is implicitly visible to Objective-C. Meanwhile Swift 4 requires you to explicitly declare it with `@objc` attribute.
- Ordinary extensions (without `final`, `dynamic`, `@objc`) are directly dispatched. 
- **Final Keyword is memory efficient :** Final key ensures that the class or method cannot be overridden. Thus it will switch Dynamic dispatch (slowest) to Static dispatch (Faster).
- Direct dispatch is prioritized.
- If overriding is needed, table dispatch is the next candidate.
- Need both overriding and visibility to Objective-C? Then message dispatch.
