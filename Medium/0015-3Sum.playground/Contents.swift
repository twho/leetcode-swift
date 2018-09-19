// LeetCode: https://leetcode.com/problems/3sum/description/
// Hint: Start from TwoSum, use sorting

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        let sort = nums.sorted()
        var output: [[Int]] = []
        for i in 0..<sort.count - 2 {
            if i > 0, sort[i] == sort[i-1] {
                continue
            }
            var start = i + 1
            var end = sort.count - 1
            while start < end {
                if sort[i] + sort[start] + sort[end] == 0 {
                    output.append([sort[i], sort[start], sort[end]])
                    start += 1
                    end -= 1
                } else if sort[i] + sort[start] + sort[end] < 0 {
                    start += 1
                } else {
                    end -= 1
                }
                if start - 1 >= 0 && sort[start] == sort[start - 1] {
                    start += 1
                    continue
                }
                if end + 1 < sort.count && sort[end] == sort[end + 1] {
                    end -= 1
                    continue
                }
            }
        }
        return output
    }
}

let solution = Solution()
print("\(solution.threeSum([-1, 0, 1, 2, -1, -4]))")
print("---------------------------------")
/**
 The solution set is:
 [
    [-1, 0, 1],
    [-1, -1, 2]
 ]
 */
print("\(solution.threeSum([-1,0,1,0]))")
print("---------------------------------")
/**
 The solution set is:
 [
    [-1, 0, 1]
 ]
 */
print("\(solution.threeSum([3,0,-2,-1,1,2]))")
print("---------------------------------")
/**
 The solution set is:
 [
    [-2, -1, 3],
    [-2, 0, 2],
    [-1, 0, 1]
 ]
 */
print("\(solution.threeSum([-2,0,1,1,2]))")
/**
 The solution set is:
 [
    [-2,0,2],
    [-2,1,1]
 ]
 */
print("\(solution.threeSum([1,1,1]))") // [[]]
let longArray1 = [-2,10,-14,11,5,-4,2,0,-10,-10,5,7,-11,10,-2,-5,2,12,-5,14,-11,-15,-5,12,0,13,8,7,10,6,-9,-15,1,14,11,-9,-13,-10,6,-8,-5,-11,6,-9,14,11,-7,-6,8,3,-7,5,-5,3,2,10,-6,-12,3,11,1,1,12,10,-8,0,8,-5,6,-8,-6,8,-12,-14,7,9,12,-15,-12,-2,-4,-4,-12,6,7,-3,-6,-14,-8,4,4,9,-10,-7,-4,-3,1,11,-1,-8,-12,9,7,-9,10,-1,-14,-1,-8,11,12,-5,-7]
print(longArray1.count)
print("\(solution.threeSum(longArray1))") // Test time limit
print("---------------------------------")
let longArray2 = [12,-14,-5,12,-2,9,0,9,-3,-3,-14,-6,-4,13,-11,-8,0,5,-7,-6,-10,-13,-7,-14,-3,0,12,5,-8,7,3,-11,0,6,9,13,-8,-6,7,4,6,0,13,-13,-1,9,-13,6,-1,-13,-15,-4,-11,-15,-11,-7,1,-14,13,8,0,2,4,-15,-15,-2,5,-8,7,-11,11,-10,4,1,-15,10,-5,-13,2,1,11,-6,4,-15,-5,8,-7,3,1,-9,-4,-14,0,-15,8,0,-1,-2,7,13,2,-5,11,13,11,11]
print(longArray2.count)
print("\(solution.threeSum(longArray2))") // Test time limit
print("---------------------------------")
