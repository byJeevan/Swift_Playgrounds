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


## Grand Central Dispatch (GCD)
- GCD is a library that provides a low-level and object-based API to run tasks concurrently while managing threads behind the scenes. 
- Dispatch Queues, A dispatch queue is responsible for executing a task in the first-in, first-out order.
- Serial Dispatch Queue A serial dispatch queue runs tasks one at a time.
- Concurrent (Global) Dispatch Queue A concurrent dispatch queue runs as many tasks as it can without waiting for the started tasks to finish.
- Main Dispatch Queue A globally available serial queue that executes tasks on the application’s main thread.
