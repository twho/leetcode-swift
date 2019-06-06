// LeetCode-Problem 112: https://leetcode.com/problems/path-sum/description/
// LeetCode-Problem 113: https://leetcode.com/problems/path-sum-ii/description/

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
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        if let left = root.left, let right = root.right {
            return hasPathSum(left, sum-root.val) || hasPathSum(right, sum-root.val)
        } else if let right = root.right {
            return hasPathSum(right, sum-root.val)
        } else if let left = root.left {
            return hasPathSum(left, sum-root.val)
        } else {
            return root.val == sum
        }
    }
}
