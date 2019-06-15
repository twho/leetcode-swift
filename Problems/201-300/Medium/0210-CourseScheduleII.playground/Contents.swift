// LeetCode: https://leetcode.com/problems/course-schedule-ii/description/
// Hint: use graph

import XCTest

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var dict = [Int : [Int]]() // [course : [prerequisite]]
        for pre in prerequisites {
            if dict[pre[0]] != nil {
                dict[pre[0]]!.append(pre[1])
            } else {
                dict[pre[0]] = [pre[1]]
            }
        }
        var output = [Int](0..<numCourses)
        var okCourse: [Bool] = Array(repeating: false, count: numCourses)
        for course in 0..<numCourses {
            if okCourse[course] {
                continue
            }
            var visited: [Bool] = Array(repeating: false, count: numCourses)
            visited[course] = true
            helper(course, visited, &okCourse, dict, &output)
            if !okCourse[course] {
                return []
            }
        }
        return output
    }
    
    private func helper(_ current: Int, _ visited: [Bool], _ okCourse: inout [Bool], _ dict: [Int : [Int]], _ output: inout [Int]) {
        guard let pres = dict[current] else {
            okCourse[current] = true
            return
        }
        for pre in pres {
            if visited[pre] {
                okCourse[current] = false
                return
            }
            
            var temp = visited
            temp[pre] = true
            helper(pre, temp, &okCourse, dict, &output)
            if !okCourse[pre] {
                okCourse[current] = false
                return
            }
            
            var curIdx: Int?
            for idx in 0..<output.count {
                if output[idx] == current {
                    curIdx = idx
                }
                if output[idx] == pre {
                    if let cur = curIdx, cur < idx {
                        if idx + 1 < output.count {
                            output.insert(output[cur], at: idx+1)
                        } else {
                            output.append(output[cur])
                        }
                        output.remove(at: cur)
                        curIdx = idx
                    }
                    break
                }
            }
        }
        okCourse[current] = true
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
        let expected = ([2,1,0,3], [1,2,0,3], [1, 0, 2, 3])
        let output = s.findOrder(input.0, input.1)
        XCTAssertTrue(output == expected.0 || output == expected.1 || output == expected.2)
    }

    func testSample4() {
        let input = (2, [[0,1], [1,0]])
        let expected = [Int]()
        XCTAssertEqual(s.findOrder(input.0, input.1), expected)
    }

    func testSample5() {
        let input = (4, [[0,1],[3,1],[1,3],[3,2]])
        let expected = [Int]()
        XCTAssertEqual(s.findOrder(input.0, input.1), expected)
    }

    func testSample6() {
        let input = (3, [[0,1],[0,2],[1,2]])
        let expected = [2,1,0]
        XCTAssertEqual(s.findOrder(input.0, input.1), expected)
    }

    func testSample7() {
        let input = (7, [[1,0],[0,3],[0,2],[3,2],[2,5],[4,5],[5,6],[2,4]])
        let expected = [6,5,4,2,3,0,1]
        XCTAssertEqual(s.findOrder(input.0, input.1), expected)
    }
    
    func testSample8() {
        let input = (8, [[1,0],[2,6],[1,7],[6,4],[7,0],[0,5]])
        let expected = ([5,4,6,3,2,0,7,1], [3, 4, 5, 0, 6, 2, 7, 1])
        let output = s.findOrder(input.0, input.1)
        XCTAssertTrue(output == expected.0 || output == expected.1)
    }
}

Tests.defaultTestSuite.run()
