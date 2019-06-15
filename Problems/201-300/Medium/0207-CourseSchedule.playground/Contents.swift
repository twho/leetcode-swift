// LeetCode: https://leetcode.com/problems/course-schedule/description/
// Hint: Detect if the cycle exists, return false if the cycle exists.

import XCTest

class Solution {
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var dict = [Int : [Int]]() // [course : prerequisite]
        for arr in prerequisites {
            if dict[arr[0]] != nil {
                dict[arr[0]]!.append(arr[1])
            } else {
                dict[arr[0]] = [arr[1]]
            }
        }
        var visited = [Bool]()
        var okCourse = Array(repeating: false, count: numCourses)
        for i in 0..<numCourses {
            visited = Array(repeating: false, count: numCourses)
            helper(i, &okCourse, visited, dict)
            if !okCourse[i] {
                return false
            }
        }
        return true
    }
    
    private func helper(_ current: Int, _ okCourse: inout [Bool], _ visited: [Bool], _ dict: [Int : [Int]]) {
        if let pres = dict[current] {
            for pre in pres {
                if okCourse[pre] {
                    continue
                }
                if visited[pre] {
                    okCourse[current] = false
                    return
                }
                var temp = visited
                temp[pre] = true
                helper(pre, &okCourse, temp, dict)
                if !okCourse[pre] {
                    okCourse[current] = false
                    return
                }
            }
        }
        okCourse[current] = true
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = (2, [[0,1],[1,0]])
        XCTAssertFalse(s.canFinish(input.0, input.1))
    }
    
    func testSample2() {
        let input = (2, [[1,0]])
        XCTAssertTrue(s.canFinish(input.0, input.1))
    }
    
    func testSample3() {
        let input = (2, [[0,1]])
        XCTAssertTrue(s.canFinish(input.0, input.1))
    }
    
    func testSample4() {
        let input = (3, [[1,0],[1,2],[0,1]])
        XCTAssertFalse(s.canFinish(input.0, input.1))
    }
    
    func testSample5() {
        let input = (3, [[0,1],[0,2],[1,2]])
        XCTAssertTrue(s.canFinish(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
