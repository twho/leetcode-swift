// LeetCode: https://leetcode.com/problems/set-matrix-zeroes/

import XCTest

class Solution {
    // Dumb solution beats 97.22%
    func setZeroes(_ matrix: inout [[Int]]) {
        guard matrix.count > 0 else { return }
        
        var row = Array(repeating: false, count: matrix.count)
        var column = Array(repeating: false, count: matrix[0].count)
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                if matrix[i][j] == 0 {
                    row[i] = true
                    column[j] = true
                }
            }
        }
        for i in 0..<matrix.count {
            if row[i] {
                matrix[i] = Array(repeating: 0, count: matrix[i].count)
            }
        }
        
        for j in 0..<matrix[0].count {
            if column[j] {
                for i in 0..<matrix.count {
                    matrix[i][j] = 0
                }
            }
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        var input = [
            [1,1,1],
            [1,0,1],
            [1,1,1]
        ]
        let expected = [
            [1,0,1],
            [0,0,0],
            [1,0,1]
        ]
        s.setZeroes(&input)
        XCTAssertEqual(expected, input)
    }
    
    func testSample2() {
        var input = [
            [0,1,2,0],
            [3,4,5,2],
            [1,3,1,5]
        ]
        let expected = [
            [0,0,0,0],
            [0,4,5,0],
            [0,3,1,0]
        ]
        s.setZeroes(&input)
        XCTAssertEqual(expected, input)
    }
}

Tests.defaultTestSuite.run()
