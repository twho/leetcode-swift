// LeetCode: https://leetcode.com/problems/happy-number/description/

import XCTest

class Solution {
    func isHappy(_ n: Int) -> Bool {
        guard n != 1 else { return true }
        var input = n
        var arr: [Int] = []
        var output = false
        while input != 1, !arr.contains(input) {
            calculateSum(&input, &arr, &output)
        }
        return output
    }
    
    private func calculateSum(_ n: inout Int, _ arr: inout [Int], _ output: inout Bool) {
        arr.append(n)
        var sum = 0
        while n > 0 {
            let num = n%10
            n = n/10
            sum += num*num
        }
        if sum == 1 {
            output = true
        }
        n = sum
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = 19
        XCTAssertTrue(s.isHappy(input))
    }
    
    func testSample2() {
        let input = 1
        XCTAssertTrue(s.isHappy(input))
    }
    
    func testSample3() {
        let input = 100
        XCTAssertTrue(s.isHappy(input))
    }
}

Tests.defaultTestSuite.run()
