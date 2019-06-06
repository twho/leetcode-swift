// LeetCode: https://leetcode.com/problems/divide-two-integers/description/

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        var output = dividend / divisor
        output = output > Int32.max ? Int(Int32.max) : output
        output = output < Int32.min ? Int(Int32.min) : output
        return output
    }
}

let solution = Solution()
print(solution.divide(-2147483648, -1)) // 2147483647
