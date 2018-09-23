// LeetCode: https://leetcode.com/problems/maximum-product-subarray/description/

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums[0]
        }
        var output = nums[0]
        maxProduct(nums, &output)
        if nums.contains(0), output < 0 {
            return 0
        }
        return output
    }
    
    private func maxProduct(_ nums: [Int], _ count: inout Int) -> Int {
        guard nums.count > 1 else {
            return nums[0]
        }
        
        var breakIdx: [Int] = []
        if nums.contains(0) {
            breakIdx.append(nums.index(of: 0)!)
        } else if nums.filter({  $0 < 0  }).count % 2 != 0 {
            let negative = nums.filter({  $0 < 0  })
            for i in negative {
                breakIdx.append(nums.index(of: i)!)
            }
        }
        
        if breakIdx.count > 0 {
            for bIdx in breakIdx {
                if bIdx == 0 {
                    count = max(maxProduct(Array(nums[bIdx+1..<nums.count]), &count), count)
                } else if bIdx == nums.count - 1 {
                    count = max(maxProduct(Array(nums[0..<bIdx]), &count), count)
                } else {
                    count = max(maxProduct(Array(nums[0..<bIdx]), &count), maxProduct(Array(nums[bIdx+1..<nums.count]), &count), count)
                }
            }
        } else {
            var sum = 1
            nums.forEach {
                sum = sum * $0
            }
            count = max(count, sum)
        }
        return count
    }
}

let s = Solution()
print(s.maxProduct([2,3,-2,4])) // 6
print(s.maxProduct([-2,0,-1])) // 0
print(s.maxProduct([-2,0])) // 0
print(s.maxProduct([0,2])) // 2
print(s.maxProduct([2,0])) // 2
print(s.maxProduct([-2])) // -2
print(s.maxProduct([-4,-3,-2])) // 12
print(s.maxProduct([2,-5,-2,-4,3])) // 24
