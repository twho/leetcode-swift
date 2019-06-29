// LeetCode:

import XCTest

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false }
        if matrix.count < 2 {
            return matrix[0].contains(target)
        }
        var start1 = 0
        var end1 = matrix.count-1
        while start1 <= end1 {
            let mid = start1 + (end1-start1)/2
            if matrix[mid][0] == target {
                return true
            } else if matrix[mid][0] > target {
                end1 = mid - 1
            } else {
                start1 = mid + 1
            }
        }
        
        guard end1 >= 0 else { return false }
        
        var start2 = 0
        var end2 = matrix[end1].count - 1
        while start2 < end2 {
            let mid = start2 + (end2-start2)/2
            if matrix[end1][mid] == target {
                return true
            } else if target > matrix[end1][mid]  {
                start2 = mid + 1
            } else {
                end2 = mid - 1
            }
        }
        return matrix[end1][start2] == target
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
            ], 11)
        let expected = true
        XCTAssertEqual(s.searchMatrix(input.0, input.1), expected)
    }

    func testSample3() {
        let input = ([
            [1,   3,  5,  7],
            [10, 11, 16, 20],
            [23, 30, 34, 50]
            ], 13)
        let expected = false
        XCTAssertEqual(s.searchMatrix(input.0, input.1), expected)
    }

    func testSample4() {
        let input = ([[1], [3]], 0)
        let expected = false
        XCTAssertEqual(s.searchMatrix(input.0, input.1), expected)
    }
    
    func testSample5() {
        let input = ([[1], [3], [5]], 5)
        let expected = true
        XCTAssertEqual(s.searchMatrix(input.0, input.1), expected)
    }
}

Tests.defaultTestSuite.run()
