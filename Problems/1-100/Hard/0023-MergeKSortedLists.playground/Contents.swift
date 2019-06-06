// LeetCode: https://leetcode.com/problems/merge-k-sorted-lists/description/

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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var arr = [Int]()
        
        for head in lists {
            var node = head
            while node != nil {
                arr.append((node?.val)!)
                node = node?.next
            }
        }
        arr = arr.sorted()
        return toLinkedList(arr)
    }
    
    private func toLinkedList(_ arr: [Int]) -> ListNode? {
        guard arr.count > 0 else {
            return nil
        }
        guard arr.count > 1 else {
            return ListNode(arr[0])
        }
        let head = ListNode(arr[0])
        var node: ListNode? = ListNode(arr[1])
        head.next = node
        var index = 1
        while index + 1 < arr.count {
            node?.next = ListNode(arr[index+1])
            node = node?.next
            index += 1
        }
        return head
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input: [ListNode?] = [
            arrayToLinkedList([1,4,5]),
            arrayToLinkedList([1,3,4]),
            arrayToLinkedList([2,6])
        ]
        var output = s.mergeKLists(input)
        var expected = arrayToLinkedList([1,1,2,3,4,4,5,6])
        while expected != nil {
            XCTAssertEqual(expected?.val, output?.val)
            output = expected?.next
            expected = expected?.next
        }
    }
    
    private func arrayToLinkedList(_ arr: [Int]) -> ListNode? {
        guard arr.count > 0 else {
            return nil
        }
        guard arr.count > 1 else {
            return ListNode(arr[0])
        }
        let head = ListNode(arr[0])
        var node: ListNode? = ListNode(arr[1])
        head.next = node
        var index = 1
        while index + 1 < arr.count {
            node?.next = ListNode(arr[index+1])
            node = node?.next
            index += 1
        }
        return head
    }
}

Tests.defaultTestSuite.run()
