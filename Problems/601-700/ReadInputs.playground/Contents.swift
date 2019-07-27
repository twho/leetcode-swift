// LeetCode: https://leetcode.com/problems/redundant-connection-ii/

import XCTest

// There are implicitly three wrong situations:
// #1. HAS 2-parent, NO cycle;
// #2. NO 2-parent, HAS cycle;
// #3. HAS 2-parent, HAS cycle;
class Solution {
    var parents = [Int: Int]()
    var candidate1 = [-1, -1]
    var candidate2 = [-1, -1]
    
    func findRedundantDirectedConnection(_ edges: [[Int]]) -> [Int] {
        var edges = edges
        // #1. HAS 2-parent
        for i in 0..<edges.count {
            let parent = edges[i][0]
            let child = edges[i][1]
            if let existedParent = parents[child] {
                candidate1 = [existedParent, child]
                candidate2 = edges[i]
                edges[i][1] = -1
            } else {
                parents[child] = parent
            }
        }
        parents = [Int: Int]()
        var foundEdge: [Int]?
        for edge in edges {
            guard edge[1] != -1 else { continue }
            if let foundEdge = union(edge[0], edge[1]) {
                return foundEdge
            }
        }
        // If we reach this point, that means we previously invalidated the corrent "wrong" edge and there is no cycle,
        // which is situation #1, just return candidate2.
        return candidate2
    }
    
    private func union(_ x: Int, _ y: Int) -> [Int]? {
        let xParent = find(x)
        let yParent = find(y)
        guard xParent != yParent else {
            if candidate1[0] == -1 {
                return [x, y]
            } else {
                return candidate1
            }
        }
        parents[yParent] = xParent
        return nil
    }
    
    private func find(_ x: Int) -> Int {
        if parents[x] == nil { return x }
        return find(parents[x]!)
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        
    }
}

Tests.defaultTestSuite.run()
