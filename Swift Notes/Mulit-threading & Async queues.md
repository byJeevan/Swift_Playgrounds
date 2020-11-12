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
