// LeetCode: https://leetcode.com/problems/reverse-linked-list/description/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        var currentNode: ListNode? = head
        var prev: ListNode? = nil // The previous node of head is nil
        while nil != currentNode {
            let next: ListNode? = currentNode?.next
            currentNode?.next = prev
            prev = currentNode
            currentNode = next
        }
        return prev
    }
    
    func printLinkedList(_ head: ListNode) {
        var printedStr = ""
        var currentNode: ListNode? = head
        while nil != currentNode {
            printedStr.append("\(currentNode?.val ?? -1)")
            if nil != currentNode?.next {
                printedStr.append(", ")
            }
            currentNode = currentNode?.next
        }
        print(printedStr)
    }
}

let solution = Solution()
let node5 = ListNode(5, nil)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)
solution.printLinkedList(node1)

// Reverse Linked List
print("Reversed below:")
solution.printLinkedList(solution.reverseList(node1)!)
