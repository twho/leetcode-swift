// LeetCode: https://leetcode.com/problems/maximum-subarray/description/

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var max = nums[0]
        for i in 0..<nums.count {
            var current = nums[i]
            max = current > max ? current : max
            var index = i + 1
            while index < nums.count {
                current += nums[index]
                max = current > max ? current : max
                index += 1
            }
        }
        return max
    }
}

let solution = Solution()
print(solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])) // 6
print(solution.maxSubArray([-2,1])) // 1
