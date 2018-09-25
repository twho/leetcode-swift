// LeetCode: https://leetcode.com/problems/merge-intervals/description/

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
    func merge(_ intervals: [Interval]) -> [Interval] {
        var output: [Interval] = []
        var sorted = intervals.sorted(by: { $0.start < $1.start })
        var i = 0
        while i < sorted.count {
            var j = i + 1
            while j < sorted.count, sorted[i].end >= sorted[j].start {
                sorted[i].end = max(sorted[j].end, sorted[i].end)
                j += 1
            }
            output.append(sorted[i])
            i = j
        }
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [Interval(1,3), Interval(2,6), Interval(8,10), Interval(15,18)]
        let expected = [[1,6],[8,10],[15,18]]
        var output: [[Int]] = []
        for i in s.merge(input) {
            output.append(i.toArray())
        }
        XCTAssertEqual(output, expected)
    }
    
    func testSample2() {
        let input = [Interval(1,4), Interval(4,5)]
        let expected = [[1,5]]
        var output: [[Int]] = []
        for i in s.merge(input) {
            output.append(i.toArray())
        }
        XCTAssertEqual(output, expected)
    }
    
    func testSample3() {
        let input = [Interval(1,4), Interval(2,3)]
        let expected = [[1,4]]
        var output: [[Int]] = []
        for i in s.merge(input) {
            output.append(i.toArray())
        }
        XCTAssertEqual(output, expected)
    }
    
    func testSample4() {
        let input = [Interval(1,4), Interval(0,2), Interval(3,5)]
        let expected = [[0,5]]
        var output: [[Int]] = []
        for i in s.merge(input) {
            output.append(i.toArray())
        }
        XCTAssertEqual(output, expected)
    }
}

Tests.defaultTestSuite.run()
