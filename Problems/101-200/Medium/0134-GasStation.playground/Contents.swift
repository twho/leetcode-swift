// LeetCode: https://leetcode.com/problems/gas-station/description/

import XCTest

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        // Handle edge case
        if gas.count == 1 {
            return gas[0] >= cost[0] ? 0 : -1
        }
        for g in 0..<gas.count {
            var enoughGas = true
            var current = 0
            for c in g..<g+cost.count {
                current += gas[c%gas.count] - cost[c%cost.count]
                if current < 0 {
                    enoughGas = false
                    break
                }
            }
            if enoughGas {
                return g
            }
        }
        return -1
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([1,2,3,4,5], [3,4,5,1,2])
        let expected = 3
        XCTAssertEqual(s.canCompleteCircuit(input.0, input.1), expected)
    }
    
    func testSample2() {
        let input = ([2,3,4], [3,4,3])
        let expected = -1
        XCTAssertEqual(s.canCompleteCircuit(input.0, input.1), expected)
    }

    func testSample3() {
        let input = ([4,5,3,1,4], [5,4,3,4,2])
        let expected = -1
        XCTAssertEqual(s.canCompleteCircuit(input.0, input.1), expected)
    }

    func testSample4() {
        let input = ([5], [4])
        let expected = 0
        XCTAssertEqual(s.canCompleteCircuit(input.0, input.1), expected)
    }
}

Tests.defaultTestSuite.run()
