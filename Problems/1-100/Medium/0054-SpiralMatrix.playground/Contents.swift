// LeetCode: https://leetcode.com/problems/spiral-matrix/

import XCTest

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard matrix.count > 0 else { return [] }
        
        var output = [Int]()
        var visited = Array(repeating: Array(repeating: false, count: matrix[0].count), count: matrix.count)
        goThrough(matrix, (0, 0), 0, &visited, &output)
        return output
    }
    
    private func goThrough(_ matrix: [[Int]], _ origin: (x: Int, y: Int), _ dir: Int, _ visited: inout [[Bool]], _ output: inout [Int]) {
        var end = (x: origin.x, y: origin.y)
        switch dir {
        case 0: // toRight
            var idx = origin.y
            while idx < matrix[origin.x].count {
                if !visited[origin.x][idx] {
                    output.append(matrix[origin.x][idx])
                    visited[origin.x][idx] = true
                    end = (origin.x, idx)
                } else {
                    break
                }
                idx += 1
            }
        case 1: // toBottom
            var idx = origin.x
            while idx < matrix.count {
                if !visited[idx][origin.y] {
                    output.append(matrix[idx][origin.y])
                    visited[idx][origin.y] = true
                    end = (idx, origin.y)
                } else {
                    break
                }
                idx += 1
            }
        case 2: // toLeft
            var idx = origin.y
            while idx >= 0 {
                if !visited[origin.x][idx] {
                    output.append(matrix[origin.x][idx])
                    visited[origin.x][idx] = true
                    end = (origin.x, idx)
                } else {
                    break
                }
                idx -= 1
            }
        case 3: // toTop
            var idx = origin.x
            while idx >= 0 {
                if !visited[idx][origin.y] {
                    output.append(matrix[idx][origin.y])
                    visited[idx][origin.y] = true
                    end = (idx, origin.y)
                } else {
                    break
                }
                idx -= 1
            }
        default: break
        }
        
        let newDir = (dir+1)%4
        print(end)
        switch newDir {
        case 0:
            end.y += 1
            if end.y < matrix[end.x].count, !visited[end.x][end.y] {
                goThrough(matrix, end, newDir, &visited, &output)
            }
        case 1:
            end.x += 1
            if end.x < matrix.count, !visited[end.x][end.y] {
                goThrough(matrix, end, newDir, &visited, &output)
            }
        case 2:
            end.y -= 1
            if end.y >= 0, !visited[end.x][end.y] {
                goThrough(matrix, end, newDir, &visited, &output)
            }
        case 3:
            end.x -= 1
            if end.x >= 0, !visited[end.x][end.y] {
                goThrough(matrix, end, newDir, &visited, &output)
            }
        default:
            break
        }
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = [
            [ 1, 2, 3 ],
            [ 4, 5, 6 ],
            [ 7, 8, 9 ]
        ]
        let expected = [1,2,3,6,9,8,7,4,5]
        XCTAssertEqual(expected, s.spiralOrder(input))
    }
    
    func testSample2() {
        let input = [
            [1, 2, 3, 4],
            [5, 6, 7, 8],
            [9,10,11,12]
        ]
        let expected = [1,2,3,4,8,12,11,10,9,5,6,7]
        XCTAssertEqual(expected, s.spiralOrder(input))
    }
}

Tests.defaultTestSuite.run()
