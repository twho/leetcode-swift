// LeetCode: https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/

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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard inorder.count > 0, inorder.count == postorder.count else { return nil }
        return helper(inorder, iStart: 0, iEnd: inorder.count-1, postorder, pStart: 0, pEnd: postorder.count-1)
    }
    
    private func helper(_ inorder: [Int], iStart: Int, iEnd: Int, _ postorder: [Int], pStart: Int, pEnd: Int) -> TreeNode? {
        guard iStart <= iEnd || pStart <= pEnd else { return nil }
        
        let mid = searchInorder(inorder: inorder, value: postorder[pEnd], start: iStart, end: iEnd)
        
        let root = TreeNode(postorder[pEnd])
        root.left = helper(inorder, iStart: iStart, iEnd: mid - 1, postorder, pStart: pStart, pEnd: pStart + mid - iStart - 1)
        root.right = helper(inorder, iStart: mid + 1, iEnd: iEnd, postorder, pStart: pStart, pEnd: pEnd - 1)
        return root
    }
    
    private func searchInorder(inorder: [Int], value: Int, start: Int, end: Int) -> Int {
        for i in start...end {
            if inorder[i] == value {
                return i
            }
        }
        return 0
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        
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
