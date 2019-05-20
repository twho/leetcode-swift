// Leetcode: https://leetcode.com/problems/count-complete-tree-nodes/

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
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var count = 1
        var last: Int? = root.val
        helper(1, root.left, &last, &count)
        helper(1, root.right, &last, &count)
        return count
    }
    
    private func helper(_ level: Int, _ node: TreeNode?, _ last: inout Int?, _ count: inout Int) {
        guard let node = node else { return }
        
        if last == nil {
            return
        }
        count += 1
        last = node.val
        helper(level+1, node.left, &last, &count)
        helper(level+1, node.right, &last, &count)
    }
}

class Tests: XCTestCase {
    let s = Solution()
}
