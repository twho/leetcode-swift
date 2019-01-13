/**
 Trie implementation
 
 LeetCode: https://leetcode.com/problems/implement-trie-prefix-tree
 */

class Trie {
    var root: Node
    
    // Initialize your data structure here.
    init() {
        self.root = Node()
    }
    
    // Inserts a word into the trie.
    func insert(_ word: String) {
        var currentNode = self.root
        for ch in word {
            if currentNode.children[ch] == nil {
                currentNode.children[ch] = Node(ch)
            }
            currentNode = currentNode.children[ch]!
        }
        // Only go through to the last node represents a word
        currentNode.isWord = true
    }
    
    // Returns if the word is in the trie.
    func search(_ word: String) -> Bool {
        var currentNode = self.root
        for ch in word {
            if currentNode.children[ch] != nil {
                currentNode = currentNode.children[ch]!
            } else {
                return false
            }
        }
        return currentNode.isWord
    }
    
    // Returns if there is any word in the trie that starts with the given prefix.
    func startsWith(_ prefix: String) -> Bool {
        var currentNode = self.root
        for ch in prefix {
            if currentNode.children[ch] != nil {
                currentNode = currentNode.children[ch]!
            } else {
                return false
            }
        }
        return true
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

// Test cases
let trie = Trie()
trie.insert("apple")
trie.search("apple")   // returns true
trie.search("app")     // returns false
trie.startsWith("app") // returns true
trie.insert("app")
trie.search("app")
