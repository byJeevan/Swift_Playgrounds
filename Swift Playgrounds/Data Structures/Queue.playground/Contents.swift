
/*
 * Queue implemenation in swift (FIFO)
 */

struct Queue {
    var elements:[Int] = []
    
    mutating func enqueue(_ element:Int) {
        print("Add \(element) into queue.")
        elements.append(element) //Added after last element
    }
    
    mutating func dequeue() -> Int? {
       let removed = elements.removeFirst() //Removed First element
        print("Removed \(removed) from queue.")
        return removed
    }
    
    func printQueue() {
        print(elements)
    }
}

var pizzaQueue = Queue.init()

pizzaQueue.enqueue(10)
pizzaQueue.enqueue(11)
pizzaQueue.enqueue(12)
pizzaQueue.printQueue()
pizzaQueue.dequeue()
pizzaQueue.printQueue()
pizzaQueue.enqueue(13)
pizzaQueue.printQueue()


