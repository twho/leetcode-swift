// Leetcode: https://leetcode.com/problems/sum-root-to-leaf-numbers/

import XCTest

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
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var output = 0
        helper(root, 0, &output)
        return output
    }
    
    private func helper(_ node: TreeNode?, _ current: Int, _ sum: inout Int) {
        guard let node = node else {
            return
        }
        
        let newCurrent = current*10 + node.val
        if node.left == nil, node.right == nil {
            sum += newCurrent
        } else {
            if let left = node.left {
                helper(left, newCurrent, &sum)
            }
            
            if let right = node.right {
                helper(right, newCurrent, &sum)
            }
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let arr = [1,2,3]
        var root: TreeNode? = TreeNode(-1)
        let tree = insertLevelOrder(arr, &root, 0)
        let expected = 25
        XCTAssertEqual(s.sumNumbers(tree), expected)
    }
    
    func testSample2() {
        let arr = [4,9,0,5,1]
        var root: TreeNode? = TreeNode(-1)
        let tree = insertLevelOrder(arr, &root, 0)
        let expected = 1026
        XCTAssertEqual(s.sumNumbers(tree), expected)
    }
    
    private func insertLevelOrder(_ arr: [Int], _ root: inout TreeNode?, _ i: Int) -> TreeNode? {
        if i < arr.count {
            root = TreeNode(arr[i])
            
            // insert left child
            var left = root?.left
            root?.left = insertLevelOrder(arr, &left, 2 * i + 1)
            
            // insert right child
            var right = root?.right
            root?.right = insertLevelOrder(arr, &right, 2 * i + 2)
        }
        
        return root
    }
    
    private func inOrder(_ root: TreeNode?) {
        if let root = root {
            inOrder(root.left)
            print("\(root.val) ")
            inOrder(root.right)
        }
    }
}

Tests.defaultTestSuite.run()
