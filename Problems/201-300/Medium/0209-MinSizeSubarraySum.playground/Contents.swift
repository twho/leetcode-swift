// LeetCode: https://leetcode.com/problems/minimum-size-subarray-sum/

import XCTest

// First solution, figure out O(n) solution
class Solution1 {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        return -1
    }
}

// Second solution, figure out O(n logn) solution
class Solution2 {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var sums = nums
        for i in 0..<nums.count {
            if i - 1 >= 0 {
                sums[i] += sums[i-1]
            }
        }
        
        var start = 0
        var end = 0
        var length = sums.count
        var hasResult = false
        for i in 0..<sums.count {
            let idx = sums.count - 1 - i
            let current = sums[idx]
            
            if s > current {
                break
            } else if current >= s {
                hasResult = true
                length = min(length, idx+1)
            }
            
            let startIdx = binarySearch(sums, current - s, idx-1)
            if startIdx < 0 {
                continue
            }
            hasResult = true
            length = min(length, idx - startIdx)
        }
        return hasResult ? length : 0
    }
    
    private func binarySearch(_ sums: [Int], _ target: Int, _ endIdx: Int) -> Int {
        var start = 0
        var end = endIdx
    
        while start <= end {
            let mid = start + (end-start)/2
            if sums[mid] == target {
                return mid
            } else if sums[mid] > target {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        if end >= 0 {
            start = min(end, start)
        }
        
        return sums[start] <= target ? start : -1
    }
}

class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()
    
    func testSample1() {
        let input = (7, [2,3,1,2,4,3])
        let expected = 2
        XCTAssertEqual(expected, s2.minSubArrayLen(input.0, input.1))
    }

    func testSample2() {
        let input = (11, [1,2,3,4,5])
        let expected = 3
        XCTAssertEqual(expected, s2.minSubArrayLen(input.0, input.1))
    }

    func testSample3() {
        let input = (15, [1,2,3,4,5])
        let expected = 5
        XCTAssertEqual(expected, s2.minSubArrayLen(input.0, input.1))
    }

    func testSample4() {
        let input = (15, [5,1,3,5,10,7,4,9,2,8])
        let expected = 2
        XCTAssertEqual(expected, s2.minSubArrayLen(input.0, input.1))
    }

    func testSample5() {
        let input = (3, [1,1])
        let expected = 0
        XCTAssertEqual(expected, s2.minSubArrayLen(input.0, input.1))
    }
    
    func testSample6() {
        let input = (20, [2,16,14,15])
        let expected = 2
        XCTAssertEqual(expected, s2.minSubArrayLen(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
