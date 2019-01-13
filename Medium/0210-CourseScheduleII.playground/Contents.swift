// LeetCode: https://leetcode.com/problems/course-schedule-ii/description/

import XCTest

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var output: [Int] = []
        var dict: [Int:[Int]] = [:]
        for course in prerequisites {
            if dict[course[0]] == nil {
                dict[course[0]] = [course[1]]
            } else {
                dict[course[0]]!.append(course[1])
            }
        }
        
        // insert no prerequisites courses
        for course in 0..<numCourses {
            if dict[course] == nil {
                output.append(course)
            }
        }
        
        var idx = 0
        var arr = Array(dict)
        while idx < arr.count {
            if Set(arr[idx].value).isSubset(of: Set(output)) {
                output.append(arr[idx].key)
                arr.remove(at: idx)
                idx = 0
                continue
            }
            idx += 1
        }
        return output.count == numCourses ? output : []
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = (3, [[1,0], [2,1]])
        let expected = [0,1,2]
        XCTAssertEqual(s.findOrder(input.0, input.1), expected)
    }

    func testSample2() {
        let input = (4, [[1,0],[2,0],[3,1],[3,2]])
        let expected = ([0,1,2,3], [0,2,1,3])
        XCTAssertTrue(s.findOrder(input.0, input.1) == expected.0 || s.findOrder(input.0, input.1) == expected.1)
    }
    
    func testSample3() {
        let input = (4, [[3,0],[0,1]])
        let expected = ([2,1,0,3], [1,2,0,3])
        XCTAssertTrue(s.findOrder(input.0, input.1) == expected.0 || s.findOrder(input.0, input.1) == expected.1)
    }
}

Tests.defaultTestSuite.run()
