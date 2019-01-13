// LeetCode: https://leetcode.com/problems/course-schedule/description/
// Hint: Detect if the cycle exists, return false if the cycle exists.

import XCTest

class Solution {
    var visited = [Bool]()
    var onTraversePath = [Bool]()
    var hasCycle = false
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = [Node]()
        for i in 0..<numCourses {
            graph.append(Node(label: i, adj: [Node]()))
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
    
    class Node {
        let label: Int
        var adj: [Node]
        
        init(label: Int, adj: [Node]) {
            self.label = label
            self.adj = adj
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = (2, [[0,1],[1,0]])
        XCTAssertFalse(s.canFinish(input.0, input.1))
    }
    
    func testSample2() {
        let input = (2, [[0,1]])
        XCTAssertTrue(s.canFinish(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
