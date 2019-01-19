// Leetcode: https://leetcode.com/problems/partition-list/

import XCTest

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// Two cursors
class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        guard head != nil else {
            return nil
        }
        
        var node = head
        var leftHead = ListNode(-1)
        var rightHead = ListNode(-1)
        var left: ListNode? = leftHead
        var right: ListNode? = rightHead
        
        while node != nil {
            if (node?.val)! < x {
                left?.next = node
                left = node
            } else {
                right?.next = node
                right = node
            }
            node = node?.next
        }
        
        right?.next = nil
        left?.next = rightHead.next
        
        return leftHead.next
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = convertArrToLinkedList([1, 4, 3, 2, 5, 2])
        var expected = convertArrToLinkedList([1, 2, 2, 4, 3, 5])
        var output = s.partition(input, 3)
        
        while expected != nil || output != nil {
            XCTAssertEqual(output?.val, expected?.val)
            output = output?.next
            expected = expected?.next
        }
    }
    
    func testSample2() {
        let input = convertArrToLinkedList([1, 1])
        var expected = convertArrToLinkedList([1, 1])
        var output = s.partition(input, 2)

        while expected != nil || output != nil {
            XCTAssertEqual(output?.val, expected?.val)
            output = output?.next
            expected = expected?.next
        }
    }
    
    func testSample3() {
        let input = convertArrToLinkedList([2, 1])
        var expected = convertArrToLinkedList([1, 2])
        var output = s.partition(input, 2)
        
        while expected != nil || output != nil {
            XCTAssertEqual(output?.val, expected?.val)
            output = output?.next
            expected = expected?.next
        }
    }
    
    func testSample4() {
        let input = convertArrToLinkedList([2, 1, 3])
        var expected = convertArrToLinkedList([1, 2, 3])
        var output = s.partition(input, 2)
        
        while expected != nil || output != nil {
            XCTAssertEqual(output?.val, expected?.val)
            output = output?.next
            expected = expected?.next
        }
    }
    
    func convertArrToLinkedList(_ arr: [Int]) -> ListNode? {
        guard arr.count > 0 else {
            return nil
        }
        let head: ListNode? = ListNode(arr[0])
        var node: ListNode? = head
        var index = 1
        
        while index < arr.count {
            node?.next = ListNode(arr[index])
            index += 1
            node = node?.next
        }
        
        return head
    }
    
    func convertLinkedListToArray(_ head: ListNode?) -> [Int] {
        var output = [Int]()
        guard head != nil else {
            return output
        }
        
        var node = head
        while node != nil {
            output.append((node?.val)!)
            node = node?.next
        }
        return output
    }
}

Tests.defaultTestSuite.run()
