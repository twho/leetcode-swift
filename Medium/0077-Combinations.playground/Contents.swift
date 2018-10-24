// LeetCode: https://leetcode.com/problems/combinations/description/

import XCTest

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        if n == 0 {
            return []
        }
        var output: [[Int]] = []
        var current: [Int] = []
        if k < n/2 {
            combine(n, k, current, &output)
        } else {
            for i in 1...n {
                current.append(i)
            }
            guard n-k > 0 else {
                return [current]
            }
            remove(n-k, 0, current, &output)
        }
        
        return output
    }
    
    private func combine(_ n: Int, _ k: Int, _ current: [Int], _ output: inout [[Int]]) {
        if current.count == k {
            if !output.contains(current) {
                output.append(current)
            }
            return
        }
        let last = current.last ?? 1
        for i in last...n {
            if current.contains(i) {
                continue
            }
            var temp = current
            temp.append(i)
            combine(n, k, temp, &output)
        }
    }
    
    private func remove(_ toRemove: Int, _ cursor: Int, _ current: [Int], _ output: inout [[Int]]) {
        if toRemove == 0 {
            if !output.contains(current) {
                output.append(current)
            }
            return
        }
        var idx = 0
        for (idx, i) in current.enumerated() {
            if i <= cursor {
                continue
            }
            var temp = current
            temp.remove(at: idx)
            remove(toRemove-1, i, temp, &output)
        }
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
    
    func testSample2() {
        let input = (20, 16)
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
