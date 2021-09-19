### Dangling Pointer
- A pointer whose object has been destroyed.
- Solution : After de-allocating memory, initialise pointer to NULL so that pointer will be no longer dangling.

### Memory Leak
- An object without pointer is useless, it is occupying memory. But not other object can event get a reference to it. 
- An object fails to go out of existence when no other objects exists that have a pointer to it. Possibly crashing with`EXC_BAD_ACCESS` error.

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

### Mechanisms iOS does provide to support multi-threading ?
* GCD
* NSOperationQueue
* NSThread

## Grand Central Dispatch (GCD)
- GCD is a library that provides a low-level and object-based API to run tasks concurrently while managing threads behind the scenes. 
- Is not just a new abstraction around what we've already been using, it's an entire new underlying mechanism that makes multithreading easier and makes it easy to be as concurrent as your code can be without worrying about the variables like how much work your CPU cores are doing, how many CPU cores you have and how much threads you should spawn in response. You just use the Grand Central Dispatch API's and it handles the work of doing the appropriate amount of work. - - It's included in libSystem.dylib and all you need to do is include #import <dispatch/dispatch.h> in your app and you'll be able to take advantage of Grand
Central Dispatch.

### Dispatch Queues
- A dispatch queue is responsible for executing a task in the FIFO order.
- **Serial Dispatch Queue** A serial dispatch queue runs tasks one at a time.
- **Main Dispatch Queue** A globally available serial queue that executes tasks on the application’s main thread. *All UI related task must run on this queue.*
- **Concurrent (Global) Dispatch Queue** A concurrent dispatch queue runs as many tasks as it can without waiting for the started tasks to finish.

#### When to use Serial Queue ?
- Serial queues are often used to synchronize access to a specific value or resource to prevent data races to occur.

#### What is a data race ?
A data race can occur when multiple threads access the same memory without synchronization and at least one access is a write. You could be reading values from an array from the main thread while a background thread is adding new values to that same array.

## NSOperationQueue
- `NSOperationQueue` creates pool of threads and used to execute NSOperations parallel. The class regulates the execution of a set of NSOperation objects. An operation queue is generally used to perform some asynchronous operations on a background thread so as not to block the main thread.

### Thread-Safe
- Thread safe code can be safely called from multiple threads or concurrent tasks without causing any problems (data corruption, crashing, etc). Code that is not thread safe must only be run in one context at a time.
- An example of thread safe code is NSArray. You can use it from multiple threads at the same time without issue. On the other hand, NSMutableArray is not thread safe and should only be accessed from one thread at a time.

### Context Switch
- A context switch is the process of storing and restoring execution state (context) of a process or thread, when we switch between executing different threads on a single core (single process). So that the execution can be resumed from the same point at a later time. This enables multiple processes to share a single CPU and is an essential feature of a multitasking operating system. It’s like switching from one thread (process) to another.

### Concurrency Operations
- Operations can be configured to run a block of code synchronously or asynchronously. Place them in operation queue (NSOperationQueue example) to avail concurrency.
Cocoa provides three different types of operations:
- Block operations : These facilitate the execution of one or more block objects.
- Invocation operations :These allow you to invoke a method in another, currently existing object.
- Plain operations :These are plain operation classes that need to be subclassed. The code to be executed will be written inside the main method of the operation object.
