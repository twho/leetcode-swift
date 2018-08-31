// LeetCode: https://leetcode.com/problems/reverse-integer/description/
import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        var temp = abs(x)
        var output = 0
        while temp > 0 {
            var tail = temp % 10
            temp = temp / 10
            output = output * 10 + tail
            if (output > Int32.max || output < Int32.min) { return 0 }
        }
        
        return output * x.signum() // Times back the sign of the original number
    }
    
    func mySqrt(_ x: Int) -> Int {
        return Int(sqrt(Double(x)))
        
    }
}

let solution = Solution()
print("\(solution.reverse(-123))")
print("\(solution.mySqrt(8))")
