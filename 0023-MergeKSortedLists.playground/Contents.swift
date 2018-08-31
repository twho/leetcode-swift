// LeetCode: https://leetcode.com/problems/merge-k-sorted-lists/description/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var arr: [Int] = []
        for head in lists {
            arr = arr + toArray(head)
        }
        arr = arr.sorted()
        return toLinkedList(arr: arr)
    }
    private func toArray(_ head: ListNode?) -> [Int] {
        guard nil != head else {
            return []
        }
        var arr: [Int] = []
        var node = head
        while nil != node {
            arr.append((node?.val)!)
            node = node?.next
        }
        return arr
    }
    private func toLinkedList(arr: [Int]) -> ListNode? {
        guard arr.count > 0 else {
            return nil
        }
        guard arr.count > 1 else {
            return ListNode(arr[0])
        }
        var head = ListNode(arr[0])
        var node: ListNode? = ListNode(arr[1])
        head.next = node
        var index = 1
        while index + 1 < arr.count {
            node?.next = ListNode(arr[index+1])
            node = node?.next
            index += 1
        }
        return head
    }
}
