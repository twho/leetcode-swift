// LeetCode: https://leetcode.com/problems/count-primes/description/

import XCTest

class Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 1 else { return 0 }
        var count = 0
        for i in 2..<n {
            if i>2, i%2 == 0 {
                continue
            }
            if isPrime(i) {
                count += 1
            }
        }
        return count
    }
    
    private func isPrime(_ n: Int) -> Bool {
        if n == 1 {
            return false
        }
        let root = Int(sqrt(Double(n)))
        if root < 2 {
            return true
        }
        
        for i in 2...root {
            if n%i == 0 {
                return false
            }
        }
        return true
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = 10
        let expected = 4
        XCTAssertEqual(s.countPrimes(input), expected)
    }
    
    func testSample2() {
        let input = 2
        let expected = 0
        XCTAssertEqual(s.countPrimes(input), expected)
    }
}

Tests.defaultTestSuite.run()
