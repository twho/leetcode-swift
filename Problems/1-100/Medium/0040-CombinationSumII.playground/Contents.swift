// LeetCode: https://leetcode.com/problems/combination-sum-ii/description/

import XCTest

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sorted = candidates.sorted()
        var output = [[Int]]()
        let current = [Int]()
        helper(sorted, 0, current, target, &output)
        return output
    }
    
    private func helper(_ candidates: [Int], _ startIdx: Int, _ current: [Int], _ target: Int, _ output: inout [[Int]]) {
        if target == 0 {
            output.append(current)
            return
        }
        
        if target <= 0 || startIdx >= candidates.count {
            return
        }
        for i in startIdx..<candidates.count {
            if i > startIdx, i-1 >= 0, candidates[i-1] == candidates[i] {
                continue
            }
            var temp = current
            temp.append(candidates[i])
            helper(candidates, i+1, temp, target-candidates[i], &output)
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
