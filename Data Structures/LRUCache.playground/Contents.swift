// LRU Cache
// Design and implement a data structure for Least Recently Used (LRU) cache.
// It should support the following operations: get and put.

import XCTest

class LRU {
    var capacity: Int
    var count = 0
    var head: Node?
    var tail: Node?
    var map = [Int:Node]()
    
    init(_ capacity: Int) {
        self.capacity = capacity
        tail = Node(-1, -1)
        head = Node(-1, -1)
        head?.next = tail
        tail?.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = map[key] {
            deleteNode(node)
            moveToHead(node)
            return node.val
        } else {
            return -1
        }
    }
    
    // Method to manipulate linked list
    func moveToHead(_ node: Node?) {
        node?.prev = head
        head?.next = node
        node?.next = head?.next
        head?.next?.prev = node
    }
    
    // Method to delete a node in linked list
    func deleteNode(_ node: Node?) {
        node?.prev?.next = node?.next
        node?.next?.prev = node?.prev
    }
    
    func put(_ key: Int, _ val: Int) {
        if let node = map[key] {
            node.key = key
            node.val = val
            deleteNode(node)
            moveToHead(node)
        } else {
            if count == capacity, let last = tail?.prev {
                deleteNode(last)
                map[last.key] = nil
                count -= 1
            }
            let new = Node(key, val)
            map[key] = new
            moveToHead(new)
            count += 1
        }
    }
}

// Node for doubly linked list
class Node {
    var key: Int
    var val: Int
    var next: Node?
    var prev: Node?
    
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class Tests: XCTestCase {
    
}
