// LeetCode: https://leetcode.com/problems/pascals-triangle/description/

import XCTest

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var output: [[Int]] = []
        if numRows < 1 {
            return output
        }
        output.append([1])
        if numRows < 2 {
            return output
        }
        output.append([1,1])
        if numRows < 3 {
            return output
        }
        for i in 2..<numRows {
            var arr = Array(repeating: 1, count: i+1)
            for j in 1..<arr.count-1 {
                arr[j] = output[i-1][j-1] + output[i-1][j]
            }
            
            output.append(arr)
        }
        return output
    }
    
    func getRow(_ rowIndex: Int) -> [Int] {
        var output: [Int] = [1]
        guard rowIndex > 0 else {
            return output
        }
        for _ in 1...rowIndex {
            var temp = output
            for j in 0..<output.count {
                if j-1 >= 0 {
                    output[j] = temp[j] + temp[j-1]
                }
            }
            output.append(1)
        }
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = 5
        let expected = [
            [1],
            [1,1],
            [1,2,1],
            [1,3,3,1],
            [1,4,6,4,1]
        ]
        XCTAssertEqual(s.generate(input), expected)
    }
    
    func testSample2() {
        let input = 0
        let expected: [[Int]] = []
        XCTAssertEqual(s.generate(input), expected)
    }
    
    func testSample3() {
        let input = 5
        let expected = [1,5,10,10,5,1]
        XCTAssertEqual(s.getRow(input), expected)
    }
    
    func testSample4() {
        let input = 3
        let expected = [1,3,3,1]
        XCTAssertEqual(s.getRow(input), expected)
    }
    
    func testSample5() {
        let input = 1
        let expected = [1,1]
        XCTAssertEqual(s.getRow(input), expected)
    }
}

Tests.defaultTestSuite.run()

