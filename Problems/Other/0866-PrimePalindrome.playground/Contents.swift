// LeetCode: https://leetcode.com/problems/prime-palindrome/

import XCTest

class Solution {
    func primePalindrome(_ N: Int) -> Int {
        if N == 2 {
            return 2
        }
        
        var output = N%2 == 0 ? N+1 : N
        var dict = [Int : Bool]()
        while !isPrime(output, &dict) || !isPalindrome(output) {
            output += 2
        }
        return output
    }
    
    private func isPalindrome(_ n: Int) -> Bool {
        var arr = Array("\(n)")
        for idx in 0..<arr.count/2 {
            if arr[idx] != arr[arr.count-1-idx] {
                return false
            }
        }
        return true
    }
    
    private func isPrime(_ n: Int, _ dict: inout [Int : Bool]) -> Bool {
        if n == 3 || n == 2 {
            dict[n] = true
            return true
        } else if n == 1 {
            return false
        }
        
        if n%2 == 0 {
            return false
        }
        let bound = Int(pow(Double(n), 0.5))
        if bound < 3 {
            return n%2 != 0
        }
        for i in 3...bound {
//            if isPrime(i), n%i == 0 {
//                return false
//            }
            if n % i == 0 {
                return false
            }
        }
        dict[n] = true
        return true
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = 6
        let expected = 7
        XCTAssertEqual(expected, s.primePalindrome(input))
    }
    
    func testSample2() {
        let input = 8
        let expected = 11
        XCTAssertEqual(expected, s.primePalindrome(input))
    }
    
    func testSample3() {
        let input = 13
        let expected = 101
        XCTAssertEqual(expected, s.primePalindrome(input))
    }
    
    func testSample4() {
        let input = 928030
        let expected = 101
        XCTAssertEqual(expected, s.primePalindrome(input))
    }
}

Tests.defaultTestSuite.run()
