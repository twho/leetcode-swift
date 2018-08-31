// LeetCode: https://leetcode.com/problems/gas-station/description/

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        // Handle edge case
        if gas.count == 1 {
            return gas[0] >= cost[0] ? 0 : -1
        }
        for start in 0..<gas.count {
            var spareGas = gas[start]
            if spareGas <= cost[start] {
                continue
            } else {
                spareGas -= cost[start]
            }
            innerLoop: for station in 1..<gas.count {
                spareGas += (gas[(start+station)%(gas.count)] - cost[(start+station)%(gas.count)])
                if spareGas < 0 {
                    break innerLoop
                }
                if station == gas.count - 1 {
                    return start // If its the last station in the iterany
                }
            }
        }
        return -1
    }
}

let solution = Solution()
//print("\(solution.canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2]))") // 3
//print("\(solution.canCompleteCircuit([2,3,4], [3,4,3]))") // -1
//print("\(solution.canCompleteCircuit([4,5,3,1,4], [5,4,3,4,2]))") // -1
print("\(solution.canCompleteCircuit([5], [4]))") // 0
