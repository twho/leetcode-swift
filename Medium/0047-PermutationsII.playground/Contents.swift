// LeetCode: https://leetcode.com/problems/permutations-ii/description/
// Mind time complexity

import XCTest

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var output: [[Int]] = []
        let current: [Int] = []
        let sorted = nums.sorted()
        permuteUnique(sorted, current, &output)
        return output
    }
    
    private func permuteUnique(_ nums: [Int], _ current: [Int], _ output: inout [[Int]]) {
        if nums.count == 0, !output.contains(current) {
            output.append(current)
            return
        }
        var idx = 0
        while idx < nums.count {
            if idx - 1 >= 0, nums[idx] == nums[idx-1] {
                idx += 1
                continue
            }
            var temp = current
            temp.append(nums[idx])
            var tempNum = nums
            tempNum.remove(at: idx)
            permuteUnique(tempNum, temp, &output)
            idx += 1
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [1,1,2]
        let expected = [
            [1,1,2],
            [1,2,1],
            [2,1,1]
        ]
        let output = s.permuteUnique(input)
        XCTAssertEqual(output.count, expected.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
}

Tests.defaultTestSuite.run()
