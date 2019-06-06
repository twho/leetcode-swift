// LeetCode: https://leetcode.com/problems/combination-sum-iii/description/

import XCTest

class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var arr: [Int] = []
        for i in 1...9 {
            arr.append(i)
        }
        var output: [[Int]] = []
        let current: [Int] = []
        combine(k, n, current, arr, &output)
        return output
    }
    
    private func combine(_ k: Int, _ n: Int, _ current: [Int], _ arr: [Int], _ output: inout [[Int]]) {
        if current.reduce(0, +) == n {
            if current.count == k {
                output.append(current)
            }
            return
        }
        if current.count >= k || current.reduce(0, +) >= n  {
            return
        }
        var arr = arr
        if let last = current.last {
            let idx = arr.firstIndex(of: last)!
            if idx+1 < arr.count {
                arr = Array(arr[idx+1..<arr.count])
            } else {
                return
            }
        }
        for idx in 0..<arr.count {
            var temp = arr
            var tempCurr = current
            tempCurr.append(temp.remove(at: idx))
            combine(k, n, tempCurr, arr, &output)
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = (3, 9)
        let expected = [[1,2,6],[1,3,5],[2,3,4]]
        let output = s.combinationSum3(input.0, input.1)
        XCTAssertEqual(output.count, expected.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
    
    func testSample2() {
        let input = (4, 24)
        let expected = [[1,6,8,9],[2,5,8,9],[2,6,7,9],[3,4,8,9],[3,5,7,9],[3,6,7,8],[4,5,6,9],[4,5,7,8]]
        let output = s.combinationSum3(input.0, input.1)
        XCTAssertEqual(output.count, expected.count)
        for o in output {
            XCTAssertTrue(expected.contains(o))
        }
    }
}

Tests.defaultTestSuite.run()
