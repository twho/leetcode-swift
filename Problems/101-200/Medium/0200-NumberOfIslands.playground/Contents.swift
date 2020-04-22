// LeetCode: https://leetcode.com/problems/number-of-islands/description/
// Hint: recursive/DFS

import XCTest

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        if grid.count == 0 {
            return 0
        }
        var count = 0
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" {
                    DFS(&grid, i, j)
                    count += 1
                }
            }
        }
        return count
    }
    
    private func DFS(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
        if grid[i][j] == "1" {
            grid[i][j] = "0"
            if i-1 >= 0, grid[i-1][j] == "1" {
                DFS(&grid, i-1, j)
            }
            if j-1 >= 0, grid[i][j-1] == "1" {
                DFS(&grid, i, j-1)
            }
            if i+1 < grid.count, grid[i+1][j] == "1" {
                DFS(&grid, i+1, j)
            }
            if j+1 < grid[i].count, grid[i][j+1] == "1" {
                DFS(&grid, i, j+1)
            }
        }
    }
}

class Tests: XCTestCase {
    let solution = Solution()
    
    func testNumberOfIslands1() {
        let input: [[Character]] = [
            ["1", "1", "0", "0", "0"],
            ["1", "1", "0", "0", "0"],
            ["0", "0", "1", "0", "0"],
            ["0", "0", "0", "1", "1"]
        ]
        let expected = 3
        XCTAssertEqual(expected, solution.numIslands(input))
    }
    
    func testNumberOfIslands2() {
        let input: [[Character]] =  [
            ["1", "1", "1", "1", "0"],
            ["1", "1", "0", "1", "0"],
            ["1", "1", "0", "0", "0"],
            ["0", "0", "0", "0", "0"]
        ]
        let expected = 1
        XCTAssertEqual(expected, solution.numIslands(input))
    }
    
    func testNumberOfIslands3() {
        let input: [[Character]] = [
            ["0", "0", "0", "0", "0"],
            ["0", "1", "1", "1", "0"],
            ["0", "0", "0", "0", "0"],
            ["0", "0", "0", "0", "0"]
        ]
        let expected = 1
        XCTAssertEqual(expected, solution.numIslands(input))
    }
}

Tests.defaultTestSuite.run()
