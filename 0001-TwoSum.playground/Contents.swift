// LeetCode: https://leetcode.com/problems/two-sum/description/
// Solution: https://github.com/zhubofei/LeetCode-Swift/blob/master/0001-two-sum.playground/Contents.swift

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict: [Int: Int] = [:] // [number : indexPosition]
    for (index, num) in nums.enumerated() {
        let complement = target - num
        if let compIndex = dict[complement] {
            return [index, compIndex]
        }
        dict[num] = index
    }
    fatalError()
}
