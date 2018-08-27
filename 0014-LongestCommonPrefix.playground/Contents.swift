// LeetCode: https://leetcode.com/problems/longest-common-prefix/description/

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {
            return ""
        }
        var output = Array(strs[0])
        for str in strs {
            if str == "" { return "" } // Handle edge case
            var strArr = Array(str)
            for i in 0..<strArr.count {
                output = output.count > strArr.count ? Array(String(output[0..<strArr.count])) : output
                if i < output.count, output[i] != strArr[i] {
                    output = i > 0 ? Array(String(output[0..<i])) : Array("")
                }
            }
        }
        return String(output)
    }
}

let solution = Solution()
print("\(solution.longestCommonPrefix(["flower","flow","flight"]))")
print("\(solution.longestCommonPrefix(["dog","racecar","car"]))")
print("\(solution.longestCommonPrefix(["aa","a"]))")
print("\(solution.longestCommonPrefix(["aba","ab",""]))")
