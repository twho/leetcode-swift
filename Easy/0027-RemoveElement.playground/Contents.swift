// LeetCode: https://leetcode.com/problems/remove-element/description/

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter { $0 != val }
        return nums.count
    }
}

let solution = Solution()
var arr1 = [3,2,2,3]
print("\(solution.removeElement(&arr1, 3))") // 2
print(arr1)
var arr2 = [0,1,2,2,3,0,4,2]
print("\(solution.removeElement(&arr2, 2))") // 5
print(arr2)
