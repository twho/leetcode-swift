// LeetCode: https://leetcode.com/problems/gas-station/description/

import XCTest

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        // Handle edge case
        if gas.count == 1 {
            return gas[0] >= cost[0] ? 0 : -1
        }
        var current = 0
        for start in 0..<gas.count {
            if gas[start] - cost[start] < 0 {
                continue
            }
            current = gas[start]
            innerLoop: for pos in start..<start+gas.count {
                if current - cost[pos%gas.count] < 0 {
                    break innerLoop
                } else {
                    current += gas[(pos+1)%gas.count] - cost[pos%gas.count]
                }
                if pos == start + gas.count - 1 {
                    return start
                }
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
