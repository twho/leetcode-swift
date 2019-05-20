// Leetcode: https://leetcode.com/problems/flatten-binary-tree-to-linked-list/

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
    func flatten(_ root: TreeNode?) {
        
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = convertArrToTree([1, 2, 5, 3, 4, nil, 6])
    }
    
    private func convertArrToTree(_ arr: [Int?]) -> TreeNode? {
        guard arr.count > 0 else {
            return nil
        }
        let root = TreeNode(arr[0]!)
        convert(0, root, arr)
        return root
    }
    
    private func convert(_ index: Int, _ root: TreeNode?, _ arr: [Int?]) {
        guard let root = root, index*2 + 2 < arr.count else { return }
        
        if let leftVal = arr[index*2+1] {
            root.left = TreeNode(leftVal)
            convert(index*2+1, root.left, arr)
        }
        
        if let rightVal = arr[index*2+2] {
            root.right = TreeNode(rightVal)
            convert(index*2+2, root.right, arr)
        }
    }
}

Tests.defaultTestSuite.run()
