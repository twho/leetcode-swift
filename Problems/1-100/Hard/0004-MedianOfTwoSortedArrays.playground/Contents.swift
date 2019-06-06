// LeetCode: https://leetcode.com/problems/median-of-two-sorted-arrays/description/
// Hint: merge sort

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var leftIndex = 0
        var rightIndex = 0
        var results: [Int] = []
        
        var shouldSort = true
        while shouldSort {
            if leftIndex >= nums1.count {
                results.append(contentsOf: Array(nums2[rightIndex..<nums2.count]))
                shouldSort = false
                break
            }
            
            if rightIndex >= nums2.count {
                results.append(contentsOf: Array(nums1[leftIndex..<nums1.count]))
                shouldSort = false
                break
            }
            
            if nums1[leftIndex] > nums2[rightIndex] {
                results.append(nums2[rightIndex])
                rightIndex += 1
            } else {
                results.append(nums1[leftIndex])
                leftIndex += 1
            }
        }
        
        if results.count % 2 == 0 {
            return Double(results[results.count/2 - 1] + results[results.count/2])/2
        } else {
            return Double(results[results.count/2])
        }
    }
}

// Test
let solution = Solution()
print("\(solution.findMedianSortedArrays([1, 3], [2, 4]))")
print("\(solution.findMedianSortedArrays([1, 3], [2]))")
