// LeetCode: https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        var arr = convertToArray(head)
        let index = arr.count - n - 1
        guard index > 0 else {
            return nil
        }
        arr[index].next = arr[index + 2]
        return head
    }
    
    private func convertToArray(_ head: ListNode) -> [ListNode] {
        var node: ListNode? = head
        var arr: [ListNode] = []
        while nil != node {
            arr.append(node!)
            node = node?.next
        }
        return arr
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
solution.removeNthFromEnd(node1, 2)
solution.printLinkedList(node1)
