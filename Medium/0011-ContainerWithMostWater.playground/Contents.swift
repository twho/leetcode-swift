// LeetCode: https://leetcode.com/problems/container-with-most-water/description/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var area = 0
        var start = 0
        var end = height.count - 1
        while start < end {
            let areaH = min(height[start], height[end])
            let width = end - start
            if areaH * width > area {
                area = areaH * width
            }
            if height[start] < height[end] {
                start += 1
            } else {
                end -= 1
            }
        }
        return area
    }
}

let solution = Solution()
print("\(solution.maxArea([1,8,6,2,5,4,8,3,7]))") // 49
