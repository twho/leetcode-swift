// LeetCode: https://leetcode.com/problems/merge-intervals/description/

import XCTest

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 0 else { return [] }
        var output: [[Int]] = []
        var sorted = mergeSort(intervals, 0, intervals.count-1)
        var i = 0
        while i < sorted.count {
            var j = i + 1
            while j < sorted.count, sorted[i][1] >= sorted[j][0] {
                sorted[i][1] = max(sorted[j][1], sorted[i][1])
                j += 1
            }
            output.append(sorted[i])
            i = j
        }
        return output
    }
    
    private func mergeSort(_ intervals: [[Int]], _ start: Int, _ end: Int) -> [[Int]] {
        guard end - start > 0 else { return [intervals[start]] }
        
        let mid = start + (end-start)/2
        let leftArr = mergeSort(intervals, start, mid)
        let rightArr = mergeSort(intervals, mid+1, end)
        
        var output = [[Int]]()
        var leftStart = 0
        var rightStart = 0
        while leftStart < leftArr.count || rightStart < rightArr.count {
            if leftStart < leftArr.count, rightStart < rightArr.count {
                if leftArr[leftStart][0] < rightArr[rightStart][0] {
                    output.append(leftArr[leftStart])
                    leftStart += 1
                } else {
                    output.append(rightArr[rightStart])
                    rightStart += 1
                }
            } else if leftStart < leftArr.count {
                for i in leftStart..<leftArr.count {
                    output.append(leftArr[i])
                }
                leftStart = leftArr.count
            } else {
                for i in rightStart..<rightArr.count {
                    output.append(rightArr[i])
                }
                rightStart = rightArr.count
            }
        }
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [[1,3], [2,6], [8,10], [15,18]]
        let expected = [[1,6],[8,10],[15,18]]
        XCTAssertEqual(expected, s.merge(input))
    }
    
    func testSample2() {
        let input = [[1,4], [4,5]]
        let expected = [[1,5]]
        XCTAssertEqual(expected, s.merge(input))
    }
    
    func testSample3() {
        let input = [[1,4], [2,3]]
        let expected = [[1,4]]
        XCTAssertEqual(expected, s.merge(input))
    }
    
    func testSample4() {
        let input = [[1,4], [0,2], [3,5]]
        let expected = [[0,5]]
        XCTAssertEqual(expected, s.merge(input))
    }
    
    func testSample5() {
        let input = [[Int]]()
        let expected = [[Int]]()
        XCTAssertEqual(expected, s.merge(input))
    }
}

Tests.defaultTestSuite.run()
