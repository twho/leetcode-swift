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
    
    public init(_ val: Int, left: Int, right: Int) {
        self.val = val
        self.left = TreeNode(left)
        self.right = TreeNode(right)
    }
}

// Initiate a binary tree
/**
        1
      /   \
     2     3
    / \   / \
   4   5 6   7
 */
let left = TreeNode(2, left: 4, right: 5)
let right = TreeNode(3, left: 6, right: 7)
let root = TreeNode(1)
root.left = left
root.right = right

// Pre-order traversal
// Result should be: [1, 2, 4, 5, 3, 6, 7]
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var results: [Int] = []
    guard let root = root else { return results }
    results.append(root.val)
    
    if let left = root.left {
        results.append(contentsOf: preorderTraversal(left))
    }
    
    if let right = root.right {
        results.append(contentsOf: preorderTraversal(right))
    }
    return results
}

// Post-order traversal
// Result should be: [4, 5, 2, 6, 7, 3, 1]
func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var results: [Int] = []
    guard let root = root else { return results }
    
    if let left = root.left {
        results.append(contentsOf: postorderTraversal(left))
    }
    
    if let right = root.right {
        results.append(contentsOf: postorderTraversal(right))
    }
    results.append(root.val)
    return results
}

// Inorder traversal
// Result should be: [4, 2, 5, 1, 6, 3, 7]
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var results: [Int] = []
    guard let root = root else { return results }
    
    if let left = root.left {
        results.append(contentsOf: inorderTraversal(left))
    }
    
    results.append(root.val)
    
    if let right = root.right {
        results.append(contentsOf: inorderTraversal(right))
    }
    
    return results
}

class Tests: XCTestCase {
    func testPreOrderTraversal() {
        let expected = [1, 2, 4, 5, 3, 6, 7]
        XCTAssertEqual(preorderTraversal(root), expected)
    }
    
    func testPostOrderTraversal() {
        let expected = [4, 5, 2, 6, 7, 3, 1]
        XCTAssertEqual(postorderTraversal(root), expected)
    }
    
    func testInOrderTraversal() {
        let expected = [4, 2, 5, 1, 6, 3, 7]
        XCTAssertEqual(inorderTraversal(root), expected)
    }
}

Tests.defaultTestSuite.run()
