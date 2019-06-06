// LeetCode: https://leetcode.com/problems/candy/

import XCTest

class Solution {
    func candy(_ ratings: [Int]) -> Int {
        guard ratings.count > 0 else { return 0 }
        
        var output: [Int] = Array(repeating: 1, count: ratings.count)
        
        // Do it forward
        for idx in 0..<ratings.count {
            if idx - 1 >= 0, ratings[idx] > ratings[idx-1] {
                output[idx] = output[idx-1] + 1
            }
        }
        
        // Do it backward to double check
        for idx in 0..<ratings.count {
            if ratings.count-2-idx >= 0, ratings[ratings.count-2-idx] > ratings[ratings.count-1-idx], output[ratings.count-2-idx] <= output[ratings.count-1-idx] {
                output[ratings.count-2-idx] = output[ratings.count-1-idx] + 1
            }
        }
        print(output)
        return output.reduce(0, +)
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [1,0,2]
        let expected = 5
        XCTAssertEqual(s.candy(input), expected)
    }
    
    func testSample2() {
        let input = [1,3,4,5,2]
        let expected = 11
        XCTAssertEqual(s.candy(input), expected)
    }
    
    func testSample3() {
        let input = [1,2,87,87,87,2,1]
        let expected = 13
        XCTAssertEqual(s.candy(input), expected)
    }
}

Tests.defaultTestSuite.run()
