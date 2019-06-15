// LeetCode: https://leetcode.com/problems/combination-sum-iv/

import XCTest

class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var arr = Array(repeating: 0, count: 1 + target)
        arr[0] = 1
        
        for i in 1..<arr.count {
            for num in nums {
                if num <= i {
                    arr[i] += arr[i-num]
                } else {
                    break
                }
            }
        }
        return arr[target]
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([1, 2, 3], 4)
        let expected = 7
        XCTAssertEqual(expected, s.combinationSum4(input.0, input.1))
    }
    
    func testSample2() {
        let input = ([1, 2, 3], 32)
        let expected = 181997601
        XCTAssertEqual(expected, s.combinationSum4(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
