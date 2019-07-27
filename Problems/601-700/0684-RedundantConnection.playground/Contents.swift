// LeetCode: https://leetcode.com/problems/redundant-connection/

import XCTest

class Solution {
    // There are implicitly three wrong situations:
    // #1. HAS 2-parent, NO cycle;
    // #2. NO 2-parent, HAS cycle;
    // #3. HAS 2-parent, HAS cycle;
    
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var map = [Int: [Int]]()
        for edge in edges {
            var visisted = Set<Int>()
            if dfs(edge[0], edge[1], map, &visisted) {
                return edge
            }
            if map[edge[0]] != nil {
                map[edge[0]]!.append(edge[1])
            } else {
                map[edge[0]] = [edge[1]]
            }
            if map[edge[1]] != nil {
                map[edge[1]]!.append(edge[0])
            } else {
                map[edge[1]] = [edge[0]]
            }
        }
        return []
    }
    
    private func dfs(_ start: Int, _ dest: Int, _ map: [Int: [Int]], _ visited: inout Set<Int>) -> Bool {
        if start == dest {
            return true
        }
        visited.insert(start)
        if let edges = map[start] {
            for next in edges {
                if !visited.contains(next) {
                    if dfs(next, dest, map, &visited) {
                        return true
                    }
                }
                
            }
        }
        return false
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [[1,2], [1,3], [2,3]]
        let expected = [2, 3]
        XCTAssertEqual(expected, s.findRedundantConnection(input))
    }
    
    func testSample2() {
        let input = [[1,2], [2,3], [3,4], [1,4], [1,5]]
        let expected = [1, 4]
        XCTAssertEqual(expected, s.findRedundantConnection(input))
    }
}

Tests.defaultTestSuite.run()
