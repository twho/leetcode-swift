// LeetCode: https://leetcode.com/problems/symmetric-tree/

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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        var arr = [Int?]()
        inOrder(root, &arr)
        
        if arr.count%2 == 0 {
            return false
        } else {
            for i in 0..<arr.count/2 {
                if arr[i] != arr[arr.count-1-i] {
                    return false
                }
            }
        }
        return true
    }
    
    private func inOrder(_ root: TreeNode?, _ arr: inout [Int?]) {
        if root?.left == nil, root?.right == nil {
            arr.append(root?.val)
            return
        }
        inOrder(root?.left, &arr)
        arr.append(root?.val)
        inOrder(root?.right, &arr)
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = buildTree([
            1,
            2, 2,
            3, 4, 4, 3
            ])
        XCTAssertTrue(s.isSymmetric(input))
    }
    
    func testSample2() {
        let input = buildTree([
            1,
            2, 2,
            2, nil, 2
            ])
        XCTAssertFalse(s.isSymmetric(input))
    }
    
    func testSample3() {
        let input = buildTree([
            5,
            4,1,
            nil,1,nil,4,
            2,nil,2,nil
            ])
        XCTAssertFalse(s.isSymmetric(input))
    }
    
    private func buildTree(_ arr: [Int?]) -> TreeNode? {
        guard arr.count > 0, let first = arr[0] else { return nil }
        let root = TreeNode(first)
        buildTree(0, root, arr)
        return root
    }
    
    private func buildTree(_ index: Int, _ root: TreeNode?, _ arr: [Int?]) {
        guard let root = root else { return }
        
        if index < arr.count {
            if 2*index+1 < arr.count, let val = arr[2*index+1] {
                root.left = TreeNode(val)
                buildTree(2*index+1, root.left, arr)
            }
            
            if 2*index+2 < arr.count, let val = arr[2*index+2] {
                root.right = TreeNode(val)
                buildTree(2*index+2, root.right, arr)
            }
        }
    }
}

Tests.defaultTestSuite.run()
