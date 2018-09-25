// LeetCode: https://leetcode.com/problems/merge-sorted-array/description/

import XCTest

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        nums1 = (Array(nums1[0..<m]) + Array(nums2[0..<n])).sorted()
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample() {
        var nums1 = [1,2,3,0,0,0]
        let nums2 = [2,5,6]
        let m = 3
        let n = 3
        let expected = [1,2,2,3,5,6]
        s.merge(&nums1, m, nums2, n)
        XCTAssertEqual(nums1, expected)
    }
}

Tests.defaultTestSuite.run()
