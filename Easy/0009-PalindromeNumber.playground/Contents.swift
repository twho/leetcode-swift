// LeetCode: https://leetcode.com/problems/palindrome-number/description/

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        guard x >= 10 else { return true }
        
        var num = x
        var reverse = 0
        while num != 0 {
            let temp = num % 10
            num = num / 10
            reverse = reverse * 10 + temp
        }
        
        return reverse == x
    }
}

let solution = Solution()
print("\(solution.isPalindrome(121))")
print("\(solution.isPalindrome(-121))")
print("\(solution.isPalindrome(10))")

