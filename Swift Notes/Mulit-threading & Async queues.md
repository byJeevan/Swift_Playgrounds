## Grand Central Dispatch (GCD)
- GCD is a library that provides a low-level and object-based API to run tasks concurrently while managing threads behind the scenes. 
- Dispatch Queues, A dispatch queue is responsible for executing a task in the first-in, first-out order.
- Serial Dispatch Queue A serial dispatch queue runs tasks one at a time.
- Concurrent (Global) Dispatch Queue A concurrent dispatch queue runs as many tasks as it can without waiting for the started tasks to finish.
- Main Dispatch Queue A globally available serial queue that executes tasks on the application’s main thread.
