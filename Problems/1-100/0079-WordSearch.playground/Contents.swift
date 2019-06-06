// LeetCode: https://leetcode.com/problems/word-search/description/

import XCTest

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard word.count > 0 else {
            return false
        }
        var output = false
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                var arr = Array(word)
                var used: [[Int]] = []
                if board[i][j] == arr.first {
                    output = dfs(current: [i, j], used, board, arr) ? true : output
                }
            }
        }
        return output
    }
    
    private func dfs(current: [Int], _ used: [[Int]], _ board: [[Character]], _ remainArr: [Character]) -> Bool {
        if !used.contains(current), current[0] >= 0, current[0] < board.count, current[1] >= 0, current[1] < board[current[0]].count, board[current[0]][current[1]] == remainArr.first {
            var temp = used
            temp.append(current)
            var tempRemain = remainArr
            tempRemain.removeFirst()
            if tempRemain.count == 0 {
                return true
            } else {
                return dfs(current: [current[0]-1, current[1]], temp, board, tempRemain) || dfs(current: [current[0]+1, current[1]], temp, board, tempRemain) || dfs(current: [current[0], current[1]-1], temp, board, tempRemain) || dfs(current: [current[0], current[1]+1], temp, board, tempRemain)
            }
        } else {
            return false
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ([
            ["A","B","C","E"],
            ["S","F","C","S"],
            ["A","D","E","E"]
        ] as [[Character]], "ABCCED")
        XCTAssertTrue(s.exist(input.0, input.1))
    }

    func testSample2() {
        let input = ([
            ["A","B","C","E"],
            ["S","F","C","S"],
            ["A","D","E","E"]
        ] as [[Character]], "SEE")
        XCTAssertTrue(s.exist(input.0, input.1))
    }
    
    func testSample3() {
        let input = ([
            ["A","B","C","E"],
            ["S","F","C","S"],
            ["A","D","E","E"]
        ] as [[Character]], "ABCB")
        XCTAssertFalse(s.exist(input.0, input.1))
    }

    func testSample4() {
        let input = ([
            ["a","a"]
            ] as [[Character]], "a")
        XCTAssertTrue(s.exist(input.0, input.1))
    }

    func testSample5() {
        let input = ([
            ["a","b"]
            ] as [[Character]], "abb")
        XCTAssertFalse(s.exist(input.0, input.1))
    }
    
    func testSample6() {
        let input = ([
            ["C","A","A"],
            ["A","A","A"],
            ["B","C","D"]
        ] as [[Character]],"AAB")
        XCTAssertTrue(s.exist(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
