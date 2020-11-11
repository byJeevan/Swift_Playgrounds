## Grand Central Dispatch (GCD)
- GCD is a library that provides a low-level and object-based API to run tasks concurrently while managing threads behind the scenes. 

### Dispatch Queues
- A dispatch queue is responsible for executing a task in the FIFO order.
- **Serial Dispatch Queue** A serial dispatch queue runs tasks one at a time.
- **Main Dispatch Queue** A globally available serial queue that executes tasks on the application’s main thread. *All UI related task must run on this queue.*
- **Concurrent (Global) Dispatch Queue** A concurrent dispatch queue runs as many tasks as it can without waiting for the started tasks to finish.

#### When to use Serial Queue ?
- Serial queues are often used to synchronize access to a specific value or resource to prevent data races to occur.

#### What is a data race?
A data race can occur when multiple threads access the same memory without synchronization and at least one access is a write. You could be reading values from an array from the main thread while a background thread is adding new values to that same array.

