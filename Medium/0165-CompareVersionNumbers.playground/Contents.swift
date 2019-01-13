//LeetCode: https://leetcode.com/problems/compare-version-numbers/description/

import XCTest

class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let verArr1 = Array(version1.components(separatedBy: "."))
        let verArr2 = Array(version2.components(separatedBy: "."))
        
        if verArr1.count > 0, verArr2.count > 0 {
            let count = max(verArr1.count, verArr2.count)
            for i in 0..<count {
                if i < verArr1.count, i < verArr2.count {
                    if Int(verArr1[i])! > Int(verArr2[i])! {
                        return 1
                    } else if Int(verArr1[i])! < Int(verArr2[i])! {
                        return -1
                    }
                } else if i < verArr1.count {
                    if Int(verArr1[i])! == 0 {
                        continue
                    }
                    return Int(verArr1[i])! > 0 ? 1 : 0
                } else {
                    if Int(verArr2[i])! == 0 {
                        continue
                    }
                    return Int(verArr2[i])! > 0 ? -1 : 0
                }
            }
        } else if verArr1.count > 0 {
            return Int(version2)! > Int(verArr1[0])! ? -1 : 1
        } else {
            return Int(version1)! > Int(verArr2[0])! ? 1 : -1
        }
        return 0
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ("1", "0")
        let expected = 1
        XCTAssertEqual(s.compareVersion(input.0, input.1), expected)
    }
    
    func testSample2() {
        let input = ("0.1", "1.1")
        let expected = -1
        XCTAssertEqual(s.compareVersion(input.0, input.1), expected)
    }
    
    func testSample3() {
        let input = ("01", "1")
        let expected = 0
        XCTAssertEqual(s.compareVersion(input.0, input.1), expected)
    }
    
    func testSample4() {
        let input = ("1.0", "1")
        let expected = 0
        XCTAssertEqual(s.compareVersion(input.0, input.1), expected)
    }
}

Tests.defaultTestSuite.run()

