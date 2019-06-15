// LeetCode: https://leetcode.com/problems/unique-paths-ii/

import XCTest

class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid.count > 0 else { return 0 }
        
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        var output = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        if obstacleGrid[0][0] == 1 {
            return 0
        }
        
        output[0][0] = 1
        
        for i in 0..<m {
            for j in 0..<n {
                if obstacleGrid[i][j] == 1 {
                    continue
                } else {
                    if i-1 >= 0 {
                        output[i][j] += output[i-1][j]
                    }
                    if j-1 >= 0 {
                        output[i][j] += output[i][j-1]
                    }
                }
            }
        }
        return output[m-1][n-1]
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [
            [0,0,0],
            [0,1,0],
            [0,0,0]
        ]
        let expected = 2
        XCTAssertEqual(expected, s.uniquePathsWithObstacles(input))
    }
    
    func testSample2() {
        let input = [[1]]
        let expected = 0
        XCTAssertEqual(expected, s.uniquePathsWithObstacles(input))
    }
}

Tests.defaultTestSuite.run()
