// LeetCode: https://leetcode.com/problems/combination-sum-ii/description/

import XCTest

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var output: [[Int]] = []
        let current: [Int] = []
        let sorted = candidates.sorted()
        helper(sorted, target, current, &output)
        return output
    }
    
    func helper(_ candidates: [Int], _ target: Int, _ current: [Int], _ output: inout [[Int]]) {
        if target <= 0 {
            if target == 0 {
                output.append(current)
            }
            return
        }
        
        if candidates.count == 0 {
            return
        }
        
        var prev: Int?
        for (index, num) in candidates.enumerated() {
            if num > target {
                continue
            }
            
            if let prev = prev, prev == num {
                continue
            }
            var temp = Array(candidates[index..<candidates.count])
            var new = current
            new.append(temp.remove(at: 0))
            helper(temp, target - num, new, &output)
            prev = num
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([10,1,2,7,6,1,5], 8)
        let expected = [
            [1, 7],
            [1, 2, 5],
            [2, 6],
            [1, 1, 6]
        ]
        let output = s.combinationSum2(input.0, input.1)
        
        XCTAssertEqual(output.count, expected.count)
        for arr in output {
            XCTAssertTrue(expected.contains(arr))
        }
    }
    
    func testSample2() {
        let input = ([2,5,2,1,2], 5)
        let expected = [
            [1,2,2],
            [5]
        ]
        let output = s.combinationSum2(input.0, input.1)
        
        XCTAssertEqual(output.count, expected.count)
        for arr in output {
            XCTAssertTrue(expected.contains(arr))
        }
    }
}

Tests.defaultTestSuite.run()
