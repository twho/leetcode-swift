// LeetCode: https://leetcode.com/problems/4sum/description/
// Difficulty: Medium
// O(n^3) is acceptable

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var output: [[Int]] = []
        var sortedNums = nums.sorted()
        for idx1 in 0..<sortedNums.count {
            for idx2 in (idx1+1)..<sortedNums.count {
                var start = idx2 + 1
                var end = sortedNums.count - 1
                let comp = target - sortedNums[idx1] - sortedNums[idx2]
                while start < end {
                    if comp == sortedNums[start] + sortedNums[end], !output.contains([sortedNums[idx1], sortedNums[idx2], sortedNums[start], sortedNums[end]]) {
                        output.append([sortedNums[idx1], sortedNums[idx2], sortedNums[start], sortedNums[end]])
                        if end - start == 2 {
                            start += 1
                            continue
                        }
                        start += 1
                        end -= 1
                    } else if comp > sortedNums[start] + sortedNums[end] {
                        start += 1
                    } else {
                        end -= 1
                    }
                }
            }
        }
        return output
    }
}

let solution = Solution()
print("\(solution.fourSum([1, 0, -1, 0, -2, 2], 0))")
/**
 // Sorted: [-2, -1, 0, 0, 1, 2]
 [
 [-1,  0, 0, 1],
 [-2, -1, 1, 2],
 [-2,  0, 0, 2]
 ]
 */
print("\(solution.fourSum([-1, 0, -5, -2, -2, -4, 0, 1, -2], -9))")
/**
 // Sorted: [-5, -4, -2, -2, -2, -1, 0, 0, 1]
 [
 [-5,-4,-1,1],
 [-5,-4,0,0],
 [-5,-2,-2,0],
 [-4,-2,-2,-1]
 ]
 */
print("\(solution.fourSum([0, 0, 0, 0], 0))")
/**
 [
 [0, 0, 0, 0]
 ]
 */
print("\(solution.fourSum([-3,-2,-1,0,0,1,2,3], 0))")
/**
 [
 [-3, -2, 2, 3],
 [-3, -1, 1, 3],
 [-3, 0, 0, 3],
 [-3, 0, 1, 2],
 [-2, -1, 0, 3],
 [-2, -1, 1, 2],
 [-2, 0, 0, 2],
 [-1, 0, 0, 1]
 ]
 */
