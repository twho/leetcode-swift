// LeetCode: https://leetcode.com/problems/contains-duplicate-iii/description/

import XCTest

class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard t >= 0 else { return false }
        var dict: [Int:Int] = [:]
        for (idx, num) in nums.enumerated() {
            let upper = max(num-t, num+t)
            let lower = min(num-t, num+t)
            for num in dict.keys {
                if (num <= upper && num >= lower), idx - dict[num]! <= k {
                    return true
                }
            }
            dict[num] = idx
        }
        return false
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([1,2,3,1], 3, 0)
        XCTAssertTrue(s.containsNearbyAlmostDuplicate(input.0, input.1, input.2))
    }
    
    func testSample2() {
        let input = ([1,0,1,1], 1, 2)
        XCTAssertTrue(s.containsNearbyAlmostDuplicate(input.0, input.1, input.2))
    }

    func testSample3() {
        let input = ([1,5,9,1,5,9], 2, 3)
        XCTAssertFalse(s.containsNearbyAlmostDuplicate(input.0, input.1, input.2))
    }

    func testSample4() {
        let input = ([-1,-1], 1, -1)
        XCTAssertFalse(s.containsNearbyAlmostDuplicate(input.0, input.1, input.2))
    }

    func testSample5() {
        let input = ([1,2], 1, -1)
        XCTAssertFalse(s.containsNearbyAlmostDuplicate(input.0, input.1, input.2))
    }
}

Tests.defaultTestSuite.run()
