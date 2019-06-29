// LeetCode: https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/

import XCTest

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    
    // Valid solution beats 98.74%
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var node: ListNode? = head
        var pre: ListNode?
        var output = head
        while node != nil {
            var hasDuplicate = false
            while node?.next?.val == node?.val {
                node = node?.next
                hasDuplicate = true
            }
            if !hasDuplicate {
                pre = node
            } else {
                pre?.next = node?.next
            }
            node = node?.next
            if pre == nil {
                output = node
            }
        }
        return output
    }
}
