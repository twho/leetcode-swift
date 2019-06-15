// LeetCode: https://leetcode.com/problems/maximum-length-of-repeated-subarray/

import XCTest

class Solution {
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        if A.count == 0 || B.count == 0 {
            return 0
        }
        if A.count == 1, B.count == 1 {
            A == B ? 1 : 0
        }
        if A == B {
            return A.count
        }
        var length = min(A.count, B.count)
        while length > 0 {
            for idx1 in 0...A.count-length {
                for idx2 in 0...B.count-length {
                    if Array(A[idx1..<idx1+length]) == Array(B[idx2..<idx2+length]) {
                        return length
                    }
                }
            }
            length -= 1
        }
        return 0
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([1,2,3,2,1], [3,2,1,4,7])
        let expected = 3
        XCTAssertEqual(expected, s.findLength(input.0, input.1))
    }

    func testSample2() {
        let input = ([0,0,0,0,1], [1,0,0,0,0])
        let expected = 4
        XCTAssertEqual(expected, s.findLength(input.0, input.1))
    }

    func testSample3() {
        let input = ([1,0,0,0,1], [1,0,0,1,1])
        let expected = 3
        XCTAssertEqual(expected, s.findLength(input.0, input.1))
    }
    
    func testSample4() {
        let input = ([0,0,0,0,0,0,1,0,0,0], [0,0,0,0,0,0,0,1,0,0])
        let expected = 9
        XCTAssertEqual(expected, s.findLength(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
