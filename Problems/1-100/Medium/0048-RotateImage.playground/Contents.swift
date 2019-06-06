// LeetCode: https://leetcode.com/problems/rotate-image/description/
// Reference: https://leetcode.com/problems/rotate-image/discuss/18872/A-common-method-to-rotate-the-image
// Difficulty: Medium

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        guard matrix.count > 1 else {
            return
        }
        matrix.reverse()
        var i = 0
        var j = 0
        while i < matrix.count {
            j = i
            while j < matrix[i].count {
                (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
                j += 1
            }
            i += 1
        }
    }
}

let solution = Solution()
var image1 = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]
solution.rotate(&image1)
print("\(image1))")
/** output
 [
 [7,4,1],
 [8,5,2],
 [9,6,3]
 ]
 */
var image2 = [
    [ 5, 1, 9,11],
    [ 2, 4, 8,10],
    [13, 3, 6, 7],
    [15,14,12,16]
]
solution.rotate(&image2)
print("\(image2)")
/** output
 [
 [15,13, 2, 5],
 [14, 3, 4, 1],
 [12, 6, 8, 9],
 [16, 7,10,11]
 ]
 */
