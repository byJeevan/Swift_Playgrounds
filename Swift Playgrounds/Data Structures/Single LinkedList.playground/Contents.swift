/*
 * Singly linked list (Generic) implementation.
 * Actions : Head & Trail, Print, isEmpty, Total, Append,
 * References :
 //https://www.journaldev.com/20995/swift-linked-list
 //https://itnext.io/linkedlist-in-swift-code-a-linkedlist-data-structure-in-swift-playgrounds-97fe2ed9b8f1
 */

class Node {
    var value:Int?
    var next:Node? //Note: do not consider 'weak' reference
    
    init(value:Int) {
        self.value = value
    }
}

class LinkedList {
    var head:Node? // head is nil when list is empty
    
    public var isEmpty:Bool {
        return head == nil
    }
    
    public var first:Node? {
        return head
    }
    
    public var last: Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
        
    public var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    public func node(atIndex index: Int) -> Node {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil { //
                    break
                }
            }
            return node!
        }
    }
    
    //MARK:- Print nodes
    public func printList() {
        var current:Node? = first
        while current != nil {
            print("\t \(String(describing: current!.value!)) \t")
            current = current?.next
        }
    }
 
    //MARK:- Insert node
    //To add a new Node to the END of the list
    public func append(value:Int) {
        let newNode = Node(value: value)
        //When the next reference of h is nil, it means we are at the end of the LinkedList.
        if let lastNode = last {
            lastNode.next = newNode
        }
        else{
            head = newNode
        }
    }
    
    //To insert Node at a POSTION
    public func insert(value:Int, at pos:Int){
        let newNode = Node(value: value)
        
        if pos == 0 {
            newNode.next = head
            head = newNode
        }
        else {
            var previous = head
            var current = head
            //travel until position found
            for _ in 0..<pos {
                previous = current
                current = current?.next
            }
            
            newNode.next = previous?.next
            previous?.next = newNode
        }
        
    }
    
    //MARK:- Delete nodes
    public func remove(at index: Int) {
        if (head == nil) { return }

        var temp = head

        // if head to be removed
        if index == 0{
            head = temp?.next
            return
        }
        
        // Find previous node of the node to be deleted
        for _ in 0..<index-1 {
            temp = temp?.next
        }
     
        // If position is more than number of nodes
        if temp == nil || temp?.next == nil { return }
        
        // Node temp->next is the node to be deleted
        // Store pointer to the next of node to be deleted
        let next = temp?.next?.next
        temp?.next = next
    }
 
    
}



let ll = LinkedList()
ll.append(value: 3)
ll.append(value: 4)
ll.append(value: 5)
ll.insert(value: 1, at: 0)
ll.insert(value: 2, at: 1)
ll.printList()
debugPrint("Total nodes \(ll.count)")
ll.remove(at: 2)
ll.printList()
debugPrint("Total nodes \(ll.count)")
