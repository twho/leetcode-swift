// LeetCode: https://leetcode.com/problems/letter-combinations-of-a-phone-number/description/

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        var output: [String] = []
        var dict = [
            "2": "abc",
            "3": "def",
            "4": "ghi",
            "5": "jkl",
            "6": "mno",
            "7": "pqrs",
            "8": "tuv",
            "9": "wxyz",
            ]
        for digit in digits {
            if let str = dict[String(digit)] {
                appendStr(output: &output, toAppend: str)
            }
        }
        return output
    }
    
    func appendStr(output: inout [String], toAppend: String) {
        if output.count == 0 {
            for str in toAppend {
                output.append(String(str))
            }
            return
        }
        let temp = output
        output = []
        for str in toAppend {
            var currentOut = temp
            for index in 0..<currentOut.count {
                currentOut[index].append(str)
                output.append(currentOut[index])
            }
        }
    }
}

let solution = Solution()
print(solution.letterCombinations("23")) // ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
