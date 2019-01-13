// LeetCode: https://leetcode.com/problems/3sum/description/
// Hint: Start from TwoSum, use sorting, O(n) is allowed in runtime

import XCTest

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        
        var output = [[Int]]()
        var sort = nums.sorted()
        
        for index in 0..<sort.count - 2 {
            if index > 0, sort[index] == sort[index-1] {
                continue
            }
            var left = index + 1
            var right = sort.count - 1
            while left < right {
                if sort[left] + sort[right] + sort[index] == 0 {
                    output.append([sort[index], sort[left], sort[right]])
                    
                    left += 1
                    right -= 1
                    while left < right, sort[left] == sort[left - 1] {
                        left += 1
                    }
                    while left < right, sort[right] == sort[right + 1] {
                        right -= 1
                    }
                } else if sort[left] + sort[right] + sort[index] < 0 {
                    left += 1
                } else {
                    right -= 1
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
