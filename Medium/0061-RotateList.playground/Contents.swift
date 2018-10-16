// LeetCode: https://leetcode.com/problems/rotate-list/description/

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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else {
            return nil
        }
        var arr: [ListNode] = []
        var node = head
        while node != nil {
            arr.append(node!)
            node = node?.next
        }
        
        guard k % arr.count != 0 else {
            return head
        }
        
        let newK = k % arr.count
        for _ in 1...newK {
            let first = arr.first
            let last = arr.removeLast()
            arr.insert(last, at: 0)
            last.next = first
            arr.last?.next = nil
        }
        return arr.first
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([1, 2, 3, 4, 5], 2)
        let expected = [4, 5, 1, 2, 3]
        let output = s.rotateRight(convertArrayToListNodeHead(input.0), input.1)
        XCTAssertEqual(convertListNodeToArray(output), expected)
    }
    
    func testSample2() {
        let input = ([0, 1, 2], 4)
        let expected = [2, 0 ,1]
        let output = s.rotateRight(convertArrayToListNodeHead(input.0), input.1)
        XCTAssertEqual(convertListNodeToArray(output), expected)
    }
    
    func testSample3() {
        let empty: [Int] = []
        let input = (empty, 0)
        let expected = empty
        let output = s.rotateRight(convertArrayToListNodeHead(input.0), input.1)
        XCTAssertEqual(convertListNodeToArray(output), expected)
    }
    
    func testSample4() {
        let input = ([1], 0)
        let expected = [1]
        let output = s.rotateRight(convertArrayToListNodeHead(input.0), input.1)
        XCTAssertEqual(convertListNodeToArray(output), expected)
    }
    
    func testSample5() {
        let input = ([1], 99)
        let expected = [1]
        let output = s.rotateRight(convertArrayToListNodeHead(input.0), input.1)
        XCTAssertEqual(convertListNodeToArray(output), expected)
    }
    
    func testSample6() {
        let input = ([1, 2], 2)
        let expected = [1, 2]
        let output = s.rotateRight(convertArrayToListNodeHead(input.0), input.1)
        XCTAssertEqual(convertListNodeToArray(output), expected)
    }
    
    func testSample7() {
        let input = ([1, 2], 1)
        let expected = [2, 1]
        let output = s.rotateRight(convertArrayToListNodeHead(input.0), input.1)
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
