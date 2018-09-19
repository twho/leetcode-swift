// LeetCode: https://leetcode.com/problems/combination-sum-ii/description/

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var output: [[Int]] = []
        var index = 0
        let sorted = candidates.sorted()
        while index < sorted.count {
            var temp = sorted
            var newSeq = [sorted[index]]
            temp = Array(temp[index+1..<temp.count])
            combinationSum2(&output, &newSeq, temp, target-sorted[index])
            index += 1
            if index < sorted.count, sorted[index - 1] == sorted[index] {
                index += 1
            }
        }
        return output
    }
    
    private func combinationSum2(_ output: inout [[Int]], _ sequence: inout [Int], _ candidates: [Int], _ target: Int) {
        if target == 0, !output.contains(sequence.sorted()) {
            output.append(sequence.sorted())
            return
        }
        guard target > 0 else {
            return
        }
        var index = 0
        while index < candidates.count {
            var temp = sequence
            var remain = candidates
            temp.append(candidates[index])
            remain.remove(at: index)
            combinationSum2(&output, &temp, remain, target - candidates[index])
            index += 1
        }
    }
}

let solution = Solution()
print(solution.combinationSum2([10,1,2,7,6,1,5], 8))
/**
 A solution set is:
 [
    [1, 7],
    [1, 2, 5],
    [2, 6],
    [1, 1, 6]
 ]
 */
print(solution.combinationSum2([2,5,2,1,2], 5))
/**
 A solution set is:
 [
    [1,2,2],
    [5]
 ]
 */
