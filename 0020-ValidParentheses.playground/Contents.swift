// LeetCode: https://leetcode.com/problems/valid-parentheses/description/

class Solution {
    func isValid(_ s: String) -> Bool {
        var arr: [Character] = []
        for c in s {
            switch c {
            case "(", "[", "{":
                arr.append(c)
            case ")":
                let char = pop(&arr)
                if nil == char || char != "(" {
                    return false
                }
            case "]":
                let char = pop(&arr)
                if nil == char || char != "[" {
                    return false
                }
            case "}":
                let char = pop(&arr)
                if nil == char || char != "{" {
                    return false
                }
            default:
                break
            }
        }
        return arr.count == 0
    }
    
    private func pop(_ arr: inout [Character]) -> Character? {
        guard arr.count > 0 else {
            return nil
        }
        return arr.remove(at: arr.count-1)
    }
}

let solution = Solution()
print("\(solution.isValid("()"))")
print("\(solution.isValid("()[]{}"))")
print("\(solution.isValid("(]"))")
print("\(solution.isValid("([)]"))")
print("\(solution.isValid("{[]}"))")
print("\(solution.isValid("["))")
