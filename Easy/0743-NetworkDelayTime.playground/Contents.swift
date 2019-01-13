// LeetCode: https://leetcode.com/problems/network-delay-time

import XCTest

class Solution {
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        var output: [Int] = []
        var dict: [Int:[(Int,Int)]] = [:]
        for time in times {
            if dict[time[0]] == nil {
                dict[time[0]] = [(time[1], time[2])]
            } else {
                dict[time[0]]!.append((time[1], time[2]))
            }
        }
        dfs(K, N, dict, &output)
        return output.count == 0 ? -1 : output.min()!
    }
}

func dfs(_ start: Int, _ total: Int, _ times: [Int:[(Int,Int)]], _ output: inout [Int]) {
    let visited: Set = [start]
    guard let current = times[start] else { return }
    if start == total {
        current.forEach({
            output.append($0.1)
        })
        return
    }
    dfsHelper((start, 0), total, visited, times, &output)
}

// helper method - use to implement DFS recursively
func dfsHelper(_ current: (index: Int, time: Int), _ total: Int, _ visited: Set<Int>, _ times: [Int:[(Int,Int)]], _ output: inout [Int]) {
    if current.index == total, visited.count == total {
        output.append(current.time)
        return
    }
    
    guard let dests = times[current.index] else { return }
    for dest in dests {
        if visited.contains(dest.0) {
            continue
        }
        let tempCurrent = (dest.0, current.time + dest.1)
        var tempVisit = visited
        tempVisit.insert(current.0)
        dfsHelper(tempCurrent, total, tempVisit, times, &output)
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([[2,1,1],[2,3,1],[3,4,1]], 4, 2)
        let expected = 2
        XCTAssertEqual(s.networkDelayTime(input.0, input.1, input.2), expected)
    }
    
    func testSample2() {
        let input = ([[1,2,1],[2,1,3]], 2, 2)
        let expected = 3
        XCTAssertEqual(s.networkDelayTime(input.0, input.1, input.2), expected)
    }
    
    func testSample3() {
        let input = ([[1,2,1],[2,3,2],[1,3,4]], 3, 1)
        let expected = 3
        XCTAssertEqual(s.networkDelayTime(input.0, input.1, input.2), expected)
    }
    
    func testSample4() {
        let input = ([[1,2,1],[2,3,2],[1,3,1]], 3, 2)
        let expected = -1
        XCTAssertEqual(s.networkDelayTime(input.0, input.1, input.2), expected)
    }
}

Tests.defaultTestSuite.run()
