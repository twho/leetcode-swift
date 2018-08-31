// LeetCode: https://leetcode.com/problems/3sum-closest/description/
// Simple math

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var sortedN = nums.sorted()
        var pairs: [Int: [Int]] = [:]
        var i = 0
        while i < sortedN.count {
            var k = i + 1
            while k < sortedN.count {
                let comp = target - sortedN[k] - sortedN[i]
                if nil == pairs[comp] {
                    pairs[comp] = [i, k]
                }
                k += 1
            }
            i += 1
        }
        var output: Int?
        var third = 0
        while third < sortedN.count {
            for pair in pairs {
                if !pair.value.contains(third) {
                    if pair.key == sortedN[third] {
                        return target
                    } else {
                        if nil == output {
                            output = target - pair.key + sortedN[third]
                        } else if abs(pair.key - sortedN[third]) < abs(target - output!) {
                            output = target - pair.key + sortedN[third]
                        }
                    }
                }
            }
            third += 1
        }
        return output!
    }
}

let solution = Solution()
print("\(solution.threeSumClosest([-1, 2, 1, -4], 1))")   // 2
print("\(solution.threeSumClosest([-3,-2,-5,3,-4], -1))") // -2
