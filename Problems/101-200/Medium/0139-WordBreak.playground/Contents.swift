// Leetcode: https://leetcode.com/problems/word-break/
// Need to do again, only beats 58.82% Swift submissions.

import XCTest

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        guard wordDict.count > 0 else {
            return false
        }

        let trie = Trie()
        for str in wordDict {
            trie.insert(str)
        }

        let strArr = Array(s)
        var fail = Set<String>()
        return trie.search(strArr, &fail)
    }
}

class Trie {
    var root: Node

    init() {
        self.root = Node()
    }

    func insert(_ data: String) {
        var current = root
        for ch in data {
            if current.children[ch] == nil {
                current.children[ch] = Node(ch)
            }
            current = current.children[ch]!
        }
        current.isWord = true
    }

    func search(_ data: [Character], _ fail: inout Set<String>) -> Bool {
        if data.count == 0 {
            return true
        }
        if fail.contains(String(data)) {
            return false
        }

        var current = root
        var index = 0

        while index < data.count {
            if let node = current.children[data[index]] {
                current = node
            } else {
                fail.insert(String(data))
                return false
            }

            if current.isWord {
                if fail.contains(String(data)) {
                    continue
                } else {
                    if index + 1 == data.count || search(Array(data[index+1..<data.count]), &fail) {
                        return true
                    }
                }
            }
            index += 1
        }
        fail.insert(String(data))
        return false
    }
}

class Node {
    var data: Character
    var children: [Character : Node]
    var isWord = false
    
    init() {
        self.data = "*"
        self.children = [:]
    }
    
    init(_ data: Character) {
        self.data = data
        self.children = [:]
    }
}

class Tests: XCTestCase {
    let s = Solution()
    
    func testSample1() {
        let input = (s: "leetcode", wordDict: ["leet", "code"])
        XCTAssertTrue(s.wordBreak(input.s, input.wordDict))
    }

    func testSample2() {
        let input = (s: "applepenapple", wordDict: ["apple", "pen"])
        XCTAssertTrue(s.wordBreak(input.s, input.wordDict))
    }

    func testSample3() {
        let input = (s: "catsandog", wordDict: ["cats", "dog", "sand", "and", "cat"])
        XCTAssertFalse(s.wordBreak(input.s, input.wordDict))
    }

    func testSample4() {
        let input = (s: "aaaaaaa", wordDict: ["aaaa", "aa"])
        XCTAssertFalse(s.wordBreak(input.s, input.wordDict))
    }
    
    func testSample5() {
        let input = (s: "aaaaaaa", wordDict: ["aaaa", "aaa"])
        XCTAssertTrue(s.wordBreak(input.s, input.wordDict))
    }
    
    func testSample6() {
        let input = (s: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab", wordDict: ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"])
        XCTAssertFalse(s.wordBreak(input.s, input.wordDict))
    }
}

Tests.defaultTestSuite.run()
