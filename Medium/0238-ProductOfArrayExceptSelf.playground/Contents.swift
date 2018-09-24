// LeetCode: https://leetcode.com/problems/product-of-array-except-self/description/

import XCTest

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var zeroCount = 0
        var sum = 1
        for i in nums {
            if i != 0 {
                sum = sum * i
            } else {
                zeroCount += 1
            }
        }
        if zeroCount > 1 {
            return nums.map { _ in 0 }
        } else if zeroCount == 1 {
            return nums.map { $0 == 0 ? sum : 0 }
        } else {
            return nums.map { sum / $0 }
        }
    }
}

class Tests: XCTestCase {
    let solution = Solution()
    
    func testSample1() {
        let input = [1, 2, 3, 4]
        let expected = [24, 12, 8, 6]
        XCTAssertEqual(solution.productExceptSelf(input), expected)
    }
    
    func testSample2() {
        let input = [0, 0]
        let expected = [0, 0]
        XCTAssertEqual(solution.productExceptSelf(input), expected)
    }
}

Tests.defaultTestSuite.run()
