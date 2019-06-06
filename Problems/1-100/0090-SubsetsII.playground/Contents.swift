// LeetCode: https://leetcode.com/problems/subsets-ii/description/

import XCTest

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        var output: [[Int]] = [[]]
        subsetsWithDup(&nums, &output)
        return output
    }
    
    func subsetsWithDup(_ nums: inout [Int], _ output: inout [[Int]]) {
        guard nums.count > 0 else {
            return
        }
        for o in output {
            var toAppend = o
            toAppend.append(nums[0])
            if !output.contains(toAppend.sorted()) {
                output.append(toAppend.sorted())
            }
        }
        nums.removeFirst()
        subsetsWithDup(&nums, &output)
    }
}

class Tests: XCTestCase {
    let s = Solution()
    func sampleTest1() {
        let input = [1,2,2]
        let expected = [
            [2],
            [1],
            [1,2,2],
            [2,2],
            [1,2],
            []
        ]
        let output = s.subsetsWithDup(input)
        XCTAssertEqual(input.count, output.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
    
    func sampleTest2() {
        let input = [4,4,4,1,4]
        let expected = [
            [],
            [4],
            [4,4],
            [4,4,4],
            [1],
            [4,1],
            [4,4,1],
            [4,4,4,1],
            [4,4,4,4],
            [1,4],
            [4,1,4],
            [4,4,1,4],
            [4,4,4,1,4]
        ]
        let output = s.subsetsWithDup(input)
        XCTAssertEqual(input.count, output.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
}

Tests.defaultTestSuite.run()
