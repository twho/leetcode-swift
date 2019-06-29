// LeetCode: https://leetcode.com/problems/custom-sort-string/

import XCTest

class Solution {
    func customSortString(_ S: String, _ T: String) -> String {
        var dict = [Character : Int]()
        for (idx, ch) in S.enumerated() {
            dict[ch] = idx
        }
        var output = Array(T)
        output = sort(output, 0, output.count-1, dict)
        return String(output)
    }
    
    private func sort(_ current: [Character], _ start: Int, _ end: Int, _ dict: [Character : Int]) -> [Character] {
        if start == end {
            return [current[start]]
        }
        
        let mid = start + (end-start)/2
        let left = sort(current, start, mid, dict)
        let right = sort(current, mid+1, end, dict)
        
        var leftIdx = 0
        var rightIdx = 0
        var output = [Character]()
        while leftIdx < left.count && rightIdx < right.count {
            if let leftPos = dict[left[leftIdx]], let rightPos = dict[right[rightIdx]] {
                if leftPos < rightPos {
                    output.append(left[leftIdx])
                    leftIdx += 1
                } else {
                    output.append(right[rightIdx])
                    rightIdx += 1
                }
            } else if let leftPos = dict[left[leftIdx]] {
                output.append(left[leftIdx])
                leftIdx += 1
            } else {
                output.append(right[rightIdx])
                rightIdx += 1
            }
        }
        
        if leftIdx < left.count {
            output.append(contentsOf: Array(left[leftIdx..<left.count]))
        } else {
            output.append(contentsOf: Array(right[rightIdx..<right.count]))
        }
        
        return output
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ("cba", "abcd")
        let expected = "cbad"
        XCTAssertEqual(expected, s.customSortString(input.0, input.1))
    }
}

Tests.defaultTestSuite.run()
