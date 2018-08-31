// LeetCode: https://leetcode.com/problems/integer-to-roman/description/
/**
 Roman integers table
 1 : "I"
 5 : "V"
 10 : "X"
 50 : "L"
 100 : "C"
 500 : "D"
 1000 : "M"
 */

class Solution {
    func intToRoman(_ num: Int) -> String {
        var output = ""
        output.append(thousands(num: num/1000))
        output.append(hundreds(num: num/100-10*(num/1000)))
        output.append(tens(num: num/10-10*(num/100)))
        output.append(ones(num: num/1-10*(num/10)))
        return output
    }
    
    func thousands(num: Int) -> String {
        // Since the input range is 1-3999, mid and high doesn't matter
        return formatter(num: num, low: "M", mid: "", high: "")
    }
    
    func hundreds(num: Int) -> String {
        return formatter(num: num, low: "C", mid: "D", high: "M")
    }
    
    func tens(num: Int) -> String {
        return formatter(num: num, low: "X", mid: "L", high: "C")
    }
    
    func ones(num: Int) -> String {
        return formatter(num: num, low: "I", mid: "V", high: "X")
    }
    
    private func formatter(num: Int, low: String, mid: String, high: String) -> String {
        switch num {
        case 1:
            return low
        case 2:
            return low + low
        case 3:
            return low + low + low
        case 4:
            return low + mid
        case 5:
            return mid
        case 6:
            return mid + low
        case 7:
            return mid + low + low
        case 8:
            return mid + low + low + low
        case 9:
            return low + high
        default:
            return ""
        }
    }
}

let solution = Solution()
print("\(solution.intToRoman(3))")
print("\(solution.intToRoman(4))")
print("\(solution.intToRoman(9))")
print("\(solution.intToRoman(58))")
print("\(solution.intToRoman(1994))")
