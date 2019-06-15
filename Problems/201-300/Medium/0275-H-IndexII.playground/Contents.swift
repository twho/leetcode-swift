// LeetCode: https://leetcode.com/problems/h-index-ii/
// Solve the problem in logarithmic time complexity

import XCTest

class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        var start = 0
        var end = citations.count-1
        var count = 0
        while start <= end {
            let mid = start + (end-start)/2
            let temp = citations.count - mid
            
            // The most optimized case, return it directly
            if citations[mid] == temp {
                return temp
            }
            if temp >= citations[mid] {
                let val = min(temp, citations[mid])
                count = max(val, count)
                start = mid + 1
            } else {
                count = max(temp, count)
                end = mid - 1
            }
        }
        return count
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [0,1,3,5,6]
        let expected = 3
        XCTAssertEqual(expected, s.hIndex(input))
    }

    func testSample2() {
        let input = [1,4,7,9]
        let expected = 3
        XCTAssertEqual(expected, s.hIndex(input))
    }

    func testSample3() {
        let input = [100]
        let expected = 1
        XCTAssertEqual(expected, s.hIndex(input))
    }

    func testSample4() {
        let input = [11, 15]
        let expected = 2
        XCTAssertEqual(expected, s.hIndex(input))
    }

    func testSample5() {
        let input = [0, 1]
        let expected = 1
        XCTAssertEqual(expected, s.hIndex(input))
    }

    func testSample6() {
        let input = [1,1,2,3,4,5,7]
        let expected = 3
        XCTAssertEqual(expected, s.hIndex(input))
    }

    func testSample7() {
        let input = [1,1,1,1,3,3,4,4,5,6,7,7,8,9,10]
        let expected = 6
        XCTAssertEqual(expected, s.hIndex(input))
    }
}

Tests.defaultTestSuite.run()
