// LeetCode: https://leetcode.com/problems/toeplitz-matrix/description/

class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        guard matrix.count > 0 else {
            fatalError()
        }
        guard matrix.count > 1 else {
            return true
        }
        var index = 0
        var arrayIdx = 0
        while arrayIdx < matrix.count {
            while index < matrix[arrayIdx].count {
                let num = matrix[arrayIdx][index]
                var movingArrIdx = arrayIdx + 1
                var movingIdx = index + 1
                while movingArrIdx < matrix.count, movingIdx < matrix[movingArrIdx].count {
                    guard matrix[movingArrIdx][movingIdx] == num else {
                        return false
                    }
                    movingArrIdx += 1
                    movingIdx += 1
                }
                index += 1
            }
            index = 0
            arrayIdx += 1
        }
        return true
    }
}

let solution = Solution()
print("\(solution.isToeplitzMatrix([[1,2,3,4],[5,1,2,3],[9,5,1,2]]))") // True
print("\(solution.isToeplitzMatrix([[1,2],[2,2]]))") // False
print("\(solution.isToeplitzMatrix([[36,59,71,15,26,82,87],[56,36,59,71,15,26,82],[15,0,36,59,71,15,26]]))") // False
/**
 For the input above:
 [36,59,71,15,26,82,87]
 [56,36,59,71,15,26,82]
 [15,0,36,59,71,15,26]
 */
