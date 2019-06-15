// LeetCode: https://leetcode.com/problems/house-robber-iii/

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
    func rob(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var arr = [Int]()
        helper(root, 0, &arr)
        var last = 0
        var last2 = 0
        for i in 0..<arr.count {
            arr[i] = max(last, arr[i]+last2)
            (last, last2) = (arr[i], last)
        }
        
        return arr[arr.count-1]
    }
    
    private func helper(_ root: TreeNode?, _ level: Int, _ arr: inout [Int]) {
        guard let root = root else { return }
        if level < arr.count {
            arr[level] += root.val
        } else {
            arr.append(root.val)
        }
        helper(root.left, level + 1, &arr)
        helper(root.right, level + 1, &arr)
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = buildTree([
            3,
            2, 3,
            nil, 3, nil, 1
            ])
        let expected = 7
        XCTAssertEqual(expected, s.rob(input))
    }
    
    func testSample2() {
        let input = buildTree([
            3,
            4, 5,
            1, 3, nil, 1
            ])
        let expected = 9
        XCTAssertEqual(expected, s.rob(input))
    }
    
    func testSample3() {
        let input = buildTree([
            2,
            1, 3,
            nil, 4, nil, nil
            ])
        let expected = 7
        XCTAssertEqual(expected, s.rob(input))
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
