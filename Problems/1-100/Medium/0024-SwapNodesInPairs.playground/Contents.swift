// LeetCode: https://leetcode.com/problems/swap-nodes-in-pairs/description/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        // Handle edge case
        guard let _ = head.next else {
            return head
        }
        var node: ListNode? = head
        let newHead = node?.next
        var prev: ListNode?
        // Loop every two nodes
        while let current = node, let next = node?.next {
            // Change first node
            current.next = next.next
            // Move 2 indices
            node = next.next
            // Change second node
            next.next = current
            // Change the previous node of this pair
            prev?.next = next
            // Capture current node
            prev = current
        }
        return newHead
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
print("swap below:")
solution.printLinkedList(solution.swapPairs(node1)!)
