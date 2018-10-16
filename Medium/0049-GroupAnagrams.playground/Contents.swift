// LeetCode: https://leetcode.com/problems/group-anagrams/description/

import XCTest

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var output: [[String]] = []
        var dict: [String : [String]] = [:]
        var idx1 = 0
        while idx1 < strs.count {
            if dict[String(strs[idx1].sorted())] == nil {
                dict[String(strs[idx1].sorted())] = [strs[idx1]]
            } else {
                dict[String(strs[idx1].sorted())]!.append(strs[idx1])
            }
            idx1 += 1
        }
        return Array(dict.values)
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = ["eat","tea","tan","ate","nat","bat"]
        let expected = [["nat","tan"],["bat"],["ate","eat","tea"]]
        let output = s.groupAnagrams(input)
        XCTAssertEqual(output.count, expected.count)
        for o in output {
            XCTAssertTrue(expected.contains(o.sorted()))
        }
    }
    
    func testSample2() {
        let input = ["","",""]
        let expected = [["","",""]]
        let output = s.groupAnagrams(input)
        XCTAssertEqual(output.count, expected.count)
        for o in output {
            XCTAssertTrue(expected.contains(o.sorted()))
        }
    }
}

Tests.defaultTestSuite.run()
