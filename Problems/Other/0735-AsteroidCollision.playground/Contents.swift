// LeetCode: https://leetcode.com/problems/asteroid-collision/

import XCTest

class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var output = [Int]()
        
        for index in 0..<asteroids.count {
            let rock = asteroids[index]
            if rock > 0 {
                output.append(rock)
                continue
            }
            checkExplosion(&output, rock)
        }
        return output
    }
    
    func checkExplosion(_ output: inout [Int], _ rock: Int) {
        if let last = output.last {
            if last < 0 {
                output.append(rock)
            } else {
                output.removeLast()
                // Explode
                if abs(last) > abs(rock) {
                    output.append(last)
                } else if abs(last) < abs(rock) {
                    checkExplosion(&output, rock)
                }
            }
        } else {
            output.append(rock)
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    private func runTests(_ input: [Int], _ expected: [Int]) {
        let output = s.asteroidCollision(input)
        if expected.count != output.count {
            XCTFail()
            return
        }
        for index in 0..<output.count {
            XCTAssertEqual(expected[index], output[index])
        }
    }
    
    func testSample1() {
        let input = [5, 10, -5]
        let expected = [5, 10]
        runTests(input, expected)
    }

    func testSample2() {
        let input = [8, -8]
        let expected = [Int]()
        runTests(input, expected)
    }
    
    func testSample3() {
        let input = [10, 2, -5]
        let expected = [10]
        runTests(input, expected)
    }
    
    func testSample4() {
        let input = [-2, -1, 1, 2]
        let expected = [-2, -1, 1, 2]
        runTests(input, expected)
    }
}

Tests.defaultTestSuite.run()
