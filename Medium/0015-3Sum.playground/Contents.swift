// LeetCode: https://leetcode.com/problems/3sum/description/
// Hint: Start from TwoSum, use sorting, O(n) is allowed in runtime

import XCTest

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        let sort = nums.sorted()
        var output: [[Int]] = []
        for i in 0..<sort.count - 2 {
            if i > 0, sort[i] == sort[i-1] {
                continue
            }
            var start = i + 1
            var end = sort.count - 1
            while start < end {
                if sort[i] + sort[start] + sort[end] == 0 {
                    output.append([sort[i], sort[start], sort[end]])
                    start += 1
                    end -= 1
                    while start < end, start - 1 >= 0, sort[start] == sort[start - 1] {
                        start += 1
                    }
                    while start < end, end + 1 < sort.count, sort[end] == sort[end + 1] {
                        end -= 1
                    }
                } else if sort[i] + sort[start] + sort[end] < 0 {
                    start += 1
                } else {
                    end -= 1
                }
            }
        }
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6]
        let expected = [
            [-4,-2,6],
            [-4,0,4],
            [-4,1,3],
            [-4,2,2],
            [-2,-2,4],
            [-2,0,2]
        ]
        let output = s.threeSum(input)
        XCTAssertEqual(output.count, expected.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
    
    func testSample2() {
        let input = [0,0,0]
        let expected = [[0,0,0]]
        let output = s.threeSum(input)
        XCTAssertEqual(output.count, expected.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
    
    func testSample3() {
        let input = [-2,0,1,1,2]
        let expected = [
            [-2,0,2],
            [-2,1,1]
        ]
        let output = s.threeSum(input)
        XCTAssertEqual(output.count, expected.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
    
    func testSample4() {
        let input = [3,0,-2,-1,1,2]
        let expected = [
            [-2, -1, 3],
            [-2, 0, 2],
            [-1, 0, 1]
        ]
        let output = s.threeSum(input)
        XCTAssertEqual(output.count, expected.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
    
    func testSample5() {
        let input = [-1,0,1,0]
        let expected = [[-1, 0, 1]]
        let output = s.threeSum(input)
        XCTAssertEqual(output.count, expected.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
    
    func testSample6() {
        let input = [-1, 0, 1, 2, -1, -4]
        let expected = [
            [-1, 0, 1],
            [-1, -1, 2]
        ]
        let output = s.threeSum(input)
        XCTAssertEqual(output.count, expected.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
}

Tests.defaultTestSuite.run()
