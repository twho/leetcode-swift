// LeetCode: https://leetcode.com/problems/combination-sum/description/

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard target > 0 else {
            return []
        }
        var output: [[Int]] = []
        for start in candidates {
            var newSeq: [Int] = [start]
            combinationSum(&output, &newSeq, candidates, target - start)
        }
        return output
    }
    
    func combinationSum(_ output: inout [[Int]], _ sequance: inout [Int], _ candidates: [Int], _ target: Int) {
        if target == 0, !output.contains(sequance.sorted()) {
            output.append(sequance.sorted())
            return
        }
        guard target > 0 else { return }
        for i in candidates {
            var temp = sequance
            temp.append(i)
            combinationSum(&output, &temp, candidates, target - i)
        }
    }
}

let solution = Solution()
print(solution.combinationSum([2,3,6,7], 7))
/**
 The output should be:
 [
    [2,2,3]
    [7]
 ]
 */
print(solution.combinationSum([2,3,5], 8))
/**
 The output should be:
 [
    [2,2,2,2]
    [2,3,3]
    [3,5]
 ]
 */
