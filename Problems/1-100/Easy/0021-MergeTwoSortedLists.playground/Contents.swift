// LeetCode: https://leetcode.com/problems/merge-two-sorted-lists/description/

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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil || l2 != nil else {
            return nil
        }
        if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        }
        
        var l1 = l1
        var l2 = l2
        var value: Int!
        if (l1?.val)! < (l2?.val)! {
            value = (l1?.val)!
            l1 = l1?.next
        } else {
            value = (l2?.val)!
            l2 = l2?.next
        }
        var head = ListNode(value)
        var node: ListNode? = head
        
        while l1 != nil || l2 != nil {
            if l1 == nil {
                node?.next = l2
                break
            } else if l2 == nil {
                node?.next = l1
                break
            }
            
            if (l1?.val)! < (l2?.val)! {
                node?.next = ListNode((l1?.val)!)
                l1 = l1?.next
            } else {
                node?.next = ListNode((l2?.val)!)
                l2 = l2?.next
            }
            node = node?.next
        }
        return head
    }
}
