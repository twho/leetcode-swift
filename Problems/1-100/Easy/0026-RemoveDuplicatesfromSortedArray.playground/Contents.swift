// LeetCode: https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var dict: [Int:Int] = [:]
        var newNums: [Int] = []
        for num in nums {
            if dict[num] == nil {
                dict[num] = 1
                newNums.append(num)
            }
        }
        nums = newNums
        return dict.count
    }
}

let solution = Solution()
var arr1 = [0,0,1,1,1,2,2,3,3,4]
print("\(solution.removeDuplicates(&arr1))")
print("\(arr1)")

var arr2 = [1,1,2]
print("\(solution.removeDuplicates(&arr2))")
print("\(arr2)")
