// LeetCode: https://leetcode.com/problems/reverse-nodes-in-k-group/description/

import XCTest

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var node = head
        var movHead = head
        var pre: ListNode?
        var newHead: ListNode? = head
        var idx = 1
        
        while node != nil {
            let next = node?.next
            if idx % k == 0 {
                let pair = reverseLinkedList(movHead, k)
                if pre != nil {
                    pre?.next = pair.first
                } else {
                    newHead = pair.first
                }
                
                // Updates
                pre = pair.last
                pair.last?.next = next
                movHead = pair.last?.next
               
            }
            idx += 1
            node = next
        }
        return newHead
    }
    
    // Input first node of LinkedList and returns the last node of the new LinkedList
    private func reverseLinkedList(_ head: ListNode? ,_ k: Int) -> (first: ListNode?, last: ListNode?) {
        var node = head
        var pre: ListNode?
        var idx = 1
        
        while node != nil {
            let next = node?.next
            node?.next = pre
            pre = node
            if idx >= k { break }
            node = next
            idx += 1
        }
        return (pre, head)
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([1, 2, 3, 4, 5], 2)
        let expected = [2, 1, 4, 3, 5]
        let output = s.reverseKGroup(convertArrayToListNodeHead(input.0), input.1)
        XCTAssertEqual(convertListNodeToArray(output), expected)
    }
    
    func testSample2() {
        let input = ([1, 2, 3, 4, 5], 3)
        let expected = [3, 2, 1, 4, 5]
        let output = s.reverseKGroup(convertArrayToListNodeHead(input.0), input.1)
        XCTAssertEqual(convertListNodeToArray(output), expected)
    }
    
    func testSample3() {
        let input = ([1], 2)
        let expected = [1]
        let output = s.reverseKGroup(convertArrayToListNodeHead(input.0), input.1)
        XCTAssertEqual(convertListNodeToArray(output), expected)
    }
    
    func convertArrayToListNodeHead(_ arr: [Int]) -> ListNode? {
        guard arr.count > 0 else {
            return nil
        }
        var arrNodes: [ListNode] = []
        for i in 0..<arr.count {
            let node = ListNode(arr[i])
            arrNodes.append(node)
            if i - 1 >= 0 {
                arrNodes[i-1].next = node
            }
        }
        return arrNodes.first
    }
    
    func convertListNodeToArray(_ head: ListNode?) -> [Int] {
        var arr: [Int] = []
        var node = head
        while node != nil {
            arr.append((node?.val)!)
            node = node?.next
        }
        return arr
    }
}

Tests.defaultTestSuite.run()
