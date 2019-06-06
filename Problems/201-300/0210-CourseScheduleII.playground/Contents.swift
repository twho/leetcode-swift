// LeetCode: https://leetcode.com/problems/course-schedule-ii/description/
// Hint: use graph

import XCTest

class Solution {
    var onPath = [Bool]()
    var visited = [Bool]()
    var hasCycle = false
    
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var graph = [Node]()
        for i in 0..<numCourses {
            graph.append(Node(i, adj: [Node]()))
        }
        
        var needPreCourses = Array(repeating: 0, count: numCourses)
        for pre in prerequisites {
            let from = pre[1]
            let to = pre[0]
            graph[from].adj.append(graph[to])
            needPreCourses[to] += 1
        }
        
        var courseToTakeFirst = [Int]()
        for i in 0..<needPreCourses.count {
            if needPreCourses[i] == 0 {
                courseToTakeFirst.append(i)
            }
        }
        
        var res = [Int]()
        while !courseToTakeFirst.isEmpty {
            var course = courseToTakeFirst.removeFirst()
            res.append(course)
            
            for node in graph[course].adj {
                needPreCourses[node.label] -= 1
                
                if needPreCourses[node.label] == 0 {
                    courseToTakeFirst.append(node.label)
                }
            }
        }
        return res.count == numCourses ? res : []
    }
    
    class Node {
        var label: Int
        var adj: [Node]
        init(_ label: Int, adj: [Node]) {
            self.label = label
            self.adj = adj
        }
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
