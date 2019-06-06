// LeetCode: https://leetcode.com/problems/insert-interval/description/

import XCTest

public class Interval {
    public var start: Int
    public var end: Int
    
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
    
    public init(_ array: [Int]) {
        self.start = array[0]
        self.end = array[1]
    }
    
    public func toArray() -> [Int] {
        return [self.start, self.end]
    }
}

class Solution {
    func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
        guard intervals.count > 0 else {
            return [newInterval]
        }
        var i = 0
        var output: [Interval] = []
        var newInterval = newInterval
        var appendNew = true
        while i < intervals.count {
            if (intervals[i].end < newInterval.start) || (intervals[i].start > newInterval.end) {
                output.append(intervals[i])
                i += 1
                continue
            }
            var j = i
            while j < intervals.count, !((intervals[j].end < newInterval.start) || (intervals[j].start > newInterval.end)) {
                appendNew = false
                i = j
                newInterval = Interval(min(intervals[j].start, newInterval.start), max(intervals[j].end, newInterval.end))
                j += 1
            }
            i += 1
            output.append(newInterval)
        }
        if appendNew {
            output.append(newInterval)
            output.sort(by: { $0.start < $1.start })
        }
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([Interval(1,3), Interval(6,9)], Interval(2,5))
        let expected = [[1,5],[6,9]]
        var output: [[Int]] = []
        for i in s.insert(input.0, input.1) {
            output.append(i.toArray())
        }
        XCTAssertEqual(output, expected)
    }
    
    func testSample2() {
        let input = ([Interval(1,2), Interval(3,5), Interval(6,7), Interval(8,10), Interval(12,16)], Interval(4,8))
        let expected = [[1,2],[3,10],[12,16]]
        var output: [[Int]] = []
        for i in s.insert(input.0, input.1) {
            output.append(i.toArray())
        }
        XCTAssertEqual(output, expected)
    }
    
    func testSample3() {
        let input = ([Interval(1,5)], Interval(6,8))
        let expected = [[1,5],[6,8]]
        var output: [[Int]] = []
        for i in s.insert(input.0, input.1) {
            output.append(i.toArray())
        }
        XCTAssertEqual(output, expected)
    }
    
    func testSample4() {
        
    }
}

Tests.defaultTestSuite.run()

