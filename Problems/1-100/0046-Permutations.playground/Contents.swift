// LeetCode: https://leetcode.com/problems/permutations/description/

import XCTest

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var output: [[Int]] = []
        var nums = nums
        var start: [Int] = []
        appendPermute(nums.count, &nums, &start, output: &output)
        return output
    }
    
    func appendPermute(_ count: Int, _ nums: inout [Int], _ current: inout [Int], output: inout [[Int]]) {
        if current.count == count, !output.contains(current) {
            output.append(current)
            return
        }
        
        for (idx, num) in nums.enumerated() {
            var temp = nums
            var tempCurrent = current
            tempCurrent.append(num)
            temp.remove(at: idx)
            appendPermute(count, &temp, &tempCurrent, output: &output)
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [1,2,3]
        let expected = [
            [1,2,3],
            [1,3,2],
            [2,1,3],
            [2,3,1],
            [3,1,2],
            [3,2,1]
        ]
        XCTAssertEqual(Set(s.permute(input)), Set(expected))
    }
}

Tests.defaultTestSuite.run()
