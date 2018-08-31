// LeetCode: https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/description/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var idx = 1
        var count = 1
        var preVal = nums[0]
        while idx < nums.count {
            if nums[idx] == preVal {
                if count == 2 {
                    nums.remove(at: idx)
                } else {
                    count += 1
                    preVal = nums[idx]
                    idx += 1
                }
            } else {
                count = 1
                preVal = nums[idx]
                idx += 1
            }
            
        }
        return nums.count
    }
}

let solution = Solution()
var arr1 = [1,1,1,2,2,3]
print("\(solution.removeDuplicates(&arr1))")
print("\(arr1)")

var arr2 = [0,0,1,1,1,1,2,3,3]
print("\(solution.removeDuplicates(&arr2))")
print("\(arr2)")
