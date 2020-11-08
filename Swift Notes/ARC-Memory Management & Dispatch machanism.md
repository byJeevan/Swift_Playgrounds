## ARC
### Unowned vs Weak
- A weak reference is always optional and automatically becomes nil when the referenced object deinitializes.
Unowned expects an owner (pointer reference) after deallocation. It never becomes nil. Therefore the unowned variable must not be an optional. 
- For `weak` references, which are set to nil if the instance they reference is deallocated.
- Weak references are automatically set to nil once the object they point to gets deallocated
- Since a weak reference can be set to nil, it is always declared as an optional.
- `unowned` reference is always expected to have a value. which means - when the object deallocated, reference will 
- unowned comes in two flavours - unowned(safe) and unowned(unsafe). It's equivalent to assign and unsafe_unretained from Objective-C
- unowned - When a references object is deallocated(is nil), the unowned does not become a nil because ARC does not set it. That is why unowned reference is non-optional

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


### Principles
- Direct dispatch is prioritized.
- If overriding is needed, table dispatch is the next candidate.
- Need both overriding and visibility to Objective-C? Then message dispatch.
