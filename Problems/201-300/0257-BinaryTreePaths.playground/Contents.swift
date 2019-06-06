// LeetCode: https://leetcode.com/problems/binary-tree-paths/

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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var output = [String]()
        binaryTreePaths(root, "", &output)
        return output
    }
    
    private func binaryTreePaths(_ root: TreeNode?, _ current: String, _ output: inout [String]) {
        guard let root = root else { return }
        
        var temp = current
        temp += "\(root.val)"
        
        if root.left == nil, root.right == nil {
            output.append(temp)
        }
        
        if root.left != nil || root.right != nil {
            temp += "->"
            
            if root.left != nil {
                binaryTreePaths(root.left, temp, &output)
            }
            
            if root.right != nil {
                binaryTreePaths(root.right, temp, &output)
            }
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = contructTree([
            1,
            2, 3,
            nil, 5, nil, nil
            ])
        let expected: [String] = ["1->2->5", "1->3"]
        let output = s.binaryTreePaths(input)
        XCTAssertEqual(expected.count, output.count)
        print(output)
        output.forEach {
            XCTAssertTrue(expected.contains($0))
        }
    }
    
    private func contructTree(_ arr: [Int?]) -> TreeNode? {
        guard arr.count > 0, let first = arr[0] else { return nil }
        let root = TreeNode(first)
        constructTreeLevelOrder(0, root, arr)
        return root
    }
    
    private func constructTreeLevelOrder(_ index: Int, _ root: TreeNode?, _ arr: [Int?]) {
        guard let root = root else { return }
        if index < arr.count {
            if 2*index+1 < arr.count, let val = arr[2*index+1] {
                root.left = TreeNode(val)
                constructTreeLevelOrder(2*index+1, root.left, arr)
            }
            if 2*index+2 < arr.count, let val = arr[2*index+2] {
                root.right = TreeNode(val)
                constructTreeLevelOrder(2*index+2, root.right, arr)
            }
        }
    }
}

Tests.defaultTestSuite.run()
