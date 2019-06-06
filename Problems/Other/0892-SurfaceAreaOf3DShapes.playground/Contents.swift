// LeetCode: https://leetcode.com/problems/surface-area-of-3d-shapes/description/

import XCTest

class Solution {
    func surfaceArea(_ grid: [[Int]]) -> Int {
        var output = 0
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 0 {
                    continue
                }
                output += grid[i][j] * 4 + 2
                if i-1 >= 0 {
                    output -= min(grid[i][j], grid[i-1][j])
                }
                if i+1 < grid.count {
                    output -= min(grid[i][j], grid[i+1][j])
                }
                if j-1 >= 0 {
                    output -= min(grid[i][j], grid[i][j-1])
                }
                if j+1 < grid[i].count {
                    output -= min(grid[i][j], grid[i][j+1])
                }
            }
        }
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [[2]]
        let expected = 10
        XCTAssertEqual(s.surfaceArea(input), expected)
    }
    
    func testSample2() {
        let input = [[1,2],[3,4]]
        let expected = 34
        XCTAssertEqual(s.surfaceArea(input), expected)
    }
    
    func testSample3() {
        let input = [[1,0],[0,2]]
        let expected = 16
        XCTAssertEqual(s.surfaceArea(input), expected)
    }
    
    func testSample4() {
        let input = [[1,1,1],[1,0,1],[1,1,1]]
        let expected = 32
        XCTAssertEqual(s.surfaceArea(input), expected)
    }
    
    func testSample5() {
        let input = [[2,2,2],[2,1,2],[2,2,2]]
        let expected = 46
        XCTAssertEqual(s.surfaceArea(input), expected)
    }
}

Tests.defaultTestSuite.run()
