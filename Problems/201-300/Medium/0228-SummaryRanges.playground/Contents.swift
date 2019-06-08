// LeetCode: https://leetcode.com/problems/summary-ranges/

import XCTest

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        var output = [String]()
        
        var temp: Int?
        var idx = 0
        while idx < nums.count {
            if let tempVal = temp {
                if nums[idx] - tempVal > 1 {
                    if Int(output[output.count-1])! != tempVal {
                        output[output.count-1].append("->\(tempVal)")
                    }
                    output.append("\(nums[idx])")
                } else if idx == nums.count - 1 {
                    output[output.count-1].append("->\(nums[idx])")
                }
            } else {
                output.append("\(nums[idx])")
            }
            temp = nums[idx]
            idx += 1
        }
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [0,1,2,4,5,7]
        let expected = ["0->2","4->5","7"]
        let output = s.summaryRanges(input)
        XCTAssertEqual(expected.count, output.count)
        output.forEach {
            XCTAssertTrue(expected.contains($0))
        }
    }
    
    func testSample2() {
        let input = [0,2,3,4,6,8,9]
        let expected = ["0","2->4","6","8->9"]
        let output = s.summaryRanges(input)
        XCTAssertEqual(expected.count, output.count)
        output.forEach {
            XCTAssertTrue(expected.contains($0))
        }
    }
}

Tests.defaultTestSuite.run()
