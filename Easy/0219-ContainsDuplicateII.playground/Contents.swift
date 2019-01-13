// LeetCode: https://leetcode.com/problems/contains-duplicate-ii/description/

import XCTest

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict: [Int:Int] = [:]
        for (idx, num) in nums.enumerated() {
            if dict[num] != nil, idx - dict[num]! <= k {
                return true
            }
            dict[num] = idx
        }
        return false
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([1,2,3,1,2,3], 2)
        XCTAssertFalse(s.containsNearbyDuplicate(input.0, input.1))
    }
    
    func testSample2() {
        let input = ([1,0,1,1], 1)
        XCTAssertTrue(s.containsNearbyDuplicate(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
