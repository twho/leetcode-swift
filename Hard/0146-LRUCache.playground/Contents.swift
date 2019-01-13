// LeetCode: https://leetcode.com/problems/lru-cache/

import XCTest

// Use doubly linked list.
class Node {
    var val: Int
    var key: Int
    var pre: Node?
    var next: Node?
    
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class LRU {
    var capacity: Int
    var dataCount: Int
    var map = [Int:Node]()
    var head: Node?
    var tail: Node?
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head = Node(-1, -1)
        tail = Node(-1, -1)
        head?.next = tail
        tail?.pre = head
        dataCount = 0
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
    
    private func deleteNode(_ node: Node?) {
        node?.pre?.next = node?.next
        node?.next?.pre = node?.pre
    }
    
    private func moveToHead(_ node: Node?) {
        node?.next = head?.next
        head?.next?.pre = node
        head?.next = node
        node?.pre = head
    }
    
    func put(_ key: Int, _ val: Int) {
        if let existNode = map[key] {
            existNode.key = key
            existNode.val = val
            deleteNode(existNode)
            moveToHead(existNode)
        } else {
            if dataCount == capacity {
                if let last = tail?.pre {
                    map[last.key] = nil
                    deleteNode(last)
                }
                dataCount -= 1
            }
            
            let node = Node(key, val)
            map[key] = node
            moveToHead(node)
            dataCount += 1
        }
    }
}

class Tests: XCTestCase {
    
    func test1() {
        let cache = LRU(2)
        
        cache.put(1, 1)
        cache.put(2, 2)
        XCTAssertEqual(cache.get(1), 1)
        
        cache.put(3, 3)
        XCTAssertEqual(cache.get(2), -1) // (not found)
        
        cache.put(4, 4)
        XCTAssertEqual(cache.get(1), -1) // (not found)
        XCTAssertEqual(cache.get(3), 3)
        XCTAssertEqual(cache.get(4), 4)
    }
    
    func test2() {
        let cache = LRU(2)
        
        cache.put(2, 1)
        cache.put(1, 1)
        cache.put(2, 3)
        cache.put(4, 1)
        XCTAssertEqual(cache.get(1), -1)
        XCTAssertEqual(cache.get(2), 3)
    }
}

Tests.defaultTestSuite.run()
