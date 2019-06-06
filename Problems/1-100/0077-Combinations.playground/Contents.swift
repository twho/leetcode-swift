// LeetCode: https://leetcode.com/problems/combinations/description/
// Current - Runtime: 184 ms, faster than 100.00% of Swift online submissions for Combinations.

import XCTest

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var output = [[Int]]()
        guard n > 0, k > 0, n >= k else {
            return output
        }
        
        var i = n
        while i > 0 {
            if k == 1 {
                output.append([i])
            } else {
                for o in combine(i-1, k-1) {
                    output.append([i] + o)
                }
            }
            
            i -= 1
        }
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = (4, 2)
        let expected = [
            [2,4],
            [3,4],
            [2,3],
            [1,2],
            [1,3],
            [1,4],
        ]
        let output = s.combine(input.0, input.1)
        XCTAssertEqual(output.count, expected.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
}

Tests.defaultTestSuite.run()
