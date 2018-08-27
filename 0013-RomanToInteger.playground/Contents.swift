// LeetCode: https://leetcode.com/problems/roman-to-integer/description/

class Solution {
    func romanToInt(_ s: String) -> Int {
        var output = 0
        var strArr = Array(s)
        for index in 0..<strArr.count {
            var numToAdd = mapToInt(strArr[index])
            if index+1 < strArr.count, mapToInt(strArr[index+1]) > mapToInt(strArr[index]) {
                numToAdd = numToAdd * -1
            }
            output += numToAdd
        }
        
        return output
    }
    
    private func mapToInt(_ char: Character) -> Int {
        switch char {
        case "M":
            return 1000
        case "D":
            return 500
        case "C":
            return 100
        case "L":
            return 50
        case "X":
            return 10
        case "V":
            return 5
        case "I":
            return 1
        default:
            return 0
        }
    }
}

let solution = Solution()
print("\(solution.romanToInt("III"))")
print("\(solution.romanToInt("IV"))")
print("\(solution.romanToInt("IX"))")
print("\(solution.romanToInt("LVIII"))")
print("\(solution.romanToInt("MCMXCIV"))")
