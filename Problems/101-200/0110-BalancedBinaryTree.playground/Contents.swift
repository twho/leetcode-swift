// Leetcode: https://leetcode.com/problems/balanced-binary-tree/

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
    func isBalanced(_ root: TreeNode?) -> Bool {
        return false
    }
    
    private func getTreeHeight(_ node: TreeNode?) {
        
    }
}

class Tests: XCTestCase {
    func testSample1() {
        let arr = [3, 9, 20, nil, nil, 15, 7]
        let root = convertArrToTree(arr)
        inOrderPrint(root)
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
    
    func inOrderPrint(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        if let left = root.left {
            inOrderPrint(left)
        }
        print(root.val)
        if let right = root.right {
            inOrderPrint(right)
        }
    }
}

Tests.defaultTestSuite.run()
