// LeetCode: https://leetcode.com/problems/course-schedule/description/
// Hint: Detect if the cycle exists, return false if the cycle exists.

import XCTest

class Node {
    let label: Int
    var adj: [Node]
    
    init(_ label: Int, _ adj: [Node]) {
        self.label = label
        self.adj = adj
    }
}

// Solution1
class Solution1 {
    var visited = [Bool]()
    var onTraversePath = [Bool]()
    var hasCycle = false
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = [Node]()
        for i in 0..<numCourses {
            graph.append(Node(i, [Node]()))
        }
        
        for pre in prerequisites {
            let from = pre[0]
            let to = pre[1]
            
            graph[from].adj.append(graph[to])
        }
        
        visited = Array(repeating: false, count: graph.count)
        onTraversePath = Array(repeating: false, count: graph.count)
        hasCycle = false
        
        return !hasCycles(graph)
    }
    
    
    func hasCycles(_ graph: [Node]) -> Bool {
        if graph.isEmpty {
            return true
        }
        
        for n in graph {
            if !visited[n.label] && !hasCycle {
                dfs(n)
            }
        }
        
        return hasCycle
    }
    
    func dfs(_ node: Node) {
        if hasCycle {
            return
        }
        
        visited[node.label] = true
        onTraversePath[node.label] = true
        
        for adj in node.adj {
            if !visited[adj.label] {
                dfs(adj)
            } else {
                // If true, the cycle exists.
                if onTraversePath[adj.label] {
                    hasCycle = true
                }
            }
        }
        
        onTraversePath[node.label] = false
    }
}

// Solution2
class Solution2 {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = [Node]()
        for i in 0..<numCourses {
            graph.append(Node(i, [Node]()))
        }
        
        var needsPres = Array(repeating: 0, count: numCourses)
        for pre in prerequisites {
            let from = pre[1]
            let to = pre[0]
            graph[from].adj.append(graph[to])
            needsPres[to] += 1
        }
        
        var takeFirst = [Int]()
        for i in 0..<needsPres.count {
            if needsPres[i] == 0 {
                takeFirst.append(i)
            }
        }
        
        var output = [Int]()
        while !takeFirst.isEmpty {
            let toTake = takeFirst.removeFirst()
            output.append(toTake)
            
            for node in graph[toTake].adj {
                needsPres[node.label] -= 1
                if needsPres[node.label] == 0 {
                    takeFirst.append(node.label)
                }
            }
        }
        return output.count == numCourses
    }
}

class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()
    
    func testSol1Sample1() {
        let input = (2, [[0,1],[1,0]])
        XCTAssertFalse(s1.canFinish(input.0, input.1))
    }
    
    func testSol1Sample2() {
        let input = (2, [[0,1]])
        XCTAssertTrue(s1.canFinish(input.0, input.1))
    }
    
    func testSol2Sample1() {
        let input = (2, [[0,1],[1,0]])
        XCTAssertFalse(s2.canFinish(input.0, input.1))
    }
    
    func testSol2Sample2() {
        let input = (2, [[1,0]])
        XCTAssertTrue(s2.canFinish(input.0, input.1))
    }
    
    func testSol2Sample3() {
        let input = (2, [[0,1]])
        XCTAssertTrue(s2.canFinish(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
