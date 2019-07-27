// LeetCode: https://leetcode.com/problems/my-calendar-i/

import XCTest

class MyCalendar {
    var records: [[Int]]
    
    init() {
        records = [[Int]]()
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        if records.count == 0 {
            records.append([start, end])
            return true
        }
        
        if records.count == 1 {
            if records[0][1] <= start {
                records.insert([start, end], at: 1)
                return true
            } else if records[0][0] >= end {
                records.insert([start, end], at: 0)
                return true
            }
            return false
        }
        
        var left = 0
        var right = records.count
        while left < right {
            let mid = left + (right - left)/2
            if records[mid][0] == start || records[mid][1] == end {
                return false
            } else if records[mid][0] > start {
                right = mid
            } else {
                left = mid + 1
            }
        }
        // If the inserted time if larger than all.
        if left == records.count, start >= records[records.count-1][1] {
            records.append([start, end])
            return true
        }
        // Invalid index
        if left - 1 >= 0, records[left-1][1] > start {
            return false
        }
        // Invalid index
        if records[left][0] < end {
            return false
        }
        records.insert([start, end], at: left)
        return true
    }
}

class Tests: XCTestCase {
    let calendar = MyCalendar()
    
    func testSample1() {
        let input = [
            [10, 20],
            [15, 25],
            [20, 30]
        ]
        let expected = [true, false, true]
        for (idx, i) in input.enumerated() {
            XCTAssertEqual(expected[idx], calendar.book(i[0], i[1]))
        }
    }
    
    func testSample2() {
        let input = [
            [12,20],[21,29],[11,20],
            [12,17],[84,90],[60,68],
            [88,94],[23,32],[88,94],
            [15,20],[77,83],[34,42],
            [44,53],[35,40],[24,31],
            [48,55],[0,6],[6,13],
            [58,63],[15,23]
        ]
        let expected = [
            true,true,false,
            false,true,true,
            false,false,false,
            false,true,true,
            true,false,false,
            false,true,false,
            false,false
        ]
        for (idx, i) in input.enumerated() {
            XCTAssertEqual(expected[idx], calendar.book(i[0], i[1]))
        }
    }
    
    func testSample3() {
        let input = [
            [47,50],[33,41],[39,45],
            [33,42],[25,32],[26,35],
            [19,25],[3,8],[8,13],
            [18,27]
        ]
        let expected = [
            true,true,false,
            false,true,false,
            true,true,true,
            false
        ]
        for (idx, i) in input.enumerated() {
            XCTAssertEqual(expected[idx], calendar.book(i[0], i[1]))
        }
    }
}

Tests.defaultTestSuite.run()
