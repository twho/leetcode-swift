// LeetCode:

import XCTest

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false }
        if matrix.count < 2 {
            return matrix[0].contains(target)
        }
        var i = matrix.count/2
        var j = 0
        var upper: Int?
        while i < matrix.count, j < matrix[i].count {
            if target == matrix[i][j] {
                return true
            } else if target < matrix[i][j] {
                guard i > 0 else { return false }
                upper = i
                i = i/2
            } else {
                if j + 1 >= matrix[i].count, (upper == nil || i+1 < upper!) {
                    i += 1
                    j = 0
                } else {
                    j += 1
                }
            }
        }
        return false
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([
            [1,   3,  5,  7],
            [10, 11, 16, 20],
            [23, 30, 34, 50]
            ], 3)
        let expected = true
        XCTAssertEqual(s.searchMatrix(input.0, input.1), expected)
    }

    func testSample2() {
        let input = ([
            [1,   3,  5,  7],
            [10, 11, 16, 20],
            [23, 30, 34, 50]
            ], 13)
        let expected = false
        XCTAssertEqual(s.searchMatrix(input.0, input.1), expected)
    }

    func testSample3() {
        let input = ([[1], [3]], 0)
        let expected = false
        XCTAssertEqual(s.searchMatrix(input.0, input.1), expected)
    }
    
    func testSample4() {
        let input = ([[1], [3], [5]], 5)
        let expected = true
        XCTAssertEqual(s.searchMatrix(input.0, input.1), expected)
    }
}

Tests.defaultTestSuite.run()
