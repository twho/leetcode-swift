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
        guard let root = root else { return }
        
        if let left = root.left {
            let right = root.right
            root.right = left
            
            // Find the right-most node in left's subtree
            var tracker = left
            while let moreRight = tracker.right {
                tracker = moreRight
            }
            tracker.right = right
            root.left = nil
            flatten(root.right)
        } else {
            flatten(root.right)
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = convertArrToTree([1, 2, 5, 3, 4, nil, 6])
        s.flatten(input)
        let expected = convertArrToTree([1,
                                         nil, 2,
                                         nil, nil, nil, 3,
                                         nil, nil, nil, nil, nil, nil, nil, 4,
                                         nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 5,
                                         nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 6])
        var expectOutput = [Int]()
        var resultOutput = [Int]()
        inOrder(expected, &expectOutput)
        inOrder(input, &resultOutput)
        XCTAssertEqual(expectOutput, resultOutput)
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
        guard let root = root else { return }
        
        if index < arr.count {
            if index*2+1 < arr.count, let leftVal = arr[index*2+1]{
                root.left = TreeNode(leftVal)
                convert(index*2+1, root.left, arr)
            }
            
            if index*2+2 < arr.count, let rightVal = arr[index*2+2] {
                root.right = TreeNode(rightVal)
                convert(index*2+2, root.right, arr)
            }
        }
    }
    
    private func inOrder(_ root: TreeNode?, _ output: inout [Int]) {
        guard let root = root else { return }
        
        inOrder(root.left, &output)
        output.append(root.val)
        inOrder(root.right, &output)
    }
}

Tests.defaultTestSuite.run()
