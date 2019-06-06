// Leetcode: https://leetcode.com/problems/binary-tree-right-side-view/

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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var output = [Int]()
        guard let root = root else {
            return output
        }
        
        helper(0, root, &output)
        return output
    }
    
    private func helper(_ level: Int, _ root: TreeNode?, _ output: inout [Int]) {
        guard let root = root else {
            return
        }
        
        if output.count < level+1 {
            output.append(root.val)
        } else {
            output[level] = root.val
        }
        
        if let left = root.left {
            helper(level+1, left, &output)
        }
        
        if let right = root.right {
            helper(level+1, right, &output)
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input: [Int?] = [1,2,3,nil,5,nil,4]
        let tree = convertLevelOrderArrToTree(input)
        
        let expected = [1, 3, 4]
        let output = s.rightSideView(tree)
        XCTAssertEqual(s.rightSideView(tree).count, expected.count)
        for i in 0..<output.count {
            XCTAssertEqual(output[i], expected[i])
        }
    }
    
    private func convertLevelOrderArrToTree(_ arr: [Int?]) -> TreeNode? {
        var root: TreeNode? = TreeNode(-1)
        let tree = insertLevelOrder(arr, &root, 0)
        return root
    }
    
    private func insertLevelOrder(_ arr: [Int?], _ root: inout TreeNode?, _ i: Int) -> TreeNode? {
        guard arr.count > 0 else {
            return nil
        }
        
        if i < arr.count {
            if arr[i] == nil {
                return nil
            }
            
            root = TreeNode(arr[i]!)
            
            // insert left child
            var left = root?.left
            root?.left = insertLevelOrder(arr, &left, i*2 + 1)
            
            // insert right child
            var right = root?.right
            root?.right = insertLevelOrder(arr, &right, i*2 + 2)
        }
        
        return root
    }
}

Tests.defaultTestSuite.run()
