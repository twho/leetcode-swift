// LeetCode: https://leetcode.com/problems/search-insert-position/description/

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var output = 0
        for i in 0..<nums.count {
            if target > nums[i] {
                output = i + 1
            } else if target == nums[i] {
                output = i
            }
        }
        return output
    }
}

let solution = Solution()
print(solution.searchInsert([1,3,5,6], 5)) // 2
print(solution.searchInsert([1,3,5,6], 2)) // 1
print(solution.searchInsert([1,3,5,6], 7)) // 4
print(solution.searchInsert([1,3,5,6], 0)) // 0
