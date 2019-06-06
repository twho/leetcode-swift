// LeetCode: https://leetcode.com/problems/implement-strstr/description/

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        var index = -1
        guard needle.count > 0 else {
            return 0
        }
        var nArr = Array(needle)
        var hArr = Array(haystack)
        for (idx, c) in hArr.enumerated() {
            if c == nArr[0], idx + (nArr.count) <= hArr.count, String(hArr[idx..<idx + (nArr.count)]) == needle {
                index = idx
                break
            }
        }
        return index
    }
}

let solution = Solution()
print(solution.strStr("hello", "ll")) // 2
print(solution.strStr("aaa", "aa")) // 0
print(solution.strStr("aaa", "a")) // 0
print(solution.strStr("", "")) // 0
print(solution.strStr("a", "a")) // 0
