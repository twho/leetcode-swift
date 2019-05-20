// Leetcode: https://leetcode.com/problems/find-right-interval/
// Intervals could be negative, don't mess up with -1
// Time complexity of getting dictionary keys is O(n), not good

import XCTest

public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
    
    public init(_ arr: [Int]) {
        self.start = arr[0]
        self.end = arr[1]
    }
}

class Solution {
    func findRightInterval(_ intervals: [Interval]) -> [Int] {
        guard intervals.count > 1 else {
            return [-1]
        }
        
        var map = [Int:Int]()
        var keys = [Int]()
        for i in 0..<intervals.count {
            map[intervals[i].start] = i
            keys.append(intervals[i].start)
        }
        
        var output = [Int]()
        keys = keys.sorted()
        for i in intervals {
            let result = binarySearch(keys, i.end)
            if result < i.end {
                output.append(-1)
            } else {
                output.append(map[result]!)
            }
        }
        return output
    }
    
    private func binarySearch(_ keys: [Int], _ bound: Int) -> Int {
        var start = 0
        var end = keys.count-1
        var mid = 0
        
        while start < end {
            mid = (start+end)/2
            if keys[mid] < bound {
                start = mid+1
            } else {
                end = mid
            }
        }
        return keys[start]
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [Interval(3,4), Interval(2,3), Interval(1,2)]
        let expected = [-1, 0, 1]
        let output = s.findRightInterval(input)
        XCTAssertEqual(expected.count, output.count)
        for i in 0..<output.count {
            XCTAssertEqual(output[i], expected[i])
        }
    }

    func testSample2() {
        let input = [Interval(4,5), Interval(2,3), Interval(1,2)]
        let expected = [-1, 0, 1]
        let output = s.findRightInterval(input)
        XCTAssertEqual(expected.count, output.count)
        for i in 0..<output.count {
            XCTAssertEqual(output[i], expected[i])
        }
    }

    func testSample3() {
        let input = [Interval(1,12), Interval(2,9), Interval(3,10), Interval(13,14), Interval(15,16), Interval(16,17)]
        let expected = [3,3,3,4,5,-1]
        let output = s.findRightInterval(input)
        XCTAssertEqual(expected.count, output.count)
        for i in 0..<output.count {
            XCTAssertEqual(output[i], expected[i])
        }
    }
}

Tests.defaultTestSuite.run()
