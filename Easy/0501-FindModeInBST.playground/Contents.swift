// LeetCode: https://leetcode.com/problems/find-mode-in-binary-search-tree/

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
    func findMode(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var dict: [Int:Int] = [:]
        var max = 0
        findMode(root, &dict, &max)
        
        var output = [Int]()
        for i in dict.keys {
            if let val = dict[i], val == max {
                output.append(i)
            }
        }
        return output
    }
    
    private func findMode(_ root: TreeNode, _ dict: inout [Int:Int], _ max: inout Int) {
        if let val = dict[root.val] {
            dict[root.val] = val + 1
            max = val + 1 > max ? val + 1 : max
        } else {
            dict[root.val] = 1
            max = 1 > max ? 1 : max
        }
        
        if let left = root.left {
            findMode(left, &dict, &max)
        }
        
        if let right = root.right {
            findMode(right, &dict, &max)
        }
    }
}
