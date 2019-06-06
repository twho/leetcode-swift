// LeetCode: https://leetcode.com/problems/middle-of-the-linked-list/description/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var node: ListNode? = head
        var count = 0
        var arr: [ListNode] = []
        while let current = node {
            count += 1
            arr.append(current)
            node = current.next
        }
        return arr[count/2]
    }
}
