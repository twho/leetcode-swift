// LeetCode: https://leetcode.com/problems/longest-substring-with-at-least-k-repeating-characters/description/
// Hint: use rescursive

class Solution {
    func longestSubstring(_ s: String, _ k: Int) -> Int {
        var count = 0
        count = longestSubstring(s, k, count)
        return count
    }
    
    func longestSubstring(_ s: String, _ k: Int, _ count: Int) -> Int {
        guard s.count >= k else {
            return 0
        }
        var strArr = Array(s)
        let set = Set(strArr)
        var breakPt: Character?
        for i in set {
            let check = strArr.filter { $0 == i }
            if check.count < k {
                breakPt = i
                break
            }
        }
    
        if let bp = breakPt, let idx = strArr.index(of: bp) {
            let left = String(strArr[0..<idx])
            let right = String(strArr[idx+1..<strArr.count])
            return max(longestSubstring(left, k, count), longestSubstring(right, k, count), count)
        } else {
            return max(strArr.count, count)
        }
    }
}

let solution = Solution()
print(solution.longestSubstring("aaabb", 3)) // 3
print(solution.longestSubstring("ababbc", 2)) // 5
print(solution.longestSubstring("a", 1)) // 1
print(solution.longestSubstring("bbaaacbd", 3)) // 3
print(solution.longestSubstring("aacbbbdc", 2)) // 3
print(solution.longestSubstring("bababababababababababababababababaabababababaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbcbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", 30))
print(solution.longestSubstring("weitong", 2)) // 0
