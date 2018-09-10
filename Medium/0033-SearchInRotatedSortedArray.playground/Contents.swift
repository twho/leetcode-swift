// LeetCode: https://leetcode.com/problems/search-in-rotated-sorted-array/description/
// Medium

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        return search(nums, target, 0)
    }
    func search(_ nums: [Int], _ target: Int, _ startIdx: Int) -> Int {
        var output = -1
        if nums.count == 1, nums.contains(target) {
            return startIdx
        }
        let midIndex = nums.count / 2
        let leftNums = Array(nums[0..<midIndex])
        let rightNums = Array(nums[midIndex..<nums.count])
        if leftNums.contains(target) {
            output = search(leftNums, target, startIdx)
        } else if rightNums.contains(target) {
            output = search(rightNums, target, startIdx + midIndex)
        }
        return output
    }
}

let solution = Solution()
print("\(solution.search([4,5,6,7,0,1,2], 0))") // 4
print("\(solution.search([4,5,6,7,0,1,2], 3))") // -1
