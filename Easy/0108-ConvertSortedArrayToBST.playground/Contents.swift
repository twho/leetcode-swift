// LeetCode: https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/description/

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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard  nums.count > 0 else {
            return nil
        }
        guard  nums.count > 1 else {
            return TreeNode(nums[0])
        }
        let mid = nums.count/2
        var root = TreeNode(nums[mid])
        insertFromArray(root, nums)
        return root
    }
    
    private func insertFromArray(_ root: TreeNode, _ arr: [Int]) {
        let mid = arr.count/2
        if root.left == nil, mid-1 >= 0 {
            let leftArr = Array(arr[0...mid-1])
            
            if leftArr.count > 0 {
                root.left = TreeNode(leftArr[leftArr.count/2])
                
                if leftArr.count - 1 > 0 {
                    insertFromArray(root.left!, leftArr)
                }
            }
        }
        
        if root.right == nil, mid+1 < arr.count {
            let rightArr = Array(arr[mid+1..<arr.count])
            
            if rightArr.count > 0 {
                root.right = TreeNode(rightArr[rightArr.count/2])
                
                if rightArr.count - 1 > 0 {
                    insertFromArray(root.right!, rightArr)
                }
            }
        }
    }
    
    func converTreeToArr() -> [Int?] {
        var arr: [Int?] = []
        
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        
    }
}

Tests.defaultTestSuite.run()
