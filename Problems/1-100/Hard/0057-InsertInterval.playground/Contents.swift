// LeetCode: https://leetcode.com/problems/insert-interval/description/

import XCTest

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard intervals.count > 0 else { return [newInterval] }
        
        var output = [[Int]]()
        var idx = 0
        var insertIdx = 0
        var newInterval = newInterval
        while idx < intervals.count {
            let start = intervals[idx][0]
            let end = intervals[idx][1]
            if (end >= newInterval[0] && end <= newInterval[1]) || (start >= newInterval[0] && start <= newInterval[1]) {
                newInterval = [min(start, newInterval[0]), max(end, newInterval[1])]
            } else {
                insertIdx += 1
                output.append(intervals[idx])
            }
            idx += 1
        }
        output.append(newInterval)
        return output.sorted(by: { $0[0] < $1[0] })
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([[1,3], [6,9]], [2,5])
        let expected = [[1,5],[6,9]]
        let output = s.insert(input.0, input.1)
        for o in output {
            expected.contains(o)
        }
        XCTAssertEqual(output.count, expected.count)
    }
    
    func testSample2() {
        let input = ([[1,2], [3,5], [6,7], [8,10], [12,16]], [4,8])
        let expected = [[1,2],[3,10],[12,16]]
        let output = s.insert(input.0, input.1)
        for o in output {
            expected.contains(o)
        }
        XCTAssertEqual(output.count, expected.count)
    }
    
    func testSample3() {
        let input = ([[1,5]], [6,8])
        let expected = [[1,5], [6,8]]
        let output = s.insert(input.0, input.1)
        for o in output {
            expected.contains(o)
        }
        XCTAssertEqual(output.count, expected.count)
    }
}

Tests.defaultTestSuite.run()

