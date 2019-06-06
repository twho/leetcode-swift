// LeetCode: https://leetcode.com/problems/plus-one/description/
// Difficulty: Easy

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var output: [Int] = digits
        var index = digits.count - 1
        output[index] += 1 // Add one
        var addOne: Bool = output[index] >= 10
        while index >= 0 {
            output[index] += addOne ? 1 : 0
            addOne = output[index] >= 10
            output[index] = output[index] >= 10 ? 0 : output[index]
            index -= 1
        }
        if addOne {
            output.insert(1, at: 0)
        }
        return output
    }
}

let solution = Solution()
print("\(solution.plusOne([1,2,3]))") // [1,2,4]
print("\(solution.plusOne([4,3,2,2]))") // [4,3,2,3]
print("\(solution.plusOne([4,5,9,9]))") // [4,6,0,0]
print("\(solution.plusOne([7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6]))") // Check runtime
print("\(solution.plusOne([9]))") // [1,0]
