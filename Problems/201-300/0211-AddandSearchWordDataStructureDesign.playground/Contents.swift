// LeetCode: https://leetcode.com/problems/add-and-search-word-data-structure-design/

import XCTest

class WordDictionary {
    var root: Node
    
    // Initialize your data structure here.
    init() {
        root = Node()
    }
    
    // Adds a word into the data structure.
    func addWord(_ word: String) {
        var current = root
        for ch in word {
            if current.children[ch] == nil {
                current.children[ch] = Node(ch)
            }
            current = current.children[ch]!
        }
        current.isWord = true
    }
    
    // Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter.
    func search(_ word: String) -> Bool {
        return search(root, word, 0)
    }
    
    private func search (_ start: Node, _ word: String, _ index: Int) -> Bool {
        if index == word.count {
            return start.isWord
        }
        
        let ch = Array(word)[index]
        if ch == "." {
            for child in start.children.keys {
                let newStart = start.children[child]!
                if search(newStart, word, index + 1) {
                    return true
                }
            }
            return false
        }
        
        if let node = start.children[ch] {
            return search(node, word, index + 1)
        } else {
            return false
        }
    }
}

public class Node {
    var val: Character
    var children: [Character : Node]
    var isWord: Bool
    
    init() {
        self.val = "*"
        self.children = [:]
        self.isWord = false
    }
    
    init(_ val: Character) {
        self.val = val
        self.children = [:]
        self.isWord = false
    }
}

class Tests: XCTestCase {
    
    func testSample1() {
        let wordDict = WordDictionary()
        wordDict.addWord("bad")
        wordDict.addWord("dad")
        wordDict.addWord("mad")

        XCTAssertFalse(wordDict.search("pad"))
        XCTAssertTrue(wordDict.search("bad"))
        XCTAssertTrue(wordDict.search(".ad"))
        XCTAssertTrue(wordDict.search("b.."))
    }

    func testSample2() {
        let wordDict = WordDictionary()
        wordDict.addWord("a")
        wordDict.addWord("a")
        
        XCTAssertTrue(wordDict.search("."))
        XCTAssertTrue(wordDict.search("a"))
        XCTAssertFalse(wordDict.search("aa"))
        XCTAssertTrue(wordDict.search("a"))
        XCTAssertFalse(wordDict.search(".a"))
        XCTAssertFalse(wordDict.search("a."))
    }
    
    func testSample3() {
        let wordDict = WordDictionary()
        wordDict.addWord("a")
        wordDict.addWord("ab")
        
        XCTAssertTrue(wordDict.search("a"))
        XCTAssertTrue(wordDict.search("a."))
        XCTAssertTrue(wordDict.search("ab"))
        XCTAssertFalse(wordDict.search(".a"))
        XCTAssertTrue(wordDict.search(".b"))
        XCTAssertFalse(wordDict.search("ab."))
        XCTAssertTrue(wordDict.search("."))
        XCTAssertTrue(wordDict.search(".."))
    }
}

Tests.defaultTestSuite.run()
