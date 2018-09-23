// LeetCode: https://leetcode.com/problems/number-of-islands/description/
// Hint: recursive/DFS

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        if grid.count == 0 {
            return 0
        }
        var count = 0
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" {
                    DFS(&grid, i, j)
                    count += 1
                }
            }
        }
        return count
    }
    
    private func DFS(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
        if grid[i][j] == "1" {
            grid[i][j] = "0"
            if i-1 >= 0, grid[i-1][j] == "1" {
                DFS(&grid, i-1, j)
            }
            if j-1 >= 0, grid[i][j-1] == "1" {
                DFS(&grid, i, j-1)
            }
            if i+1 < grid.count, grid[i+1][j] == "1" {
                DFS(&grid, i+1, j)
            }
            if j+1 < grid[i].count, grid[i][j+1] == "1" {
                DFS(&grid, i, j+1)
            }
        }
    }
}

let solution = Solution()
let one = Character("1")
let zero = Character("0")
let input1 = [
    [one, one, zero, zero, zero],
    [one, one, zero, zero, zero],
    [zero, zero, one, zero, zero],
    [zero, zero, zero, one, one]
]
/**
 Input:
 11000
 11000
 00100
 00011
 
 Output: 3
 */
print(solution.numIslands(input1))

let input2 = [
    [one, one, one, one, zero],
    [one, one, zero, one, zero],
    [one, one, zero, zero, zero],
    [zero, zero, zero, zero, zero]
]
/**
 Input:
 11110
 11010
 11000
 00000
 
 Output: 1
 */
print(solution.numIslands(input2))

let input3 = [
    [zero, zero, zero, zero, zero],
    [zero, one, one, one, zero],
    [zero, zero, zero, zero, zero],
    [zero, zero, zero, zero, zero]
]
/**
 Input:
 00000
 01110
 00000
 00000
 
 Output: 1
 */
print(solution.numIslands(input3))
