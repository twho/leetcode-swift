// Leetcode: https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/

import XCTest

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard head != nil else {
            return nil
        }
        
        let root = TreeNode(-1)
        let arr = convertLinkedListToArray(head)
        helper(root, arr, 0, arr.count-1)
        return root
    }
    
    private func helper(_ node: TreeNode?, _ arr: [Int], _ start: Int, _ end: Int) {
        guard start >= 0, end < arr.count, start <= end else {
            return
        }
        
        let mid = (end+start)/2
        node?.val = arr[mid]
        
        if mid >= start, start <= mid-1 {
            node?.left = TreeNode(-1)
            helper(node?.left, arr, start, mid-1)
        }
        
        if mid+1 <= end, mid+1 <= end {
            node?.right = TreeNode(-1)
            helper(node?.right, arr, mid+1, end)
        }
    }
    
    private func convertLinkedListToArray(_ head: ListNode?) -> [Int] {
        var output = [Int]()
        var node = head
        while node != nil {
            output.append((node?.val)!)
            node = node?.next
        }
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [-10,-3,0,5,9]
        let expected = [0, -3, 9, -10, nil, 5]
        var output = [Int?]()
        preOrder(s.sortedListToBST(convertArrayToLinkedList(input)), &output)
        XCTAssertEqual(output, expected)
    }
    
    private func convertArrayToLinkedList(_ arr: [Int]) -> ListNode? {
        guard arr.count > 0 else { return nil }
        guard arr.count > 1 else { return ListNode(arr[0]) }
        
        let head: ListNode? = ListNode(arr[0])
        var node = head
        for i in 1..<arr.count {
            node?.next = ListNode(arr[i])
            node = node?.next
        }
        return head
    }
    
    // Incorrect preorder traversal
    private func preOrder(_ node: TreeNode?, _ output: inout [Int?]) {
        guard let node = node else { return }
        
        output.append(node.val)
        if let left = node.left {
            preOrder(left, &output)
        } else {
            output.append(nil)
        }
        
        if let right = node.right {
            preOrder(right, &output)
        } else {
            output.append(nil)
        }
    }
}

Tests.defaultTestSuite.run()
