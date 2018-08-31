// LeetCode: https://leetcode.com/problems/zigzag-conversion/description/

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        var output = ""
        let divide = 2 * numRows - 2
        guard divide > 1 else {
            return s
        }
        var dict: [Int:String] = [:]
        
        for (index, char) in s.enumerated() {
            let dictIdx = (index % divide) < numRows ? (index % divide) + 1 : numRows - ((index % divide) + 1 - numRows)
            if nil != dict[dictIdx] {
                dict[dictIdx]!.append(char)
            } else {
                dict[dictIdx] = String(char)
            }
        }
        for i in 1...dict.count {
            output.append(dict[i]!)
        }
        return output
    }
}

let solution = Solution()
print("\(solution.convert("PAYPALISHIRING", 3))")
print("\(solution.convert("PAYPALISHIRING", 4))")
