// LeetCode: https://leetcode.com/problems/validate-binary-search-tree/

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
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return helper(root)
    }
    
    func helper(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        var result1 = true
        if let left = root.left {
            if left.val >= root.val {
                return false
            }
            result1 = helper(left)
        }
        var result2 = true
        if let right = root.right {
            if right.val <= root.val {
                return false
            }
            result2 = helper(right)
        }
        return result1 && result2
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func convertArrayToTree(_ array: [Int?]) -> TreeNode{
        for i in array {
            
        }
    }
}
