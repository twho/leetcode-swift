// LeetCode: https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/
// Swift is not compiled on LeetCode

import XCTest

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        var arr: [ListNode] = []
        var node: ListNode? = head
        while node != nil {
            arr.append(node!)
            node = node?.next
        }
        if arr.count - n - 1 >= 0 {
            if arr.count - n + 1 < arr.count {
                arr[arr.count - n - 1].next = arr[arr.count - n + 1]
            } else {
                arr[arr.count - n - 1].next = nil
            }
        }
        arr.remove(at: arr.count - n)
        if arr.count == 0 {
            return nil
        }
        return arr[0]
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([1, 2, 3, 4, 5], 2)
        let expected = [1, 2, 3, 5]
        let output = s.removeNthFromEnd(convertArrayToListNodeHead(input.0), input.1)
        XCTAssertEqual(convertListNodeToArray(output), expected)
    }
    
    func testSample2() {
        let input = ([1, 2, 3], 1)
        let expected = [1, 2]
        let output = s.removeNthFromEnd(convertArrayToListNodeHead(input.0), input.1)
        XCTAssertEqual(convertListNodeToArray(output), expected)
    }
    
    func testSample3() {
        let input = ([1], 1)
        let expected: [Int] = []
        let output = s.removeNthFromEnd(convertArrayToListNodeHead(input.0), input.1)
        XCTAssertEqual(convertListNodeToArray(output), expected)
    }
    
    func testSample4() {
        let input = ([1, 2], 2)
        let expected = [2]
        let output = s.removeNthFromEnd(convertArrayToListNodeHead(input.0), input.1)
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
