// LeetCode: https://leetcode.com/problems/sort-list/description/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard nil != head else {
            return nil
        }
        guard nil != head?.next else {
            return head
        }
        let sortedArr = converToSortedArray(head: head!)
        var currentNode: ListNode? = ListNode(sortedArr[0], nil)
        let newHead = currentNode
        var cursor = 1
        while cursor < sortedArr.count {
            currentNode?.next = ListNode(sortedArr[cursor], nil)
            currentNode = currentNode?.next
            cursor += 1
        }
        
        return newHead
    }
    
    private func converToSortedArray(head: ListNode) -> [Int] {
        var array: [Int] = []
        var currentNode: ListNode? = head
        while nil != currentNode {
            array.append((currentNode?.val)!)
            currentNode = currentNode?.next
        }
        array.sort()
        return array
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
let node4 = ListNode(3, nil)
let node3 = ListNode(1, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(4, node2)
solution.printLinkedList(node1)
print("\(solution.printLinkedList(solution.sortList(node1)!))")

let node9 = ListNode(0, nil)
let node8 = ListNode(4, node9)
let node7 = ListNode(3, node8)
let node6 = ListNode(5, node7)
let node5 = ListNode(-1, node6)
solution.printLinkedList(node5)
print("\(solution.printLinkedList(solution.sortList(node5)!))")
