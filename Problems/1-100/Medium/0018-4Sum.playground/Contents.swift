// LeetCode: https://leetcode.com/problems/4sum/description/
// Difficulty: Medium
// O(n^3) is acceptable

import XCTest

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var output: [[Int]] = []
        let sorted = nums.sorted()
        for idx1 in 0..<sorted.count {
            for idx2 in idx1+1..<sorted.count {
                var start = idx2 + 1
                var end = sorted.count - 1
                while start < end {
                    let sum = sorted[idx1] + sorted[idx2] + sorted[start] + sorted[end]
                    if sum == target, !output.contains([sorted[idx1], sorted[idx2], sorted[start], sorted[end]].sorted()) {
                        output.append([sorted[idx1], sorted[idx2], sorted[start], sorted[end]].sorted())
                        start += 1
                        end -= 1
                        while start < end, sorted[start] == sorted[start - 1] {
                            start += 1
                        }
                        while start < end, sorted[end] == sorted[end + 1] {
                            end -= 1
                        }
                    } else if sum < target {
                        start += 1
                    } else {
                        end -= 1
                    }
                }
            }
        }
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([1, 0, -1, 0, -2, 2], 0)
        let expected = [
            [-1,  0, 0, 1],
            [-2, -1, 1, 2],
            [-2,  0, 0, 2]
        ]
        let output = s.fourSum(input.0, input.1)
        XCTAssertEqual(output.count, expected.count)
        for i in output {
            XCTAssertTrue(expected.contains(i))
        }
    }
    
    func testSample2() {
        let input = ([-1, 0, -5, -2, -2, -4, 0, 1, -2], -9)
        let expected = [
            [-5,-4,-1,1],
            [-5,-4,0,0],
            [-5,-2,-2,0],
            [-4,-2,-2,-1]
        ]
        let output = s.fourSum(input.0, input.1)
        XCTAssertEqual(output.count, expected.count)
        for i in output {
            XCTAssertTrue(expected.contains(i))
        }
    }
    
    func testSample3() {
        let input = ([0, 0, 0, 0], 0)
        let expected = [
            [0, 0, 0, 0]
        ]
        let output = s.fourSum(input.0, input.1)
        XCTAssertEqual(output.count, expected.count)
        for i in output {
            XCTAssertTrue(expected.contains(i))
        }
    }
    
    func testSample4() {
        let input = ([-3,-2,-1,0,0,1,2,3], 0)
        let expected = [
            [-3, -2, 2, 3],
            [-3, -1, 1, 3],
            [-3, 0, 0, 3],
            [-3, 0, 1, 2],
            [-2, -1, 0, 3],
            [-2, -1, 1, 2],
            [-2, 0, 0, 2],
            [-1, 0, 0, 1]
        ]
        let output = s.fourSum(input.0, input.1)
        XCTAssertEqual(output.count, expected.count)
        for i in output {
            XCTAssertTrue(expected.contains(i))
        }
    }
}

Tests.defaultTestSuite.run()
