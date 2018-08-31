// LeetCode: https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var dict: [Int:Int] = [:]
        for i in 0..<numbers.count {
            let comp = target - numbers[i]
            if nil != dict[comp] {
                return [dict[comp]! + 1, i + 1]
            }
            dict[numbers[i]] = i
        }
        return []
    }
}

let solution = Solution()
print("\(solution.twoSum([2,7,11,15], 9))") // [1,2]
print("\(solution.twoSum([-1,0], -1))") // [1,2]
print("\(solution.twoSum([2,3,4], 6))") // [1,3]
